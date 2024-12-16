import 'dart:async';
import 'dart:convert';

import 'package:era_pro_application/src/core/constants/share_pref_keys.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:era_pro_application/src/core/services/shared_preferences.dart';

import '../error/error.dart';

typedef ReturnData = Future<Map<String, dynamic>>;

class HttpMethod {
  final http.Client client;
  HttpMethod({required this.client});

  final SharedPreferencesService _sharedPreferencesService = Get.find();
  Future<T> post<T>(Map<String, dynamic> body, String url) async {
    print('body : $body');
    try {
      final token =
          _sharedPreferencesService.getString(SharedPrefKeys.TOKEN_KEY);

      final timeoutDuration = url.endsWith("syncdata/items")
          ? const Duration(seconds: 30)
          : const Duration(seconds: 10);
      final response = await client
          .post(
            Uri.parse(url),
            headers: {
              'Authorization': 'Bearer $token',
              'Content-Type': 'application/json',
            },
            body: jsonEncode(body),
          )
          .timeout(
            timeoutDuration,
            onTimeout: () => throw TimeoutException("Request timed out"),
          );

      print('response : ${response.statusCode}');
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data is List || data is Map) {
          return data as T;
        } else {
          throw ServerException(
            message: 'Unexpected response format: ${data.runtimeType}',
          );
        }
      } else if (response.statusCode == 204) {
        if (T == List || T == dynamic) {
          return [] as T;
        } else if (T == Map) {
          return {} as T;
        } else {
          return null as T;
        }
      } else {
        throw ServerException(
          message:
              'Unexpected status code: ${response.statusCode}, Body: ${response.body}',
        );
      }
    } on TimeoutException catch (e) {
      throw ServerException(message: 'Request timeout: $e');
    } on http.ClientException catch (e) {
      throw ServerException(message: 'Client error: $e');
    } on FormatException catch (e) {
      throw ServerException(message: 'Response parsing error: $e');
    } catch (e) {
      throw ServerException(message: 'Unexpected error: $e');
    }
  }

  Future<Map<String, dynamic>> prepareRequestBody(
      {required String sharedDateTimeKey}) async {
    final userId =
        _sharedPreferencesService.getString(SharedPrefKeys.USERID_KEY);

    if (userId == null) {
      throw ServerException(
          message: 'User ID is missing in shared preferences');
    }
    return {
      "userid": userId,
      "branchid":
          _sharedPreferencesService.getString(SharedPrefKeys.BRANCHID_KEY) ?? 1,
      "dateTime": _sharedPreferencesService.getString(
        sharedDateTimeKey,
      ), // Adjust this based on your requirements
    };
  }

  Future<T> handleRequest<T>(String url, T Function(dynamic) fromJson,
      String sharedPreDateTimeKey) async {
    final body =
        await prepareRequestBody(sharedDateTimeKey: sharedPreDateTimeKey);

    try {
      final responseData = await post(body, url);
      return fromJson(responseData);
    } catch (e) {
      throw ServerFailures(message: "Server error: $e");
    }
  }
}

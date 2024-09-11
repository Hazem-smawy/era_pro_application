// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  HttpMethod({
    required this.client,
  });
  // SharedPreferences sharedPreferences;
  // HttpMethod({
  //   // required this.sharedPreferences,
  // });
  final SharedPreferencesService _sharedPreferencesService = Get.find();

  Future<T> post<T>(Map<String, dynamic> body, String url) async {
    try {
      final response = await client
          .post(
        Uri.parse(url),
        headers: {
          'Authorization':
              'Bearer ${_sharedPreferencesService.getString(SharedPrefKeys.TOKEN_KEY)}',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(body),
      )
          .timeout(
        const Duration(seconds: 7),
        onTimeout: () {
          return throw TimeoutException("time out message");
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        if (data is List) {
          // If data is a list, return it as T
          if (data.isNotEmpty) {
            return data as T;
          } else {
            throw ServerException(message: 'Empty list returned from server');
          }
        } else if (data is Map) {
          // If data is a single object (Map), return it as T
          return data as T;
        } else {
          throw ServerException(message: 'Unexpected response format');
        }
      } else {
        throw ServerException(
          message: 'Server responded with status code: ${response.statusCode}',
        );
      }
    } on http.ClientException catch (e) {
      throw ServerException(message: 'client exception : $e');
    } catch (e) {
      throw ServerException(message: 'another exception $e');
    }
  }

  Future<Map<String, dynamic>> prepareRequestBody(String sharedPrefKey) async {
    return {
      "userid": _sharedPreferencesService.getString(SharedPrefKeys.USERID_KEY),
      "branchid":
          _sharedPreferencesService.getString(SharedPrefKeys.BRANCHID_KEY) ?? 1,
      "dateTime": _sharedPreferencesService.getString(sharedPrefKey),
    };
  }

  Future<T> handleRequest<T>(
      String url, T Function(dynamic) fromJson, String sharedPrefKey) async {
    final body = await prepareRequestBody(sharedPrefKey);

    try {
      final responseData = await post(body, url);

      return fromJson(responseData);
    } catch (e) {
      throw ServerFailures(message: "Server error: $e");
    }
  }
}

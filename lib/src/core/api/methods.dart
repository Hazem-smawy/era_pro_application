// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

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
              'Bearer ${_sharedPreferencesService.getString('token')}',
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

        if (data.length > 1) {
          return data as T;
        } else {
          return data[0] as T;
        }
      } else {
        throw ServerException(message: 'from server statatus not 200');
      }
    } on http.ClientException catch (e) {
      throw ServerException(message: 'client exception : $e');
    } catch (e) {
      print(e);
      throw ServerException(message: 'another exception $e');
    }
  }

  Future<Map<String, dynamic>> prepareRequestBody() async {
    return {
      "userid": _sharedPreferencesService.getString('userId'),
      "branchid": 1,
      "dateTime": null,
    };
  }

  Future<T> handleRequest<T>(
    String url,
    T Function(dynamic) fromJson,
  ) async {
    final body = await prepareRequestBody();

    try {
      final responseData = await post(body, url);

      return fromJson(responseData);
    } catch (e) {
      print(e);
      throw ServerFailures(message: "Server error: $e");
    }
  }
}

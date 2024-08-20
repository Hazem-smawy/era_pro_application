// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:era_pro_application/src/core/error/exception.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';

typedef ReturnData = Future<Map<String, dynamic>>;

class HttpMethod extends GetxController {
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
    print(url);
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
        const Duration(seconds: 5),
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
      throw ServerException(message: 'another exception $e');
    }
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:era_pro_applicationlication/src/core/error/exception.dart';
import 'package:http/http.dart' as client;

typedef ReturnData = Future<Map<String, dynamic>>;

class HttpMethod {
  static Future<T> post<T>(Map<String, dynamic> body, String url) async {
    try {
      final response = await client
          .post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      )
          .timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          return throw TimeoutException("time out message");
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return data as T;
      } else {
        throw ServerExeption(message: 'from server statatus not 200');
      }
    } on client.ClientException catch (e) {
      print('ClientException: $e');
      throw ServerExeption(message: 'client exception');
    } catch (e) {
      print('Exception: $e');
      throw ServerExeption(message: 'another exception');
    }
  }
}

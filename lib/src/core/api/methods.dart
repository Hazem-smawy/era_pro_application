import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:era_pro_applicationlication/src/core/error/failures.dart';
import 'package:http/http.dart' as client;

typedef ReturnData = Future<Either<Failure, Map<String, dynamic>>>;

class HttpMethod {
  static ReturnData post(Map<String, dynamic> body, String url) async {
    final response = await client.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      return Right(data);
    } else {
      return const Left(ServerFailures(message: "server message"));
    }
  }
}

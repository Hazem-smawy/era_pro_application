// import 'dart:async';
// import 'dart:convert';
// import 'package:connectivity/connectivity.dart';
// import 'package:dio/dio.dart';
// import 'package:get/get.dart' as getx;
// import 'package:era_pro_application/src/core/constants/share_pref_keys.dart';
// import 'package:era_pro_application/src/core/error/failures.dart';
// import 'package:era_pro_application/src/core/services/shared_preferences.dart';
// import 'package:era_pro_application/src/core/api/api.dart';
// import 'package:era_pro_application/src/core/error/exception.dart';

// class HttpMethod {
//   final Dio dio;
//   HttpMethod({required this.dio});

//   final SharedPreferencesService _sharedPreferencesService = getx.Get.find();
//   final ApiConnection _apiConnection = getx.Get.find();

//   Future<void> _refreshToken() async {
//     final refreshToken =
//         _sharedPreferencesService.getString(SharedPrefKeys.REFRESHTOKEN_KEY);
//     const refreshUrl =
//         "YOUR_REFRESH_URL"; // Replace with your actual refresh token URL

//     try {
//       final response = await dio.post(
//         refreshUrl,
//         data: jsonEncode({"refresh_token": refreshToken}),
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//           },
//         ),
//       );

//       print(response);

//       if (response.statusCode == 200) {
//         final newToken = response.data['access_token'];
//         _sharedPreferencesService.setString(SharedPrefKeys.TOKEN_KEY, newToken);
//       } else {
//         throw ServerException(message: 'Failed to refresh token');
//       }
//     } catch (e) {
//       throw ServerException(message: 'Refresh token error: $e');
//     }
//   }

//   Future<Response> _authenticatedPost(
//       String url, Map<String, dynamic> body) async {
//     try {
//       final token =
//           _sharedPreferencesService.getString(SharedPrefKeys.TOKEN_KEY);
//       if (token == null) {
//         throw ServerException(message: 'Token is null');
//       }

//       return await dio.post(
//         url,
//         data: jsonEncode(body),
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $token',
//             'Content-Type': 'application/json',
//           },
//         ),
//       );
//     } on DioException catch (e) {
//       if (e.response?.statusCode == 401) {
//         await _refreshToken();
//         final token =
//             _sharedPreferencesService.getString(SharedPrefKeys.TOKEN_KEY);
//         if (token == null) {
//           throw ServerException(message: 'Token is null after refresh');
//         }

//         return await dio.post(
//           url,
//           data: jsonEncode(body),
//           options: Options(
//             headers: {
//               'Authorization': 'Bearer $token',
//               'Content-Type': 'application/json',
//             },
//           ),
//         );
//       } else {
//         rethrow;
//       }
//     }
//   }

//   Future<T> post<T>(Map<String, dynamic> body, String url) async {
//     print('Request URL: $url');
//     print('Request Body: $body');

//     try {
//       final response = await _authenticatedPost(url, body).timeout(
//         const Duration(seconds: 10),
//         onTimeout: () => throw TimeoutException("Request timed out"),
//       );

//       print('Response: ${response.data}');

//       if (response.statusCode == 200) {
//         final data = response.data;

//         if (data is List && data.isNotEmpty) {
//           return data as T;
//         } else if (data is Map) {
//           return data as T;
//         } else {
//           throw ServerException(message: 'Unexpected response format');
//         }
//       } else {
//         throw ServerException(
//           message: 'Server responded with status code: ${response.statusCode}',
//         );
//       }
//     } on DioException catch (e) {
//       print('Dio error: $e');
//       throw ServerException(message: 'Dio error: ${e.message}');
//     } on TimeoutException catch (e) {
//       print('Timeout error: $e');
//       throw ServerException(message: 'Request timed out');
//     } catch (e) {
//       print(e.toString());
//       print('Unexpected error: $e');
//       throw ServerException(message: 'Unexpected error: $e');
//     }
//   }

//   Future<Map<String, dynamic>> prepareRequestBody(String sharedPrefKey) async {
//     return {
//       "userid": _sharedPreferencesService.getString(SharedPrefKeys.USERID_KEY),
//       "branchid":
//           _sharedPreferencesService.getString(SharedPrefKeys.BRANCHID_KEY) ?? 1,
//       "dateTime": null,
//     };
//   }

//   Future<T> handleRequest<T>(
//     String url,
//     T Function(dynamic) fromJson,
//     String sharedPrefKey,
//   ) async {
//     final connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.none) {
//       throw const ServerFailures(message: "No internet connection");
//     }

//     final body = await prepareRequestBody(sharedPrefKey);

//     try {
//       final responseData = await post(body, url);
//       return fromJson(responseData);
//     } catch (e) {
//       throw ServerFailures(message: "Server error: $e");
//     }
//   }
// }

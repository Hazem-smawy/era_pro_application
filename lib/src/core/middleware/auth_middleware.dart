// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMiddleware extends GetMiddleware {
  SharedPreferences sharedPreferences;
  AuthMiddleware({
    required this.sharedPreferences,
  });
  @override
  RouteSettings? redirect(String? route) {
    if (sharedPreferences.getString('userId') != null) {
      return const RouteSettings(name: '/home');
    }
    return null;
  }
}

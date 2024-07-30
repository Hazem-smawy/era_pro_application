// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    AuthResponseModel(
      userId: json['userId'] as String,
      refreshToken: json['refreshToken'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$AuthResponseModelToJson(AuthResponseModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'refreshToken': instance.refreshToken,
      'token': instance.token,
    };

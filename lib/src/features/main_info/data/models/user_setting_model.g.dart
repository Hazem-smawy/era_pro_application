// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSettingModel _$UserSettingModelFromJson(Map<String, dynamic> json) =>
    UserSettingModel(
      id: (json['id'] as num?)?.toInt() ?? 1,
      custParent: (json['cust_parent'] as num).toInt(),
      generateCode: json['generate_code'] as String,
      custGroup: (json['cust_group'] as num).toInt(),
    );

Map<String, dynamic> _$UserSettingModelToJson(UserSettingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cust_parent': instance.custParent,
      'generate_code': instance.generateCode,
      'cust_group': instance.custGroup,
    };

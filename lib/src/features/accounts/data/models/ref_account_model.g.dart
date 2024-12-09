// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ref_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefAccountModel _$RefAccountModelFromJson(Map<String, dynamic> json) =>
    RefAccountModel(
      (json['id'] as num).toInt(),
      (json['accTag'] as num).toInt(),
      json['accName'] as String,
      (json['accNumber'] as num).toInt(),
    );

Map<String, dynamic> _$RefAccountModelToJson(RefAccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accTag': instance.accTag,
      'accName': instance.accName,
      'accNumber': instance.accNumber,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mid_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MidAccountModel _$MidAccountModelFromJson(Map<String, dynamic> json) =>
    MidAccountModel(
      id: (json['id'] as num).toInt(),
      accTag: (json['accTag'] as num).toInt(),
      accName: json['accName'] as String,
      accNumber: (json['accNumber'] as num).toInt(),
      branchId: (json['branchId'] as num).toInt(),
    );

Map<String, dynamic> _$MidAccountModelToJson(MidAccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accTag': instance.accTag,
      'accName': instance.accName,
      'accNumber': instance.accNumber,
      'branchId': instance.branchId,
    };

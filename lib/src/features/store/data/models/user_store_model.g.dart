// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserStoreModel _$UserStoreModelFromJson(Map<String, dynamic> json) =>
    UserStoreModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      accountNumber: (json['accountNumber'] as num).toInt(),
      branchId: (json['branchId'] as num).toInt(),
      storeManager: json['storeManager'] as String,
      managerPhone: json['managerPhone'] as String,
      note: json['note'] as String,
    );

Map<String, dynamic> _$UserStoreModelToJson(UserStoreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'accountNumber': instance.accountNumber,
      'branchId': instance.branchId,
      'storeManager': instance.storeManager,
      'managerPhone': instance.managerPhone,
      'note': instance.note,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      id: (json['id'] as num?)?.toInt(),
      accNumber: (json['accNumber'] as num).toInt(),
      accName: json['accName'] as String,
      accParent: (json['accParent'] as num).toInt(),
      accType: (json['accType'] as num).toInt(),
      note: json['note'] as String,
      accCatagory: (json['accCatagory'] as num).toInt(),
      accCatId: (json['accCatId'] as num).toInt(),
      accPhone: json['accPhone'] as String,
      address: json['address'] as String,
      email: json['email'] as String,
      accLimit: (json['accLimit'] as num).toInt(),
      paymentType: (json['paymentType'] as num).toInt(),
      branchId: (json['branchId'] as num).toInt(),
      accStoped: json['accStoped'] as bool,
      newData: json['newData'] as bool,
      image: _$JsonConverterFromJson<String, Uint8List>(
          json['image'], const Uint8ListConverter().fromJson),
      refNumber: (json['refNumber'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accNumber': instance.accNumber,
      'refNumber': instance.refNumber,
      'accName': instance.accName,
      'accParent': instance.accParent,
      'accType': instance.accType,
      'note': instance.note,
      'accCatagory': instance.accCatagory,
      'accCatId': instance.accCatId,
      'accPhone': instance.accPhone,
      'address': instance.address,
      'email': instance.email,
      'accLimit': instance.accLimit,
      'paymentType': instance.paymentType,
      'branchId': instance.branchId,
      'accStoped': instance.accStoped,
      'image': _$JsonConverterToJson<String, Uint8List>(
          instance.image, const Uint8ListConverter().toJson),
      'newData': instance.newData,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

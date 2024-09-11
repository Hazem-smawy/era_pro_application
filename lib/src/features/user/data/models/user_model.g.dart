// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: (json['id'] as num).toInt(),
      userName: json['user_name'] as String,
      password: json['password'] as String,
      userAcctype: (json['user_acc_type'] as num).toInt(),
      branchId: (json['branch_id'] as num).toInt(),
      groupId: (json['group_id'] as num).toInt(),
      note: json['note'] as String,
      image: _$JsonConverterFromJson<String, Uint8List>(
          json['image'], const Uint8ListConverter().fromJson),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'user_name': instance.userName,
      'password': instance.password,
      'user_acc_type': instance.userAcctype,
      'branch_id': instance.branchId,
      'group_id': instance.groupId,
      'note': instance.note,
      'image': _$JsonConverterToJson<String, Uint8List>(
          instance.image, const Uint8ListConverter().toJson),
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

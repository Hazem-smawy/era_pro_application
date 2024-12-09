// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_operation_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOperationEntity _$CheckOperationEntityFromJson(
        Map<String, dynamic> json) =>
    CheckOperationEntity(
      id: (json['id'] as num?)?.toInt(),
      sandId: (json['sandId'] as num).toInt(),
      operationNumber: json['operationNumber'] as String,
      operationDate:
          const DateTimeConverter().fromJson(json['operationDate'] as String),
      paymentMethed: (json['paymentMethed'] as num).toInt(),
      operationState: json['operationState'] as bool,
    );

Map<String, dynamic> _$CheckOperationEntityToJson(
        CheckOperationEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sandId': instance.sandId,
      'operationNumber': instance.operationNumber,
      'operationDate': const DateTimeConverter().toJson(instance.operationDate),
      'paymentMethed': instance.paymentMethed,
      'operationState': instance.operationState,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sand_details_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SandDetailEntity _$SandDetailEntityFromJson(Map<String, dynamic> json) =>
    SandDetailEntity(
      id: (json['id'] as num?)?.toInt(),
      sandId: (json['sandId'] as num).toInt(),
      accNumber: (json['accNumber'] as num).toInt(),
      amount: (json['amount'] as num).toDouble(),
      currencyId: (json['currencyId'] as num).toInt(),
      currencyValue: (json['currencyValue'] as num).toDouble(),
    );

Map<String, dynamic> _$SandDetailEntityToJson(SandDetailEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sandId': instance.sandId,
      'accNumber': instance.accNumber,
      'amount': instance.amount,
      'currencyId': instance.currencyId,
      'currencyValue': instance.currencyValue,
    };

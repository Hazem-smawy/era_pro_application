// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exchange_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExchangeModel _$ExchangeModelFromJson(Map<String, dynamic> json) =>
    ExchangeModel(
      id: (json['id'] as num?)?.toInt(),
      sandType: (json['sandType'] as num).toInt(),
      isCash: json['isCash'] as bool,
      branchId: (json['branchId'] as num).toInt(),
      sandNumber: (json['sandNumber'] as num).toInt(),
      sandDate: const DateTimeConverter().fromJson(json['sandDate'] as String),
      fundNumber: (json['fundNumber'] as num).toInt(),
      currencyId: (json['currencyId'] as num).toInt(),
      currencyValue: (json['currencyValue'] as num).toDouble(),
      reciepentName: json['reciepentName'] as String,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      sandNote: json['sandNote'] as String,
      refNumber: json['refNumber'] as String,
      sandDetails: (json['sandDetails'] as List<dynamic>?)
          ?.map((e) => SandDetailEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      checkOperations: (json['checkOperations'] as List<dynamic>?)
          ?.map((e) => CheckOperationEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExchangeModelToJson(ExchangeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sandType': instance.sandType,
      'isCash': instance.isCash,
      'branchId': instance.branchId,
      'sandNumber': instance.sandNumber,
      'sandDate': const DateTimeConverter().toJson(instance.sandDate),
      'fundNumber': instance.fundNumber,
      'currencyId': instance.currencyId,
      'currencyValue': instance.currencyValue,
      'reciepentName': instance.reciepentName,
      'totalAmount': instance.totalAmount,
      'sandNote': instance.sandNote,
      'refNumber': instance.refNumber,
      'sandDetails': instance.sandDetails?.map((e) => e.toJson()).toList(),
      'checkOperations':
          instance.checkOperations?.map((e) => e.toJson()).toList(),
    };

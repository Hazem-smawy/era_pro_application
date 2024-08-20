// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurencyModel _$CurencyModelFromJson(Map<String, dynamic> json) => CurencyModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      subName: json['sub_name'] as String,
      value: (json['value'] as num).toDouble(),
      equivelant: (json['equivelant'] as num).toDouble(),
      localCurrency: json['local_currency'] as bool,
      storeCurrency: json['store_currency'] as bool,
      maxValue: (json['max_value'] as num).toDouble(),
      minValue: (json['min_value'] as num).toDouble(),
      note: json['note'] as String,
      newData: json['newData'] as bool,
    );

Map<String, dynamic> _$CurencyModelToJson(CurencyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'sub_name': instance.subName,
      'value': instance.value,
      'equivelant': instance.equivelant,
      'local_currency': instance.localCurrency,
      'store_currency': instance.storeCurrency,
      'max_value': instance.maxValue,
      'min_value': instance.minValue,
      'note': instance.note,
      'newData': instance.newData,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) => CompanyModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      enName: json['en_name'] as String,
      shortName: json['short_name'] as String,
      enShortName: json['short_en_name'] as String,
      address: json['address'] as String?,
      website: json['website'] as String?,
      note: json['note'] as String?,
      logo: _$JsonConverterFromJson<String, Uint8List>(
          json['logo'], const Uint8ListConverter().fromJson),
    );

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'en_name': instance.enName,
      'short_name': instance.shortName,
      'short_en_name': instance.enShortName,
      'logo': _$JsonConverterToJson<String, Uint8List>(
          instance.logo, const Uint8ListConverter().toJson),
      'address': instance.address,
      'website': instance.website,
      'note': instance.note,
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

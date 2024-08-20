// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BranchModel _$BranchModelFromJson(Map<String, dynamic> json) => BranchModel(
      id: (json['id'] as num).toInt(),
      companyId: (json['company_id'] as num).toInt(),
      name: json['name'] as String,
      address: json['address'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      arReportHeader: json['ar_report_header'] as String?,
      enReportHeader: json['en_report_header'] as String?,
      note: json['note'] as String?,
      logo: _$JsonConverterFromJson<String, Uint8List>(
          json['logo'], const Uint8ListConverter().fromJson),
    );

Map<String, dynamic> _$BranchModelToJson(BranchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_id': instance.companyId,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'ar_report_header': instance.arReportHeader,
      'en_report_header': instance.enReportHeader,
      'note': instance.note,
      'logo': _$JsonConverterToJson<String, Uint8List>(
          instance.logo, const Uint8ListConverter().toJson),
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

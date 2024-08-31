// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_doc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemDocModel _$SystemDocModelFromJson(Map<String, dynamic> json) =>
    SystemDocModel(
      id: (json['id'] as num).toInt(),
      docName: json['docName'] as String,
      docType: (json['docType'] as num).toInt(),
    );

Map<String, dynamic> _$SystemDocModelToJson(SystemDocModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'docName': instance.docName,
      'docType': instance.docType,
    };

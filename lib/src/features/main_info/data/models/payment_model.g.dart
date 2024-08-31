// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) => PaymentModel(
      id: (json['id'] as num).toInt(),
      userId: (json['userid'] as num).toInt(),
      methodName: json['methodname'] as String,
      newData: json['newData'] as bool,
      isDefault: json['isdefault'] as bool,
      methodNote: json['methodnote'] as String,
    );

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userid': instance.userId,
      'methodname': instance.methodName,
      'isdefault': instance.isDefault,
      'methodnote': instance.methodNote,
      'newData': instance.newData,
    };

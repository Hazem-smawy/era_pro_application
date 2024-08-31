import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/payment_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_model.g.dart';

@JsonSerializable()
class PaymentModel extends PaymentEntity {
  const PaymentModel({
    required super.id,
    required super.userId,
    required super.methodName,
    required super.newData,
    required super.isDefault,
    required super.methodNote,
  });
  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);

  static List<PaymentModel> fromJsonArray(List jsonArray) {
    return jsonArray.map((value) => PaymentModel.fromJson(value)).toList();
  }

  PaymentTableCompanion toCompanion() {
    return PaymentTableCompanion(
      id: Value(id),
      userId: Value(userId),
      methodName: Value(methodName),
      newData: Value(newData),
      isDefault: Value(isDefault),
      methodNote: Value(methodNote),
    );
  }
}

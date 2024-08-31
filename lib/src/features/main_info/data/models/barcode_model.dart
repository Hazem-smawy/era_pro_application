import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/barcode_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'barcode_model.g.dart';

@JsonSerializable()
class BarcodeModel extends BarcodeEntity {
  const BarcodeModel({
    required super.id,
    required super.itemId,
    required super.itemBarcode,
  });

  factory BarcodeModel.fromJson(Map<String, dynamic> json) =>
      _$BarcodeModelFromJson(json);

  Map<String, dynamic> toJson() => _$BarcodeModelToJson(this);

  static List<BarcodeModel> fromJsonArray(List jsonArray) {
    return jsonArray.map((value) => BarcodeModel.fromJson(value)).toList();
  }

  BarcodeTableCompanion toCompanion() {
    return BarcodeTableCompanion(
      id: Value(id),
      itemId: Value(itemId),
      itemBarcode: Value(itemBarcode),
    );
  }
}

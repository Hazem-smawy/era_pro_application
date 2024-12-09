import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/services/db/db.dart';
import '../../domain/entities/bill_details_entity.dart';

part 'bill_details_model.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class BillDetailsModel extends BillDetailsEntity {
  BillDetailsModel(
      {required super.id,
      required super.billID,
      required super.itemId,
      required super.itemUnitID,
      required super.unitFactor,
      required super.quantity,
      required super.freeQty,
      required super.avrageCost,
      required super.sellPrice,
      required super.totalSellPrice,
      required super.discountPre,
      required super.netSellPrice,
      required super.expirDate,
      required super.taxRate,
      required super.itemNote,
      required super.freeQtyCost});

  factory BillDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$BillDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$BillDetailsModelToJson(this);

  BillDetailsTableCompanion toCompanion() {
    return BillDetailsTableCompanion(
      id: const Value.absent(),
      billID: Value(billID),
      itemId: Value(itemId),
      itemUnitID: Value(itemUnitID),
      unitFactor: Value(unitFactor),
      quantity: Value(quantity),
      freeQty: Value(freeQty),
      avrageCost: Value(avrageCost),
      sellPrice: Value(sellPrice),
      totalSellPrice: Value(totalSellPrice),
      discountPre: Value(discountPre),
      netSellPrice: Value(netSellPrice),
      expirDate: Value(expirDate),
      taxRate: Value(taxRate),
      itemNote: Value(itemNote),
      freeQtyCost: Value(freeQtyCost),
    );
  }

  static BillDetailsModel fromEntity(BillDetailsEntity entity) {
    return BillDetailsModel(
      id: entity.id,
      billID: entity.billID,
      itemId: entity.itemId,
      itemUnitID: entity.itemUnitID,
      unitFactor: entity.unitFactor,
      quantity: entity.quantity,
      freeQty: entity.freeQty,
      avrageCost: entity.avrageCost,
      sellPrice: entity.sellPrice,
      totalSellPrice: entity.totalSellPrice,
      discountPre: entity.discountPre,
      netSellPrice: entity.netSellPrice,
      expirDate: entity.expirDate,
      taxRate: entity.taxRate,
      itemNote: entity.itemNote,
      freeQtyCost: entity.freeQtyCost,
    );
  }

  static List<BillDetailsModel> fromEntityArray(List entities) {
    return entities.map((value) => BillDetailsModel.fromEntity(value)).toList();
  }
}

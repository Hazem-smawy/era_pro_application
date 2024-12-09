import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class BillDetailsEntity extends Equatable {
  int? id;
  final int billID;
  final int itemId;
  final int itemUnitID;
  final int unitFactor;
  final int quantity;
  final int freeQty;
  final double avrageCost;
  final double sellPrice;
  final double totalSellPrice;
  final double discountPre;
  final double netSellPrice;
  final String? expirDate;
  final double taxRate;
  final String itemNote;
  final double freeQtyCost;

  BillDetailsEntity({
    this.id,
    required this.billID,
    required this.itemId,
    required this.itemUnitID,
    required this.unitFactor,
    required this.quantity,
    required this.freeQty,
    required this.avrageCost,
    required this.sellPrice,
    required this.totalSellPrice,
    required this.discountPre,
    required this.netSellPrice,
    this.expirDate,
    required this.taxRate,
    required this.itemNote,
    required this.freeQtyCost,
  });

  // The copyWith method to create a new instance with updated fields
  BillDetailsEntity copyWith({
    int? id,
    int? billID,
    int? itemId,
    int? itemUnitID,
    int? unitFactor,
    int? quantity,
    int? freeQty,
    double? avrageCost,
    double? sellPrice,
    double? totalSellPrice,
    double? discountPre,
    double? netSellPrice,
    String? expirDate,
    double? taxRate,
    String? itemNote,
    double? freeQtyCost,
  }) {
    return BillDetailsEntity(
      id: id ?? this.id,
      billID: billID ?? this.billID,
      itemId: itemId ?? this.itemId,
      itemUnitID: itemUnitID ?? this.itemUnitID,
      unitFactor: unitFactor ?? this.unitFactor,
      quantity: quantity ?? this.quantity,
      freeQty: freeQty ?? this.freeQty,
      avrageCost: avrageCost ?? this.avrageCost,
      sellPrice: sellPrice ?? this.sellPrice,
      totalSellPrice: totalSellPrice ?? this.totalSellPrice,
      discountPre: discountPre ?? this.discountPre,
      netSellPrice: netSellPrice ?? this.netSellPrice,
      expirDate: expirDate ?? this.expirDate,
      taxRate: taxRate ?? this.taxRate,
      itemNote: itemNote ?? this.itemNote,
      freeQtyCost: freeQtyCost ?? this.freeQtyCost,
    );
  }

  @override
  List<Object?> get props => [
        id,
        billID,
        itemId,
        itemUnitID,
        unitFactor,
        quantity,
        freeQty,
        avrageCost,
        sellPrice,
        totalSellPrice,
        discountPre,
        netSellPrice,
        expirDate,
        taxRate,
        itemNote,
        freeQtyCost,
      ];
}

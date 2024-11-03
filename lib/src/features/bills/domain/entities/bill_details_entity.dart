import 'package:equatable/equatable.dart';

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
  final String expirDate;
  final int taxRate;
  final String itemNote;
  final double freeQtyCost;

  BillDetailsEntity(
      {required this.id,
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
      required this.expirDate,
      required this.taxRate,
      required this.itemNote,
      required this.freeQtyCost});

  @override
  // TODO: implement props
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

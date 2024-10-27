class SalesDetailsEntity {
  final int id;
  final int billId;
  final int itemId;
  final int itemUnitId;
  final int unitFactor;
  final int quantity;
  final int freeQuantity;
  final double averageCost;
  final double sellPrice;
  final double totalSellPrice;
  final double discountPercent;
  final double netSellPrice;
  final DateTime expireDate;
  final String itemNote;
  final int freeQuantityCost;

  SalesDetailsEntity({
    required this.id,
    required this.billId,
    required this.itemId,
    required this.itemUnitId,
    required this.unitFactor,
    required this.quantity,
    required this.freeQuantity,
    required this.averageCost,
    required this.sellPrice,
    required this.totalSellPrice,
    required this.discountPercent,
    required this.netSellPrice,
    required this.expireDate,
    required this.itemNote,
    required this.freeQuantityCost,
  });
}

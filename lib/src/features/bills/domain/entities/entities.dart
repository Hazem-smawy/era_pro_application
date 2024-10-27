// ignore_for_file: public_member_api_docs, sort_constructors_first

class BillsEntity {
  final int id;
  final int branchId;
  final int billNumber;
  final int billType;
  final DateTime billDate;
  final String customerNumber;
  final int curencyId;
  final double curencyValue;
  final int fundNumber;
  final int paymentMethodId;
  final int sotreId;
  final int storeCurrencyValue;
  final String note;
  final int itemCalcMethod;
  final DateTime dueDate;
  final int salesPerson;
  final bool hasVat;
  final bool hasSalesTax;
  final bool salesTaxRate;
  final int numberOfItem;
  final double totalBill;

  final double itemDiscount;
  final double billDiscount;
  final double netBill;
  final double totalVat;
  final double findBillCost;
  final double costFreecety;
  final double totalAverageCost;
  final double paidAmount;
  final int referenceNumber;
  BillsEntity({
    required this.id,
    required this.branchId,
    required this.billNumber,
    required this.billType,
    required this.billDate,
    required this.customerNumber,
    required this.curencyId,
    required this.curencyValue,
    required this.fundNumber,
    required this.paymentMethodId,
    required this.sotreId,
    required this.storeCurrencyValue,
    required this.note,
    required this.itemCalcMethod,
    required this.dueDate,
    required this.salesPerson,
    required this.hasVat,
    required this.hasSalesTax,
    required this.salesTaxRate,
    required this.numberOfItem,
    required this.totalBill,
    required this.itemDiscount,
    required this.billDiscount,
    required this.netBill,
    required this.totalVat,
    required this.findBillCost,
    required this.costFreecety,
    required this.totalAverageCost,
    required this.paidAmount,
    required this.referenceNumber,
  });
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillModel _$BillModelFromJson(Map<String, dynamic> json) => BillModel(
      id: (json['id'] as num?)?.toInt(),
      branchId: (json['branchId'] as num).toInt(),
      billNumber: (json['billNumber'] as num).toInt(),
      billType: (json['billType'] as num).toInt(),
      billDate: const DateTimeConverter().fromJson(json['billDate'] as String),
      refNumber: json['refNumber'] as String,
      customerNumber: (json['customerNumber'] as num).toInt(),
      currencyId: (json['currencyId'] as num).toInt(),
      currencyValue: (json['currencyValue'] as num).toDouble(),
      fundNumber: (json['fundNumber'] as num).toInt(),
      paymentMethed: (json['paymentMethed'] as num).toInt(),
      storeId: (json['storeId'] as num).toInt(),
      storeCurValue: (json['storeCurValue'] as num).toDouble(),
      billNote: json['billNote'] as String,
      itemCalcMethod: (json['itemCalcMethod'] as num).toInt(),
      dueDate: const DateTimeConverter().fromJson(json['dueDate'] as String),
      salesPerson: (json['salesPerson'] as num).toInt(),
      hasVat: json['hasVat'] as bool,
      hasSalesTax: json['hasSalesTax'] as bool,
      salesTaxRate: (json['salesTaxRate'] as num).toDouble(),
      numOfitems: (json['numOfitems'] as num).toInt(),
      totalBill: (json['totalBill'] as num).toDouble(),
      itemsDiscount: (json['itemsDiscount'] as num).toDouble(),
      billDiscount: (json['billDiscount'] as num).toDouble(),
      netBill: (json['netBill'] as num).toDouble(),
      totalVat: (json['totalVat'] as num).toDouble(),
      billFinalCost: (json['billFinalCost'] as num).toDouble(),
      freeQtyCost: (json['freeQtyCost'] as num).toDouble(),
      totalAvragCost: (json['totalAvragCost'] as num).toDouble(),
      paidAmount: (json['paidAmount'] as num).toDouble(),
    );

Map<String, dynamic> _$BillModelToJson(BillModel instance) => <String, dynamic>{
      'id': instance.id,
      'branchId': instance.branchId,
      'billNumber': instance.billNumber,
      'billType': instance.billType,
      'billDate': const DateTimeConverter().toJson(instance.billDate),
      'refNumber': instance.refNumber,
      'customerNumber': instance.customerNumber,
      'currencyId': instance.currencyId,
      'currencyValue': instance.currencyValue,
      'fundNumber': instance.fundNumber,
      'paymentMethed': instance.paymentMethed,
      'storeId': instance.storeId,
      'storeCurValue': instance.storeCurValue,
      'billNote': instance.billNote,
      'itemCalcMethod': instance.itemCalcMethod,
      'dueDate': const DateTimeConverter().toJson(instance.dueDate),
      'salesPerson': instance.salesPerson,
      'hasVat': instance.hasVat,
      'hasSalesTax': instance.hasSalesTax,
      'salesTaxRate': instance.salesTaxRate,
      'numOfitems': instance.numOfitems,
      'totalBill': instance.totalBill,
      'itemsDiscount': instance.itemsDiscount,
      'billDiscount': instance.billDiscount,
      'netBill': instance.netBill,
      'totalVat': instance.totalVat,
      'billFinalCost': instance.billFinalCost,
      'freeQtyCost': instance.freeQtyCost,
      'totalAvragCost': instance.totalAvragCost,
      'paidAmount': instance.paidAmount,
    };
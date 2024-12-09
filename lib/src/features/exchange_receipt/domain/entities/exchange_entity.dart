import 'package:equatable/equatable.dart';
import 'package:era_pro_application/src/core/utils/date_time_converter.dart';
import 'package:era_pro_application/src/features/exchange_receipt/domain/entities/check_operation_entity.dart';

import 'sand_details_entity.dart';

// Updated ExchangeEntity
// ignore: must_be_immutable
class ExchangeEntity extends Equatable {
  int? id;
  int sandType;
  bool isCash;
  int branchId;
  int sandNumber;
  @DateTimeConverter()
  DateTime sandDate;
  int fundNumber;
  int currencyId;
  double currencyValue;
  String reciepentName;
  double totalAmount;
  String sandNote;
  String refNumber;
  final List<SandDetailEntity>? sandDetails;
  final List<CheckOperationEntity>? checkOperations;

  ExchangeEntity({
    this.id,
    required this.sandType,
    required this.isCash,
    required this.branchId,
    required this.sandNumber,
    required this.sandDate,
    required this.fundNumber,
    required this.currencyId,
    required this.currencyValue,
    required this.reciepentName,
    required this.totalAmount,
    required this.sandNote,
    required this.refNumber,
    required this.sandDetails,
    required this.checkOperations,
  });

  @override
  List<Object?> get props => [
        id,
        sandType,
        isCash,
        branchId,
        sandNumber,
        sandDate,
        fundNumber,
        currencyId,
        currencyValue,
        reciepentName,
        totalAmount,
        sandNote,
        refNumber,
        sandDetails,
        checkOperations,
      ];
}

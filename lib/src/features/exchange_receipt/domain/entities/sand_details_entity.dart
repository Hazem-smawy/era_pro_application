import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/services/db/db.dart';

part 'sand_details_entity.g.dart';

@JsonSerializable()
class SandDetailEntity extends Equatable {
  int? id;
  int sandId;
  final int accNumber;
  final double amount;
  final int currencyId;
  final double currencyValue;

  SandDetailEntity({
    this.id,
    required this.sandId,
    required this.accNumber,
    required this.amount,
    required this.currencyId,
    required this.currencyValue,
  });

  factory SandDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$SandDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => _$SandDetailEntityToJson(this);

  @override
  List<Object?> get props =>
      [id, sandId, accNumber, amount, currencyId, currencyValue];

  SandDetailsTableCompanion toCompanion() {
    return SandDetailsTableCompanion(
      id: id == null ? const Value.absent() : Value(id!),
      sandId: Value(sandId),
      accNumber: Value(accNumber),
      amount: Value(amount),
      currencyId: Value(currencyId),
      currencyValue: Value(currencyValue),
    );
  }
}

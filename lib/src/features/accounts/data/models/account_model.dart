import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class AccountModel extends AccountEntity {
  AccountModel({
    super.id,
    required super.accNumber,
    required super.accName,
    required super.accParent,
    required super.accType,
    required super.note,
    required super.accCatagory,
    required super.accCatId,
    required super.accPhone,
    required super.address,
    required super.email,
    required super.accLimit,
    required super.paymentType,
    required super.branchId,
    required super.accStoped,
    required super.newData,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);

  static List<AccountModel> fromJsonArray(List jsonArray) {
    return jsonArray.map((value) => AccountModel.fromJson(value)).toList();
  }

  AccountTableCompanion toCompanion() {
    return AccountTableCompanion(
      id: Value(id ?? -1),
      accNumber: Value(accNumber),
      accName: Value(accName),
      accParent: Value(accParent),
      accType: Value(accType),
      note: Value(note),
      accCatagory: Value(accCatagory),
      accCatId: Value(accCatId),
      accPhone: Value(accPhone),
      address: Value(address),
      email: Value(email),
      accLimit: Value(accLimit),
      paymentType: Value(paymentType),
      branchId: Value(branchId),
      accStoped: Value(accStoped),
      newData: Value(newData),
    );
  }
}

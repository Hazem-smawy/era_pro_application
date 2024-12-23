import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/image_converter.dart';

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
    required super.image,
    required super.refNumber,
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
      image: Value(image),
      refNumber: Value(refNumber),
    );
  }
}

extension AccountModelCopy on AccountModel {
  AccountModel copyWith({
    int? id,
    int? accNumber,
    String? accName,
    int? accParent,
    int? accType,
    String? note,
    int? accCatagory,
    int? accCatId,
    String? accPhone,
    String? address,
    String? email,
    int? accLimit,
    int? paymentType,
    int? branchId,
    bool? accStoped,
    bool? newData,
    Uint8List? image,
    int? refNumber,
  }) {
    return AccountModel(
      id: id ?? this.id,
      accNumber: accNumber ?? this.accNumber,
      accName: accName ?? this.accName,
      accParent: accParent ?? this.accParent,
      accType: accType ?? this.accType,
      note: note ?? this.note,
      accCatagory: accCatagory ?? this.accCatagory,
      accCatId: accCatId ?? this.accCatId,
      accPhone: accPhone ?? this.accPhone,
      address: address ?? this.address,
      email: email ?? this.email,
      accLimit: accLimit ?? this.accLimit,
      paymentType: paymentType ?? this.paymentType,
      branchId: branchId ?? this.branchId,
      accStoped: accStoped ?? this.accStoped,
      newData: newData ?? this.newData,
      image: image ?? this.image,
      refNumber: refNumber ?? this.refNumber,
    );
  }
}

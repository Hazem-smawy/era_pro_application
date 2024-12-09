/*

        "id": 1,
        "accTag": 1,
        "accName": "حساب الشيكات الصادره",
        "accNumber": 224030001,
        "branchId": 0
*/

import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/mid_account_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mid_account_model.g.dart';

@JsonSerializable()
class MidAccountModel extends MidAccountEntity {
  const MidAccountModel(
      {required super.id,
      required super.accTag,
      required super.accName,
      required super.accNumber,
      required super.branchId});
  factory MidAccountModel.fromJson(Map<String, dynamic> json) =>
      _$MidAccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$MidAccountModelToJson(this);

  static List<MidAccountModel> fromJsonArray(List jsonArray) {
    return jsonArray.map((value) => MidAccountModel.fromJson(value)).toList();
  }

  MidAccountTableCompanion toCompanion() {
    return MidAccountTableCompanion(
      id: Value(id),
      accTag: Value(accTag),
      accName: Value(accName),
      accNumber: Value(accNumber),
      branchId: Value(branchId),
    );
  }
}

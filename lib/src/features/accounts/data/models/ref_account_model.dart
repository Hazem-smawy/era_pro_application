import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/ref_account_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ref_account_model.g.dart';

@JsonSerializable()
class RefAccountModel extends RefAccountEntity {
  const RefAccountModel(super.id, super.accTag, super.accName, super.accNumber);

  factory RefAccountModel.fromJson(Map<String, dynamic> json) =>
      _$RefAccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$RefAccountModelToJson(this);

  static List<RefAccountModel> fromJsonArray(List jsonArray) {
    return jsonArray.map((value) => RefAccountModel.fromJson(value)).toList();
  }

  RefAccountTableCompanion toCompanion() {
    return RefAccountTableCompanion(
      id: Value(id),
      accTag: Value(accTag),
      accName: Value(accName),
      accNumber: Value(accNumber),
    );
  }
}

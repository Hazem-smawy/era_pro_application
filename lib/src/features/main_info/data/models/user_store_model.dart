import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/user_store_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_store_model.g.dart';

@JsonSerializable()
class UserStoreModel extends UserStoreEntity {
  UserStoreModel({
    required super.id,
    required super.name,
    required super.accountNumber,
    required super.branchId,
    required super.storeManager,
    required super.managerPhone,
    required super.note,
  });

  factory UserStoreModel.fromJson(Map<String, dynamic> json) =>
      _$UserStoreModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserStoreModelToJson(this);

  UserStoreTableCompanion toCompanion() {
    return UserStoreTableCompanion(
      id: Value(id),
      name: Value(name),
      accountNumber: Value(accountNumber),
      branchId: Value(branchId),
      managerPhone: Value(managerPhone),
      storeManager: Value(storeManager),
      note: Value(note),
    );
  }
}

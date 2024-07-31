import 'package:drift/drift.dart';
import 'package:era_pro_applicationlication/src/core/services/db/db.dart';
import 'package:era_pro_applicationlication/src/features/user/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.userName,
    required super.password,
    required super.userAcctype,
    required super.branchId,
    required super.groupId,
    required super.note,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserTableCompanion toCompanion() {
    return UserTableCompanion(
        id: Value(id ?? -1),
        userName: Value(userName),
        password: Value(password),
        userAcctype: Value(userAcctype),
        branchId: Value(branchId),
        groupId: Value(groupId),
        note: Value(note));
  }
}

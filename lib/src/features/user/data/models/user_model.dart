import 'dart:typed_data';

import 'package:drift/drift.dart' as drift;
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/user/domain/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/image_converter.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.userName,
    required super.password,
    required super.userAcctype,
    required super.branchId,
    required super.groupId,
    required super.note,
    required super.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  UserTableCompanion toCompanion() {
    return UserTableCompanion(
      id: drift.Value(id),
      userName: drift.Value(userName),
      password: drift.Value(password),
      userAcctype: drift.Value(userAcctype),
      branchId: drift.Value(branchId),
      groupId: drift.Value(groupId),
      note: drift.Value(note),
      image: drift.Value(image ?? Uint8List(0)),
    );
  }
}

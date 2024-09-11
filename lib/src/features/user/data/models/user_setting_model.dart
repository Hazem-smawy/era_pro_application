import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user_setting_entity.dart';

part 'user_setting_model.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class UserSettingModel extends UserSettingEntity {
  UserSettingModel({
    super.id = 1,
    required super.custParent,
    required super.generateCode,
    required super.custGroup,
  });

  factory UserSettingModel.fromJson(Map<String, dynamic> json) =>
      _$UserSettingModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserSettingModelToJson(this);

  UserSettingTableCompanion toCompanion() {
    return UserSettingTableCompanion(
      id: Value(id),
      custParent: Value(custParent),
      generateCode: Value(generateCode),
      custGroup: Value(custGroup),
    );
  }
}

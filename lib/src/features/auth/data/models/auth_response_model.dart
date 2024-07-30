import 'package:era_pro_applicationlication/src/features/auth/domain/entities/auth_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel extends AuthResponseEntity {
  const AuthResponseModel(
      {required super.userId,
      required super.refreshToken,
      required super.token});
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);
}

import 'package:era_pro_applicationlication/src/features/auth/domain/entities/user_info_auth_entity.dart';

class UserInfoAuthModel extends UserInfoAuthEntity {
  const UserInfoAuthModel({required super.username, required super.password});

  factory UserInfoAuthModel.fromJson(Map<String, dynamic> json) {
    return UserInfoAuthModel(
        username: json['username'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}

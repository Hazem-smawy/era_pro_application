import 'package:era_pro_applicationlication/src/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({required super.username, required super.password});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(username: json['username'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    return data;
  }
}

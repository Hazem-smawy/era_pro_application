import 'package:era_pro_applicationlication/src/features/auth/data/models/device_info.dart';
import 'package:era_pro_applicationlication/src/features/auth/data/models/token.dart';
import 'package:era_pro_applicationlication/src/features/auth/data/models/user.dart';
import 'package:era_pro_applicationlication/src/features/auth/domain/entities/auth.dart';

class AuthModel extends AuthEntity {
  const AuthModel(
      {required super.token, required super.user, required super.deviceInfo});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
        token: TokenModel.fromJson(json['token']),
        user: UserModel.fromJson(json['user']),
        deviceInfo: DeviceInfoModel.fromJson(json['deviceInfo']));
  }

  Map<String, dynamic> toJson() {
    return {'user': user, 'token': token, 'deviceInfo': deviceInfo};
  }
}

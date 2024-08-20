import 'package:equatable/equatable.dart';
import 'package:era_pro_application/src/features/auth/domain/entities/device_info_entity.dart';
import 'package:era_pro_application/src/features/auth/domain/entities/token_entity.dart';
import 'package:era_pro_application/src/features/auth/domain/entities/user_info_auth_entity.dart';

class AuthEntity extends Equatable {
  final TokenEntity? token;
  final UserInfoAuthEntity? user;
  final DeviceInfoEntity? deviceInfo;

  const AuthEntity(
      {required this.token, required this.user, required this.deviceInfo});
  @override
  // TODO: implement props
  List<Object?> get props => [token, user, deviceInfo];
}

import 'package:equatable/equatable.dart';
import 'package:era_pro_applicationlication/src/features/auth/domain/entities/device_info.dart';
import 'package:era_pro_applicationlication/src/features/auth/domain/entities/token.dart';
import 'package:era_pro_applicationlication/src/features/auth/domain/entities/user.dart';

class AuthEntity extends Equatable {
  final Token? token;
  final User? user;
  final DeviceInfo? deviceInfo;

  const AuthEntity(
      {required this.token, required this.user, required this.deviceInfo});
  @override
  // TODO: implement props
  List<Object?> get props => [token, user, deviceInfo];
}

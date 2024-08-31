import 'package:equatable/equatable.dart';

class AuthResponseEntity extends Equatable {
  final String userId;
  final String refreshToken;
  final String token;

  const AuthResponseEntity(
      {required this.userId, required this.refreshToken, required this.token});

  @override
  List<Object?> get props => [userId, refreshToken, token];
}

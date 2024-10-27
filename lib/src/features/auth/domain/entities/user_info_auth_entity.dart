import 'package:equatable/equatable.dart';

class UserInfoAuthEntity extends Equatable {
  final String? username;
  final String? password;

  const UserInfoAuthEntity({required this.username, required this.password});
  @override
  List<Object?> get props => [username, password];
}

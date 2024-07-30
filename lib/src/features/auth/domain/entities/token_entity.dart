// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class TokenEntity extends Equatable {
  final String? token;
  final String? refreshToken;
  const TokenEntity({
    required this.token,
    required this.refreshToken,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [token, refreshToken];
}

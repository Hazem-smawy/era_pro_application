import 'package:era_pro_applicationlication/src/features/auth/domain/entities/token_entity.dart';

class TokenModel extends TokenEntity {
  const TokenModel({
    super.token,
    super.refreshToken,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(token: json['token'], refreshToken: json['refreshToken']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    return data;
  }
}

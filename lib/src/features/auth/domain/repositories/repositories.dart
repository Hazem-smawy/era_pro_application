import 'package:dartz/dartz.dart';
import 'package:era_pro_applicationlication/src/features/auth/domain/entities/auth.dart';
import 'package:era_pro_applicationlication/src/features/auth/domain/entities/auth_response.dart';

import '../../../../core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponseEntity>> auth(
      {required username, required password});
}

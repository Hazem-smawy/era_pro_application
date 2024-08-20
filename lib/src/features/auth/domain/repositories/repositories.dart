import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/features/auth/domain/entities/auth_entity.dart';
import 'package:era_pro_application/src/features/auth/domain/entities/auth_response_entity.dart';

import '../../../../core/error/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResponseEntity>> auth(
      {required username, required password});
}

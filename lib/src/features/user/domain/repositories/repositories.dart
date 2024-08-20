import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/error.dart';
import 'package:era_pro_application/src/features/user/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser();
}

import 'package:dartz/dartz.dart';
import 'package:era_pro_applicationlication/src/core/usecases/usecases.dart';
import 'package:era_pro_applicationlication/src/features/auth/domain/entities/auth_response_entity.dart';

import '../../../../core/error/failures.dart';
import '../repositories/repositories.dart';

class AuthUseCase implements UseCase {
  final AuthRepository repository;

  AuthUseCase({required this.repository});

  Future<Either<Failure, AuthResponseEntity>> call(
      {required username, required password}) async {
    return await repository.auth(username: username, password: password);
  }
}

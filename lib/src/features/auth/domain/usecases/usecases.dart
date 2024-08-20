import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/auth/data/models/auth_response_model.dart';
import 'package:era_pro_application/src/features/auth/domain/entities/auth_response_entity.dart';

import '../../../../core/error/failures.dart';
import '../repositories/repositories.dart';

class AuthUseCase
    implements ParamsUseCase<AuthResponseEntity, Tuple2<String, String>> {
  final AuthRepository repository;

  AuthUseCase({required this.repository});

  @override
  Future<Either<Failure, AuthResponseEntity>> call(Tuple2 params) async {
    return await repository.auth(
        username: params.value1, password: params.value2);
  }

  // Future<Either<Failure, AuthResponseEntity>> call(
  //     {required username, required password}) async {
  //   return await repository.auth(username: username, password: password);
  // }
}

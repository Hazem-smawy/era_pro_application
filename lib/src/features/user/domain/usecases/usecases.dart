// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/user/domain/entities/user_entity.dart';

import '../repositories/repositories.dart';

class GetUserUseCase extends NoParamUseCase<UserEntity> {
  final UserRepository userRepository;

  GetUserUseCase({
    required this.userRepository,
  });

  @override
  Future<Either<Failure, UserEntity>> call() {
    return userRepository.getUser();
  }
}

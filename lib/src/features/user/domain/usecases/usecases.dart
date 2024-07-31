import 'package:dartz/dartz.dart';
import 'package:era_pro_applicationlication/src/core/error/failures.dart';
import 'package:era_pro_applicationlication/src/core/usecases/usecases.dart';
import 'package:era_pro_applicationlication/src/features/user/domain/entities/user_entity.dart';

import '../repositories/repositories.dart';

class GetUserUseCase extends UseCase<UserEntity, NoParams> {
  final UserRepository userRepository;

  GetUserUseCase({required this.userRepository});

  Future<Either<Failure, UserEntity>> call() async {
    return userRepository.getUser();
  }
}

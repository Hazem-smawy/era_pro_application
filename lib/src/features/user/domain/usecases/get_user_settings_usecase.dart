// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/user/domain/entities/user_setting_entity.dart';
import 'package:era_pro_application/src/features/user/domain/repositories/user_repository.dart';

class GetUserSettingsUsecase extends NoParamUseCase<UserSettingEntity> {
  UserRepository userRepository;
  GetUserSettingsUsecase({
    required this.userRepository,
  });
  @override
  Future<Either<Failure, UserSettingEntity>> call() {
    return userRepository.getUserSettings();
  }
}

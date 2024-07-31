// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:era_pro_applicationlication/src/core/services/shared_pref.dart';

import 'package:era_pro_applicationlication/src/core/error/failures.dart';
import 'package:era_pro_applicationlication/src/features/user/data/models/user_model.dart';
import 'package:era_pro_applicationlication/src/features/user/data/sources/user_local_data_source.dart';
import 'package:era_pro_applicationlication/src/features/user/data/sources/user_remote_data_source.dart';
import 'package:era_pro_applicationlication/src/features/user/domain/repositories/repositories.dart';
import 'package:get/get.dart';

class UserRepositoryImp extends UserRepository {
  UserRemoteDataSource userRemoteDataSource;
  UserLocalDataSource userLocalDataSource;
  final SharedPreferencesService _sharedPreferencesService = Get.find();

  UserRepositoryImp({
    required this.userRemoteDataSource,
    required this.userLocalDataSource,
  });
  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      final userFounded = _sharedPreferencesService.getBool('user');

      if (userFounded != null) {
        final userId =
            int.parse(_sharedPreferencesService.getString('userId') ?? '');
        final userRes = await userLocalDataSource.getUser(userId);
        if (userRes != null) {
          return Right(userRes);
        } else {
          return const Left(EmptyLocalStrorageFailures(message: "empty"));
        }
      } else {
        final res = await userRemoteDataSource.getUser();
        await userLocalDataSource.saveUser(res);
        await _sharedPreferencesService.setBool('user', true);

        return Right(res);
      }
    } catch (e) {
      return const Left(ServerFailures(message: "error retrun user data"));
    }
  }
}

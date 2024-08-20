// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/exception.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';

import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/features/user/data/models/user_model.dart';
import 'package:era_pro_application/src/features/user/data/sources/user_local_data_source.dart';
import 'package:era_pro_application/src/features/user/data/sources/user_remote_data_source.dart';
import 'package:era_pro_application/src/features/user/domain/repositories/repositories.dart';
import 'package:get/get.dart';

class UserRepositoryImp extends UserRepository {
  UserRemoteDataSource userRemoteDataSource;
  UserLocalDataSource userLocalDataSource;
  final SharedPreferencesService _sharedPreferencesService = Get.find();

  UserRepositoryImp({
    required this.userRemoteDataSource,
    required this.userLocalDataSource,
  });
  // @override
  // Future<Either<Failure, UserModel>> getUser() async {
  //   try {
  //     var userFounded = _sharedPreferencesService.getBool('user');

  //     if (userFounded != null) {
  //       final userId =
  //           int.parse(_sharedPreferencesService.getString('userId') ?? '');
  //       final userRes = await userLocalDataSource.getUser(userId);
  //       if (userRes != null) {
  //         return Right(userRes);
  //       } else {
  //         return const Left(LocalStorageFailures(message: "empty"));
  //       }
  //     } else {
  //       final res = await userRemoteDataSource.getUser();
  //       await userLocalDataSource.saveUser(res);
  //       await _sharedPreferencesService.setBool('user', true);

  //       return Right(res);
  //     }
  //   } catch (e) {
  //     return Left(ServerFailures(message: "error retrun user data $e"));
  //   }
  // }

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      final userExists = _sharedPreferencesService.getBool('user') ?? false;

      if (userExists) {
        final userIdString = _sharedPreferencesService.getString('userId');
        if (userIdString != null) {
          final userId = int.parse(userIdString);
          final user = await userLocalDataSource.getUser(userId);
          if (user != null) {
            return Right(user);
          } else {
            return const Left(LocalStorageFailures(
                message: "User not found in local storage"));
          }
        } else {
          return const Left(LocalStorageFailures(
              message: "User ID not found in shared preferences"));
        }
      } else {
        final user = await userRemoteDataSource.getUser();
        await userLocalDataSource.saveUser(user);
        await _sharedPreferencesService.setBool('user', true);
        await _sharedPreferencesService.setString('userId', user.id.toString());

        return Right(user);
      }
    } on LocalStorageException {
      return const Left(
          LocalStorageFailures(message: "Error saving user data"));
    } catch (e) {
      return Left(ServerFailures(message: "Error retrieving user data: $e"));
    }
  }
}

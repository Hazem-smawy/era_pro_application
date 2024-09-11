// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/constants/share_pref_keys.dart';

import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';
import 'package:era_pro_application/src/features/user/data/models/user_model.dart';
import 'package:era_pro_application/src/features/user/data/sources/user_local_data_source.dart';
import 'package:era_pro_application/src/features/user/data/sources/user_remote_data_source.dart';
import 'package:era_pro_application/src/features/user/domain/repositories/user_repository.dart';

import '../../../../core/utils/repository_helper.dart';
import '../../../main_info/data/models/main_info_model.dart';

class UserRepositoryImp extends UserRepository {
  UserRemoteDataSource userRemoteDataSource;
  UserLocalDataSource userLocalDataSource;
  final SharedPreferencesService sharedPreferencesService;

  UserRepositoryImp({
    required this.userRemoteDataSource,
    required this.userLocalDataSource,
    required this.sharedPreferencesService,
  });

  // @override
  // Future<Either<Failure, UserModel>> getUser() async {
  //   try {
  //     final userExists = sharedPreferencesService.getBool('user') ?? false;

  //     if (userExists) {
  //       final userIdString = sharedPreferencesService.getString('userId');

  //       if (userIdString == null) {
  //         return const Left(LocalStorageFailures(
  //             message: "User ID not found in shared preferences"));
  //       }

  //       final userId = int.tryParse(userIdString);

  //       if (userId == null) {
  //         return const Left(LocalStorageFailures(
  //             message: "Invalid User ID in shared preferences"));
  //       }

  //       final user = await userLocalDataSource.getUser(userId);

  //       if (user != null) {
  //         return Right(user);
  //       } else {
  //         return const Left(
  //             LocalStorageFailures(message: "User not found in local storage"));
  //       }
  //     } else {
  //       final user = await userRemoteDataSource.getUser();

  //       await userLocalDataSource.saveUser(user);
  //       await sharedPreferencesService.setBool('user', true);
  //       await sharedPreferencesService.setString('userId', user.id.toString());

  //       return Right(user);
  //     }
  //   } on LocalStorageException {
  //     return const Left(
  //         LocalStorageFailures(message: "Error saving user data"));
  //   } catch (e) {
  //     return Left(ServerFailures(message: "Error retrieving user data: $e"));
  //   }
  // }

  @override
  Future<Either<Failure, UserSettingModel>> getUserSettings() {
    return fetchSingleData(
      sharedPreferencesService: sharedPreferencesService,
      fetchLocalData: userLocalDataSource.getUserSettings,
      fetchRemoteData: userRemoteDataSource.getUserSettings,
      saveLocalData: userLocalDataSource.saveUserSettings,
      sharedPrefKey: SharedPrefKeys.USERSETTING_KEY,
      dateTimeShredPreKey: SharedPrefKeys.DATETIME_USERSETTING_KEY,
    );
  }

  @override
  Future<Either<Failure, UserModel>> getUser() {
    return fetchSingleData(
      sharedPreferencesService: sharedPreferencesService,
      fetchLocalData: userLocalDataSource.getUser,
      fetchRemoteData: userRemoteDataSource.getUser,
      saveLocalData: userLocalDataSource.saveUser,
      sharedPrefKey: SharedPrefKeys.USERINFO_KEY,
      dateTimeShredPreKey: SharedPrefKeys.DATETIME_USERINFO_KEY,
      isUserInfo: true,
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/constants/share_pref_keys.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';

import '../error/error.dart';

Future<Either<Failure, T>> fetchSingleDataFromLocalStorage<T>({
  required Future<T?> Function(int) fetchLocalData,
  required String sharedPrefKey,
  required SharedPreferencesService sharedPreferencesService,
  bool? isUserInfo = false,
}) async {
  try {
    var id = sharedPreferencesService.getString(sharedPrefKey);
    if (id != null) {
      final data = await fetchLocalData(int.parse(id));

      if (data != null) {
        return Right(data);
      } else {
        throw LocalStorageException();
      }
    } else {
      throw LocalStorageException();
    }
  } on LocalStorageException catch (e) {
    return Left(
        LocalStorageFailures(message: "Can't get data from local storage $e"));
  }
}

Future<Either<Failure, List<T>>> fetchArrayOfDataFromLocalStorage<T>({
  required Future<List<T>> Function() fetchFromLocal,
  String localError = "Unable to retrieve data from local storage.",
}) async {
  try {
    final List<T> localData = await fetchFromLocal();
    if (localData.isNotEmpty) {
      return Right(localData);
    } else {
      throw LocalStorageException();
    }
  } catch (e) {
    return Left(LocalStorageFailures(message: localError));
  }
}

Future<Either<Failure, T>> fetchSingleDataFromRemote<T>({
  required Future<T> Function() fetchRemoteData,
  required Future<int> Function(T) saveLocalData,
  required String sharedPrefKey,
  required String dateTimeShredPreKey,
  required SharedPreferencesService sharedPreferencesService,
  bool? isUserInfo = false,
}) async {
  try {
    final data = await fetchRemoteData();

    if (isUserInfo != null && isUserInfo) {
      int? id = (data as dynamic).branchId;

      await sharedPreferencesService.setString(
        SharedPrefKeys.BRANCHID_KEY,
        id.toString(),
      );
    }

    var storedId = await saveLocalData(data);
    await sharedPreferencesService.setString(
      sharedPrefKey,
      storedId.toString(),
    );
    await sharedPreferencesService.saveDateTime(
      dateTime: DateTime.now(),
      key: dateTimeShredPreKey,
    );

    return Right(data);
  } catch (e) {
    return Left(ServerFailures(message: "Server failure $e"));
  }
}

Future<Either<Failure, List<T>>> fetchArrayOfDataFromRemote<T>({
  required String cacheKey,
  required SharedPreferencesService sharedPreferencesService,
  required Future<List<T>> Function() fetchFromRemote,
  required Future<void> Function(List<T>) saveDataToLocal,
  required String dateTimeSharePrefKey,
  String remoteError = "Unable to retrieve data from server.",
}) async {
  try {
    final List<T> remoteData = await fetchFromRemote();

    if (remoteData.isNotEmpty) {
      await saveDataToLocal(remoteData);
    }
    await sharedPreferencesService.setBool(cacheKey, true);
    await sharedPreferencesService.saveDateTime(
      key: dateTimeSharePrefKey,
      dateTime: DateTime.now(),
    );
    return Right(remoteData);
  } catch (e) {
    return Left(ServerFailures(message: remoteError));
  }
}

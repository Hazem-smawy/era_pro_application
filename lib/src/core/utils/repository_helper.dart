import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';

import '../error/error.dart';

Future<Either<Failure, T>> fetchSingleData<T>({
  required Future<T?> Function(int) fetchLocalData,
  required Future<T> Function() fetchRemoteData,
  required Future<int> Function(T) saveLocalData,
  required String sharedPrefKey,
  required String dateTimeShredPreKey,
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
      final data = await fetchRemoteData();
      if (data != null) {
        if (isUserInfo != null && isUserInfo) {
          int? id = (data as dynamic).branchId;

          await sharedPreferencesService.setString(
            'userBranchId',
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
      } else {
        return const Left(ServerFailures(message: "Server failure"));
      }
    }
  } on LocalStorageException catch (e) {
    return Left(
        LocalStorageFailures(message: "Can't get data from local storage $e"));
  } on ServerException {
    return const Left(ServerFailures(message: "Can't get data from server"));
  } catch (e) {
    return const Left(ServerFailures(message: "Server failure"));
  }
}

Future<Either<Failure, List<T>>> fetchArrayOfData<T>({
  required String cacheKey,
  required SharedPreferencesService sharedPreferencesService,
  required Future<List<T>> Function() fetchFromLocal,
  required Future<List<T>> Function() fetchFromRemote,
  required Future<void> Function(List<T>) saveDataToLocal,
  required String dateTimeSharePrefKey,
  String localError = "Unable to retrieve data from local storage.",
  String remoteError = "Unable to retrieve data from server.",
  String genericError = "An unexpected error occurred while fetching data.",
}) async {
  try {
    final bool? isDataCached = sharedPreferencesService.getBool(cacheKey);

    if (isDataCached != null && isDataCached) {
      final List<T> localData = await fetchFromLocal();

      if (localData.isNotEmpty) {
        return Right(localData);
      } else {
        throw LocalStorageException();
      }
    } else {
      final List<T> remoteData = await fetchFromRemote();
      await saveDataToLocal(remoteData);
      await sharedPreferencesService.setBool(cacheKey, true);
      await sharedPreferencesService.saveDateTime(
        key: dateTimeSharePrefKey,
        dateTime: DateTime.now(),
      );

      return Right(remoteData);
    }
  } on LocalStorageException {
    return Left(LocalStorageFailures(message: localError));
  } on ServerException {
    return Left(ServerFailures(message: remoteError));
  } catch (e) {
    return Left(ServerFailures(message: genericError));
  }
}

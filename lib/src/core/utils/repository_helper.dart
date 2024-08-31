import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../error/error.dart';
import '../error/failures.dart';

Future<Either<Failure, T>> fetchSingleData<T>({
  required Future<T?> Function() fetchLocalData,
  required Future<T> Function() fetchRemoteData,
  required Future<void> Function(T) saveLocalData,
  required String sharedPrefKey,
  required SharedPreferencesService sharedPreferencesService,
}) async {
  try {
    var id = sharedPreferencesService.getString(sharedPrefKey);
    if (id != null) {
      final data = await fetchLocalData();
      if (data != null) {
        return Right(data);
      } else {
        throw LocalStorageException();
      }
    } else {
      final data = await fetchRemoteData();
      if (data != null) {
        // Assuming data has an id property, replace `data.id` with the actual way to access the id.
        final String id = (data as dynamic).id?.toString() ??
            ''; // Casting to dynamic to access id
        await sharedPreferencesService.setString(sharedPrefKey, id);
        await saveLocalData(data);
        return Right(data);
      } else {
        return const Left(ServerFailures(message: "Server failure"));
      }
    }
  } on LocalStorageException {
    return const Left(
        LocalStorageFailures(message: "Can't get data from local storage"));
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

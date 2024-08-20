// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/exception.dart';

import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';
import 'package:era_pro_application/src/features/main_info/data/models/branch_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/company_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/curency_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/item_group_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/item_units_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/unit_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/user_store_model.dart';
import 'package:era_pro_application/src/features/main_info/data/sources/main_info_local_datasource.dart';
import 'package:era_pro_application/src/features/main_info/data/sources/main_info_remote_datasource.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/item_units_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/repositories/main_info_repository.dart';

class MainInfoRepositoryImp implements MainInfoRepository {
  MainInfoLocalDatasource mainInfoLocalDatasource;
  MainInfoRemoteDatasource mainInfoRemoteDatasource;
  SharedPreferencesService sharedPreferencesService;
  MainInfoRepositoryImp({
    required this.mainInfoLocalDatasource,
    required this.mainInfoRemoteDatasource,
    required this.sharedPreferencesService,
  });
/*
  // @override
  // Future<Either<Failure, BranchEntity>> getBranchInfo() async {
  //   try {
  //     var branchId = sharedPreferencesService.getString('branchId');
  //     if (branchId != null) {
  //       final branch =
  //           await mainInfoLocalDatasource.getBranchInfo(int.parse(branchId));
  //       if (branch != null) {
  //         return Right(branch);
  //       } else {
  //         throw LocalStorageException();
  //       }
  //     } else {
  //       final branch = await mainInfoRemoteDatasource.getBranchInfo();
  //       await sharedPreferencesService.setString(
  //           'branchId', branch.id.toString());
  //       await mainInfoLocalDatasource.saveBranchInfo(branch);
  //       return Right(branch);
  //     }
  //   } on LocalStorageException {
  //     return const Left(
  //         LocalStorageFailures(message: "can't get branch info from local"));
  //   } on ServerException {
  //     return const Left(
  //         ServerFailures(message: "can't get branch inf from server"));
  //   } catch (e) {
  //     return const Left(ServerFailures(message: "server failures"));
  //   }
  // }

  // @override
  // Future<Either<Failure, CompanyEntity>> getCompnayInfo() async {
  //   try {
  //     var companyId = sharedPreferencesService.getString('companyId');
  //     if (companyId != null) {
  //       final company =
  //           await mainInfoLocalDatasource.getCompanyInfo(int.parse(companyId));
  //       if (company != null) {
  //         return Right(company);
  //       } else {
  //         throw LocalStorageException();
  //       }
  //     } else {
  //       final company = await mainInfoRemoteDatasource.getCompanyInfo();
  //       await sharedPreferencesService.setString(
  //           'companyId', company.id.toString());
  //       await mainInfoLocalDatasource.saveCompanyInfo(company);
  //       return Right(company);
  //     }
  //   } on LocalStorageException {
  //     return const Left(
  //         LocalStorageFailures(message: "can't get company info from local"));
  //   } on ServerException {
  //     return const Left(
  //         ServerFailures(message: "can't get company inf from server"));
  //   } catch (e) {
  //     return const Left(ServerFailures(message: "server failures"));
  //   }
  // }
  */

  @override
  Future<Either<Failure, BranchModel>> getBranchInfo() async {
    return _fetchData(
      fetchLocalData: () => mainInfoLocalDatasource.getBranchInfo(
          int.parse(sharedPreferencesService.getString('branchId') ?? '0')),
      fetchRemoteData: mainInfoRemoteDatasource.getBranchInfo,
      saveLocalData: mainInfoLocalDatasource.saveBranchInfo,
      sharedPrefKey: 'branchId',
    );
  }

  @override
  Future<Either<Failure, CompanyModel>> getCompnayInfo() async {
    return _fetchData(
      fetchLocalData: () => mainInfoLocalDatasource.getCompanyInfo(
          int.parse(sharedPreferencesService.getString('companyId') ?? '0')),
      fetchRemoteData: mainInfoRemoteDatasource.getCompanyInfo,
      saveLocalData: mainInfoLocalDatasource.saveCompanyInfo,
      sharedPrefKey: 'companyId',
    );
  }

  //curencies

  @override
  Future<Either<Failure, List<CurencyModel>>> getAllCurencies() async {
    return _fetchAndCacheData<CurencyModel>(
      cacheKey: 'curency',
      fetchFromLocal: mainInfoLocalDatasource.getAllCurency,
      fetchFromRemote: mainInfoRemoteDatasource.getAllCurency,
      saveDataToLocal: mainInfoLocalDatasource.saveAllCurency,
      localError: "Failed to retrieve curency information from local storage.",
      remoteError: "Failed to retrieve curency information from the server.",
      genericError:
          "An unexpected error occurred while retrieving curency information.",
    );
  }

  @override
  Future<Either<Failure, UserStoreModel>> getUserStoreInfo() {
    return _fetchData(
      fetchLocalData: () => mainInfoLocalDatasource.getUserStoreInfo(int.parse(
          sharedPreferencesService.getString('userStoreInfo') ?? '0')),
      fetchRemoteData: mainInfoRemoteDatasource.getUserStoreInfo,
      saveLocalData: mainInfoLocalDatasource.saveUserStoreInfo,
      sharedPrefKey: 'userStoreInfoId',
    );
  }

  @override
  Future<Either<Failure, List<ItemGroupModel>>> getItemGroups() async {
    return _fetchAndCacheData<ItemGroupModel>(
      cacheKey: 'itemGroup',
      fetchFromLocal: mainInfoLocalDatasource.getAllItemGroups,
      fetchFromRemote: mainInfoRemoteDatasource.getAllItemGroups,
      saveDataToLocal: mainInfoLocalDatasource.saveAllItemGroups,
      localError:
          "Failed to retrieve itemGroup information from local storage.",
      remoteError: "Failed to retrieve itemGroup information from the server.",
      genericError:
          "An unexpected error occurred while retrieving itemGroup information.",
    );
  }

  @override
  Future<Either<Failure, List<UnitModel>>> getUnits() async {
    return _fetchAndCacheData<UnitModel>(
      cacheKey: 'units',
      fetchFromLocal: mainInfoLocalDatasource.getAllUnits,
      fetchFromRemote: mainInfoRemoteDatasource.getAllUnits,
      saveDataToLocal: mainInfoLocalDatasource.saveAllUnits,
      localError: "Failed to retrieve units information from local storage.",
      remoteError: "Failed to retrieve units information from the server.",
      genericError:
          "An unexpected error occurred while retrieving units information.",
    );
  }

  @override
  Future<Either<Failure, List<ItemUnitsEntity>>> getItemUnits() async {
    return _fetchAndCacheData<ItemUnitsModel>(
      cacheKey: 'itemUnits',
      fetchFromLocal: mainInfoLocalDatasource.getAllItemUnits,
      fetchFromRemote: mainInfoRemoteDatasource.getAllItemUnit,
      saveDataToLocal: mainInfoLocalDatasource.saveAllItemUnits,
      localError: "can't get item units info from local",
      remoteError: "can't get item units info from server",
      genericError: "server failures to get item units",
    );
  }

  Future<Either<Failure, T>> _fetchData<T>({
    required Future<T?> Function() fetchLocalData,
    required Future<T> Function() fetchRemoteData,
    required Future<void> Function(T) saveLocalData,
    required String sharedPrefKey,
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

  Future<Either<Failure, List<T>>> _fetchAndCacheData<T>({
    required String cacheKey,
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
}
/**
 

 
 */

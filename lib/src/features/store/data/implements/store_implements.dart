// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/features/store/data/sources/store_local_datasource.dart';
import 'package:era_pro_application/src/features/store/data/sources/store_remote_datasource.dart';
import 'package:era_pro_application/src/features/store/domain/entities/item_details_entity.dart';
import 'package:era_pro_application/src/features/store/domain/repositories/store_repositories.dart';
import '../../../../core/constants/share_pref_keys.dart';
import '../models/models.dart';

import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';

import '../../../../core/utils/repository_helper.dart';

class StoreRepositoryImpl implements StoreRepository {
  StoreLocalDatasource storeLocalDatasource;
  StoreRemoteDatasource storeRemoteDatasource;

  SharedPreferencesService sharedPreferencesService;
  StoreRepositoryImpl({
    required this.storeLocalDatasource,
    required this.storeRemoteDatasource,
    required this.sharedPreferencesService,
  });

  //curencies

  @override
  Future<Either<Failure, List<ItemGroupModel>>> getItemGroups() async {
    return fetchArrayOfData<ItemGroupModel>(
      sharedPreferencesService: sharedPreferencesService,
      cacheKey: SharedPrefKeys.ITEMGROUP_KEY,
      dateTimeSharePrefKey: SharedPrefKeys.DATETIME_ITEMGROUP_KEY,
      fetchFromLocal: storeLocalDatasource.getAllItemGroups,
      fetchFromRemote: storeRemoteDatasource.getAllItemGroups,
      saveDataToLocal: storeLocalDatasource.saveAllItemGroups,
      localError:
          "Failed to retrieve itemGroup information from local storage.",
      remoteError: "Failed to retrieve itemGroup information from the server.",
      genericError:
          "An unexpected error occurred while retrieving itemGroup information.",
    );
  }

  @override
  Future<Either<Failure, List<UnitModel>>> getUnits() async {
    return fetchArrayOfData<UnitModel>(
      sharedPreferencesService: sharedPreferencesService,
      cacheKey: SharedPrefKeys.UNITS_KEY,
      dateTimeSharePrefKey: SharedPrefKeys.DATETIME_UNITS_KEY,
      fetchFromLocal: storeLocalDatasource.getAllUnits,
      fetchFromRemote: storeRemoteDatasource.getAllUnits,
      saveDataToLocal: storeLocalDatasource.saveAllUnits,
      localError: "Failed to retrieve units information from local storage.",
      remoteError: "Failed to retrieve units information from the server.",
      genericError:
          "An unexpected error occurred while retrieving units information.",
    );
  }

  @override
  Future<Either<Failure, List<ItemUnitsModel>>> getItemUnits() async {
    return fetchArrayOfData<ItemUnitsModel>(
      sharedPreferencesService: sharedPreferencesService,
      cacheKey: SharedPrefKeys.ITEMUNITS_KEY,
      dateTimeSharePrefKey: SharedPrefKeys.DATETIME_ITEMUNITS_KEY,
      fetchFromLocal: storeLocalDatasource.getAllItemUnits,
      fetchFromRemote: storeRemoteDatasource.getAllItemUnit,
      saveDataToLocal: storeLocalDatasource.saveAllItemUnits,
      localError: "can't get item units info from local",
      remoteError: "can't get item units info from server",
      genericError: "server failures to get item units",
    );
  }

  @override
  Future<Either<Failure, List<ItemModel>>> getItems() {
    return fetchArrayOfData<ItemModel>(
      sharedPreferencesService: sharedPreferencesService,
      cacheKey: SharedPrefKeys.ITEMS_KEY,
      dateTimeSharePrefKey: SharedPrefKeys.DATETIME_ITEMS_KEY,
      fetchFromLocal: storeLocalDatasource.getAllItems,
      fetchFromRemote: storeRemoteDatasource.getAllItems,
      saveDataToLocal: storeLocalDatasource.saveAllItems,
      localError: "can't get item info from local",
      remoteError: "can't get item info from server",
      genericError: "server failures to get item",
    );
  }

  @override
  Future<Either<Failure, List<ItemAlterModel>>> getItemAlter() {
    return fetchArrayOfData<ItemAlterModel>(
      sharedPreferencesService: sharedPreferencesService,
      cacheKey: SharedPrefKeys.ITEMALTER_KEY,
      dateTimeSharePrefKey: SharedPrefKeys.DATETIME_ITEMALTER_KEY,
      fetchFromLocal: storeLocalDatasource.getAllItemAlter,
      fetchFromRemote: storeRemoteDatasource.getAllItemAlter,
      saveDataToLocal: storeLocalDatasource.saveAllItemAlter,
      localError: "can't get Item_alter info from local",
      remoteError: "can't get Item_alter info from server",
      genericError: "server failures to get Item_alter",
    );
  }

  @override
  Future<Either<Failure, List<BarcodeModel>>> getAllItemBarcodes() async {
    return fetchArrayOfData<BarcodeModel>(
      sharedPreferencesService: sharedPreferencesService,
      cacheKey: SharedPrefKeys.ITEMBARCODE_KEY,
      dateTimeSharePrefKey: SharedPrefKeys.DATETIME_ITEMBARCODE_KEY,
      fetchFromLocal: storeLocalDatasource.getAllItemBarcode,
      fetchFromRemote: storeRemoteDatasource.getAllBarcode,
      saveDataToLocal: storeLocalDatasource.saveAllItemBarcode,
      localError: "can't get Item_alter info from local",
      remoteError: "can't get Item_alter info from server",
      genericError: "server failures to get Item_alter",
    );
  }

  @override
  Future<Either<Failure, UserStoreModel>> getUserStoreInfo() {
    return fetchSingleData(
        sharedPreferencesService: sharedPreferencesService,
        fetchLocalData: storeLocalDatasource.getUserStoreInfo,
        fetchRemoteData: storeRemoteDatasource.getUserStoreInfo,
        saveLocalData: storeLocalDatasource.saveUserStoreInfo,
        sharedPrefKey: SharedPrefKeys.USERSTORE_KEY,
        dateTimeShredPreKey: SharedPrefKeys.DATETIME_USERSTORE_KEY);
  }

  @override
  Future<Either<Failure, List<StoreOperationModel>>> getStoreOperations() {
    return fetchArrayOfData<StoreOperationModel>(
      sharedPreferencesService: sharedPreferencesService,
      cacheKey: SharedPrefKeys.STOREOPERATION_KEY,
      dateTimeSharePrefKey: SharedPrefKeys.DATETIME_STOREOPERATION_KEY,
      fetchFromLocal: storeLocalDatasource.getAllStoreOperation,
      fetchFromRemote: storeRemoteDatasource.getAllStoreOperation,
      saveDataToLocal: storeLocalDatasource.saveAllStoreOperation,
      localError: "can't get  storeOperation info from local",
      remoteError: "can't get storeOperation info from server",
      genericError: "server failures to get storeOperation",
    );
  }

  @override
  Future<Either<Failure, List<StoreItemDetailsEntity>>>
      getAllItemsWithDetails() async {
    try {
      final data = await storeLocalDatasource.getAllItemsWithDetails();
      return Right(data);
    } catch (e) {
      return const Left(
        LocalStorageFailures(message: "cant't get all items with details"),
      );
    }
  }

  // @override
  // Future<Either<Failure, StoreItemDetailsEntity>> getItemDetails(int id) async {
  //   try {
  //     final data = await storeLocalDatasource.getItemDetails(id);
  //     return Right(data);
  //   } catch (e) {
  //     return Left(
  //       LocalStorageFailures(message: "can't get details of item with id $id"),
  //     );
  //   }
  // }
}
/**
 

 
 */

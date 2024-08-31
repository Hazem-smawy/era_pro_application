// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import 'package:era_pro_application/src/core/error/error.dart';
import 'package:era_pro_application/src/core/utils/usecase_helper.dart';
import 'package:era_pro_application/src/features/main_info/domain/usecases/get_user_settings_usecase.dart';
import 'package:era_pro_application/src/features/main_info/domain/usecases/get_user_store_info_usecase.dart';

import '../../domain/entities/main_info_entity.dart';
import '../../domain/usecases/main_info_usecase.dart';

typedef Usecase<T> = Future<Either<Failure, T>> Function();

class MainInfoController extends GetxController {
  GetBranchUsecase getBranchUsecase;
  GetCompanyUsecase getCompanyUsecase;
  GetAllCurenciesUseCase getAllCurenciesUsecase;
  GetAllUnitsUsecase getAllUnitsUsecase;
  GetAllItemsUsecase getAllItemsUsecase;
  GetAllPaymentsUsecase getAllPaymentsUsecase;
  GetAllSystemDocsUsecase getAllSystemDocsUsecase;
  GetAllItemBarcodeUsecase getAllItemBarcodeUsecase;
  GetAllItemAlterUsecase getAllItemAlterUsecase;
  GetAllItemGroupsUsecase getAllItemGroupsUsecase;
  GetUserStoreInfoUsecase getUserStoreInfoUsecase;

  GetUserSettingsUsecase getUserSettingsUsecase;
  var company = Rx<CompanyEntity?>(null);

  var branch = Rx<BranchEntity?>(null);
  var userSettings = Rx<UserSettingEntity?>(null);
  var userStoreInfo = Rx<UserStoreEntity?>(null);

  var allCurencies = Rx<List<CurencyEntity>>([]);
  var allItemBarcode = Rx<List<BarcodeEntity>>([]);
  var allItemAlter = Rx<List<ItemAlterEntity>>([]);
  var allItems = Rx<List<ItemEntity>>([]);
  var allPaymentsMethod = Rx<List<PaymentEntity>>([]);
  var allSystemDocs = Rx<List<SystemDocEntity>>([]);
  var allItemGroups = Rx<List<ItemGroupEntity>>([]);

  var units = Rx<List<UnitEnitity>>([]);
  final errorMessage = ''.obs;

  MainInfoController({
    required this.getBranchUsecase,
    required this.getCompanyUsecase,
    required this.getAllCurenciesUsecase,
    required this.getAllUnitsUsecase,
    required this.getAllItemsUsecase,
    required this.getAllPaymentsUsecase,
    required this.getAllSystemDocsUsecase,
    required this.getAllItemBarcodeUsecase,
    required this.getAllItemAlterUsecase,
    required this.getAllItemGroupsUsecase,
    required this.getUserStoreInfoUsecase,
    required this.getUserSettingsUsecase,
  });

  @override
  void onInit() {
    super.onInit();
    getBranchInfo();
    getCompanyInfo();
    getAllCurenciesInfo();
    getAllUnits();
    getAllItems();
    getAllPaymentsMethod();
    getAllSystemDocs();
    getUserSettings();
    getAllItemBarcode();
    getAllItemAlter();
    getAllItemGroupsInfo();
    getUserStoreInfo();
  }

  Future<void> getBranchInfo() async {
    await handleUsecase(
      usecase: getBranchUsecase.call,
      target: branch,
      errorMessageTarget: errorMessage,
    );
  }

  Future<void> getUserStoreInfo() async {
    await handleUsecase(
      usecase: getUserStoreInfoUsecase.call,
      target: userStoreInfo,
      errorMessageTarget: errorMessage,
    );
  }

  Future<void> getCompanyInfo() async {
    await handleUsecase(
      usecase: getCompanyUsecase.call,
      target: company,
      errorMessageTarget: errorMessage,
    );
  }

  Future<void> getUserSettings() async {
    await handleUsecase(
      usecase: getUserSettingsUsecase.call,
      target: userSettings,
      errorMessageTarget: errorMessage,
    );
  }

  Future<List<CurencyEntity>> getAllCurenciesInfo() async {
    await handleUsecase(
      usecase: getAllCurenciesUsecase.call,
      target: allCurencies,
      errorMessageTarget: errorMessage,
    );

    return allCurencies.value;
  }

  Future<List<ItemGroupEntity>> getAllItemGroupsInfo() async {
    await handleUsecase(
      usecase: getAllItemGroupsUsecase.call,
      target: allItemGroups,
      errorMessageTarget: errorMessage,
    );

    return allItemGroups.value;
  }

  Future<List<CurencyEntity>> getAllItemBarcode() async {
    await handleUsecase(
      usecase: getAllItemBarcodeUsecase.call,
      target: allItemBarcode,
      errorMessageTarget: errorMessage,
    );

    return allCurencies.value;
  }

  Future<List<ItemAlterEntity>> getAllItemAlter() async {
    await handleUsecase(
      usecase: getAllItemAlterUsecase.call,
      target: allItemAlter,
      errorMessageTarget: errorMessage,
    );

    return allItemAlter.value;
  }

  Future<void> getAllUnits() async {
    await handleUsecase(
      usecase: getAllUnitsUsecase.call,
      target: units,
      errorMessageTarget: errorMessage,
    );
  }

  Future<List<ItemEntity>> getAllItems() async {
    await handleUsecase(
      usecase: getAllItemsUsecase.call,
      target: allItems,
      errorMessageTarget: errorMessage,
    );

    return allItems.value;
  }

  Future<void> getAllPaymentsMethod() async {
    await handleUsecase(
      usecase: getAllPaymentsUsecase.call,
      target: allPaymentsMethod,
      errorMessageTarget: errorMessage,
    );
  }

  Future<void> getAllSystemDocs() async {
    await handleUsecase(
      usecase: getAllSystemDocsUsecase.call,
      target: allSystemDocs,
      errorMessageTarget: errorMessage,
    );
  }
}

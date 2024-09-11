// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/features/store/domain/entities/item_details_entity.dart';
import 'package:get/get.dart';

import 'package:era_pro_application/src/core/error/error.dart';
import 'package:era_pro_application/src/core/utils/usecase_helper.dart';
import 'package:era_pro_application/src/features/main_info/domain/usecases/main_info_usecase.dart';
import 'package:era_pro_application/src/features/store/domain/usecases/get_all_item_details_usecase.dart';
import 'package:era_pro_application/src/features/store/domain/usecases/get_all_store_operation_usecase.dart';

import '../../domain/entities/store_entity.dart';
import '../../domain/usecases/store_usecases.dart';

typedef Usecase<T> = Future<Either<Failure, T>> Function();

class StoreController extends GetxController {
  GetAllItemsUsecase getAllItemsUsecase;
  GetAllItemAlterUsecase getAllItemAlterUsecase;
  GetAllUnitsUsecase getAllUnitsUsecase;
  GetAllItemBarcodeUsecase getAllItemBarcodeUsecase;
  GetAllItemUnitsUsecase getAllItemUnitsUsecase;
  GetAllItemGroupsUsecase getAllItemGroupsUsecase;
  GetUserStoreInfoUsecase getUserStoreInfoUsecase;
  GetAllStoreOperationUsecase getAllStoreOperationUsecase;
  GetAllItemWithDetailsUsecase getAllItemWithDetailsUsecase;
  StoreController({
    required this.getAllItemsUsecase,
    required this.getAllItemAlterUsecase,
    required this.getAllUnitsUsecase,
    required this.getAllItemBarcodeUsecase,
    required this.getAllItemUnitsUsecase,
    required this.getAllItemGroupsUsecase,
    required this.getUserStoreInfoUsecase,
    required this.getAllStoreOperationUsecase,
    required this.getAllItemWithDetailsUsecase,
  });

  var allItemBarcode = Rx<List<BarcodeEntity>>([]);
  var allItemAlter = Rx<List<ItemAlterEntity>>([]);
  var allItems = Rx<List<ItemEntity>>([]);
  var allItemsUnits = Rx<List<ItemUnitsEntity>>([]);
  var allStoreOperations = Rx<List<StoreOperationEntity>>([]);

  var allItemGroups = Rx<List<ItemGroupEntity>>([]);
  var allItemsWithDetails = Rx<List<StoreItemDetailsEntity>>([]);
  var units = Rx<List<UnitEnitity>>([]);
  var userStoreInfo = Rx<UserStoreEntity?>(null);
  final errorMessage = ''.obs;
  var selectedGroupId = 0.obs;
  var itemsInCategory = Rx<List<StoreItemDetailsEntity>>([]);

  //actions

  var selectedPrices = <int, Rx<double>>{}.obs;
  var selectedPriceIndex = <int, RxInt>{}.obs;

  @override
  void onInit() {
    super.onInit();
    getAllStoreInfo();
  }

  Future getAllStoreInfo() async {
    await getAllUnits();
    await getAllItemGroupsInfo();
    await getAllItems();
    await getAllItemsUnit();
    await getAllItemAlter();
    await getAllItemBarcode();
    await getUserStoreInfo();
    await getStoreOperations();
    await getAllItemsWithDetails();
  }

  void updatePriceIndex(int unitHash, int newIndex) {
    selectedPriceIndex[unitHash]?.value = newIndex;
    print(unitHash);
  }

  // Get the selected price for the given unit hash
  double getSelectedPrice(int unitHash, List<double> prices) {
    int index = selectedPriceIndex[unitHash]?.value ?? 0;
    return prices[index];
  }

  Future<List<ItemGroupEntity>> getAllItemGroupsInfo() async {
    await handleUsecase(
      usecase: getAllItemGroupsUsecase.call,
      target: allItemGroups,
      errorMessageTarget: errorMessage,
    );

    return allItemGroups.value;
  }

  Future<List<StoreItemDetailsEntity>> getAllItemsWithDetails() async {
    await handleUsecase(
      usecase: getAllItemWithDetailsUsecase.call,
      target: allItemsWithDetails,
      errorMessageTarget: errorMessage,
    );
    itemsInCategory.value = allItemsWithDetails.value;
    return itemsInCategory.value;
  }

  Future<List<StoreOperationEntity>> getStoreOperations() async {
    await handleUsecase(
      usecase: getAllStoreOperationUsecase.call,
      target: allStoreOperations,
      errorMessageTarget: errorMessage,
    );

    return allStoreOperations.value;
  }

  Future<List<BarcodeEntity>> getAllItemBarcode() async {
    await handleUsecase(
      usecase: getAllItemBarcodeUsecase.call,
      target: allItemBarcode,
      errorMessageTarget: errorMessage,
    );

    return allItemBarcode.value;
  }

  Future<List<ItemAlterEntity>> getAllItemAlter() async {
    await handleUsecase(
      usecase: getAllItemAlterUsecase.call,
      target: allItemAlter,
      errorMessageTarget: errorMessage,
    );

    return allItemAlter.value;
  }

  Future<List<UnitEnitity>> getAllUnits() async {
    await handleUsecase(
      usecase: getAllUnitsUsecase.call,
      target: units,
      errorMessageTarget: errorMessage,
    );
    return units.value;
  }

  Future<UserStoreEntity?> getUserStoreInfo() async {
    await handleUsecase(
      usecase: getUserStoreInfoUsecase.call,
      target: userStoreInfo,
      errorMessageTarget: errorMessage,
    );

    return userStoreInfo.value;
  }

  Future<List<ItemEntity>> getAllItems() async {
    await handleUsecase(
      usecase: getAllItemsUsecase.call,
      target: allItems,
      errorMessageTarget: errorMessage,
    );

    return allItems.value;
  }

  Future<List<ItemUnitsEntity>> getAllItemsUnit() async {
    await handleUsecase(
      usecase: getAllItemUnitsUsecase.call,
      target: allItemsUnits,
      errorMessageTarget: errorMessage,
    );

    return allItemsUnits.value;
  }

  Future<void> changeCategory(int? groupId) async {
    if (groupId != null) {
      selectedGroupId.value = groupId;
      itemsInCategory.value = allItemsWithDetails.value
          .where(
            (item) => item.item.itemGroupId == groupId,
          )
          .toList();
    } else {
      itemsInCategory.value = allItemsWithDetails.value;
      selectedGroupId.value = 0;
    }
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import 'package:era_pro_application/src/core/error/error.dart';
import 'package:era_pro_application/src/core/utils/usecase_helper.dart';

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
  StoreController({
    required this.getAllItemsUsecase,
    required this.getAllItemAlterUsecase,
    required this.getAllUnitsUsecase,
    required this.getAllItemBarcodeUsecase,
    required this.getAllItemUnitsUsecase,
    required this.getAllItemGroupsUsecase,
  });

  var allItemBarcode = Rx<List<BarcodeEntity>>([]);
  var allItemAlter = Rx<List<ItemAlterEntity>>([]);
  var allItems = Rx<List<ItemEntity>>([]);

  var allItemGroups = Rx<List<ItemGroupEntity>>([]);

  var units = Rx<List<UnitEnitity>>([]);
  final errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();

    getAllUnits();
    getAllItems();

    getAllItemBarcode();
    getAllItemAlter();
    getAllItemGroupsInfo();
  }

  Future<List<ItemGroupEntity>> getAllItemGroupsInfo() async {
    await handleUsecase(
      usecase: getAllItemGroupsUsecase.call,
      target: allItemGroups,
      errorMessageTarget: errorMessage,
    );

    return allItemGroups.value;
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
}

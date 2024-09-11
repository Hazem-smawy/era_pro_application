import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/store_entity.dart';

abstract class StoreRepository {
  // Future<User> getUser(String userId);
  Future<Either<Failure, List<ItemAlterEntity>>> getItemAlter();
  Future<Either<Failure, List<BarcodeEntity>>> getAllItemBarcodes();
  Future<Either<Failure, List<ItemEntity>>> getItems();
  Future<Either<Failure, List<ItemGroupEntity>>> getItemGroups();
  Future<Either<Failure, List<UnitEnitity>>> getUnits();

  Future<Either<Failure, List<ItemUnitsEntity>>> getItemUnits();
}

import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import '../entities/main_info_entity.dart';

abstract class MainInfoRepository {
  Future<Either<Failure, BranchEntity>> getBranchInfo();
  Future<Either<Failure, CompanyEntity>> getCompnayInfo();
  Future<Either<Failure, List<CurencyEntity>>> getAllCurencies();
  Future<Either<Failure, UserStoreEntity>> getUserStoreInfo();
  Future<Either<Failure, List<ItemGroupEntity>>> getItemGroups();
  Future<Either<Failure, List<UnitEnitity>>> getUnits();

  Future<Either<Failure, List<ItemUnitsEntity>>> getItemUnits();

  Future<Either<Failure, List<ItemEntity>>> getItems();
  Future<Either<Failure, List<PaymentEntity>>> getPaymentMethods();
  Future<Either<Failure, List<SystemDocEntity>>> getSystemDocs();
  Future<Either<Failure, UserSettingEntity>> getUserSettings();
  Future<Either<Failure, List<ItemAlterEntity>>> getItemAlter();
  Future<Either<Failure, List<BarcodeEntity>>> getAllItemBarcodes();
}

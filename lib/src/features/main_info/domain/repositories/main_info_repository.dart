import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/branch_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/company_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/curency_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/item_group_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/item_units_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/unit_enitity.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/user_store_entity.dart';

abstract class MainInfoRepository {
  Future<Either<Failure, BranchEntity>> getBranchInfo();
  Future<Either<Failure, CompanyEntity>> getCompnayInfo();
  Future<Either<Failure, List<CurencyEntity>>> getAllCurencies();
  Future<Either<Failure, UserStoreEntity>> getUserStoreInfo();
  Future<Either<Failure, List<ItemGroupEntity>>> getItemGroups();
  Future<Either<Failure, List<UnitEnitity>>> getUnits();

  Future<Either<Failure, List<ItemUnitsEntity>>> getItemUnits();
}

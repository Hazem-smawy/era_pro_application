import 'package:era_pro_application/src/features/main_info/data/models/branch_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/company_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/curency_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/item_group_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/item_units_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/unit_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/user_store_model.dart';

import '../../../../core/services/db/db.dart';

abstract class MainInfoLocalDatasource {
  Future<void> saveBranchInfo(BranchModel branchModel);
  Future<void> saveCompanyInfo(CompanyModel compnayModel);
  Future<void> saveUserStoreInfo(UserStoreModel userStoreInfo);
  Future<BranchModel?> getBranchInfo(int id);
  Future<CompanyModel?> getCompanyInfo(int id);
  Future<UserStoreModel?> getUserStoreInfo(int id);
  Future<void> saveAllCurency(List<CurencyModel> curencyList);
  Future<List<CurencyModel>> getAllCurency();

  Future<void> saveAllItemGroups(List<ItemGroupModel> items);
  Future<List<ItemGroupModel>> getAllItemGroups();

  Future<void> saveAllUnits(List<UnitModel> items);
  Future<List<UnitModel>> getAllUnits();

  Future<void> saveAllItemUnits(List<ItemUnitsModel> items);
  Future<List<ItemUnitsModel>> getAllItemUnits();
}

class MainInfoLocalDatasourceImp implements MainInfoLocalDatasource {
  @override
  Future<BranchModel?> getBranchInfo(int id) async {
    AppDatabase db = AppDatabase.instance();
    return db.getSingle(db.branchTable, (tbl) => tbl.id, id);
  }

  @override
  Future<CompanyModel?> getCompanyInfo(int id) async {
    AppDatabase db = AppDatabase.instance();
    return db.getSingle(db.companyTable, (tbl) => tbl.id, id);
  }

  @override
  Future<void> saveBranchInfo(BranchModel branchModel) async {
    AppDatabase db = AppDatabase.instance();
    db.saveSingle(db.branchTable, branchModel.toCompanion());
  }

  @override
  Future<void> saveCompanyInfo(CompanyModel compnayModel) async {
    AppDatabase db = AppDatabase.instance();
    db.saveSingle(db.companyTable, compnayModel.toCompanion());
  }

  @override
  Future<void> saveAllCurency(
    List<CurencyModel> curencyList,
  ) async {
    AppDatabase db = AppDatabase.instance();
    await db.saveAll(
      db.curencyTable,
      curencyList
          .map((currency) => currency.toCurencyTableComapnion())
          .toList(),
    );
  }

  @override
  Future<List<CurencyModel>> getAllCurency() async {
    AppDatabase db = AppDatabase.instance();

    return db.getAll(db.curencyTable);
  }

  @override
  Future<List<ItemGroupModel>> getAllItemGroups() {
    AppDatabase db = AppDatabase.instance();

    return db.getAll(db.itemGroupTable);
  }

  @override
  Future<List<UnitModel>> getAllUnits() {
    AppDatabase db = AppDatabase.instance();

    return db.getAll(db.unitTable);
  }

  @override
  Future<UserStoreModel?> getUserStoreInfo(int id) {
    AppDatabase db = AppDatabase.instance();

    return db.getSingle(db.userStoreTable, (tbl) => tbl.id, id);
  }

  @override
  Future<void> saveAllItemGroups(List<ItemGroupModel> items) async {
    AppDatabase db = AppDatabase.instance();
    await db.saveAll(
      db.itemGroupTable,
      items.map((currency) => currency.toCompanion()).toList(),
    );
  }

  @override
  Future<void> saveAllUnits(List<UnitModel> items) async {
    AppDatabase db = AppDatabase.instance();
    await db.saveAll(
      db.unitTable,
      items.map((currency) => currency.toCompanion()).toList(),
    );
  }

  @override
  Future<void> saveUserStoreInfo(UserStoreModel userStoreInfo) async {
    AppDatabase db = AppDatabase.instance();
    db.saveSingle(db.userStoreTable, userStoreInfo.toCompanion());
  }

  @override
  Future<List<ItemUnitsModel>> getAllItemUnits() {
    AppDatabase db = AppDatabase.instance();

    return db.getAll(db.itemUnitTable);
  }

  @override
  Future<void> saveAllItemUnits(List<ItemUnitsModel> items) async {
    AppDatabase db = AppDatabase.instance();
    await db.saveAll(
      db.itemUnitTable,
      items.map((item) => item.toCompanion()).toList(),
    );
  }
}

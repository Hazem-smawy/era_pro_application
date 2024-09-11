import '../models/main_info_model.dart';

import '../../../../core/services/db/db.dart';

abstract class MainInfoLocalDatasource {
  Future<int> saveBranchInfo(BranchModel branchModel);
  Future<int> saveCompanyInfo(CompanyModel compnayModel);

  Future<BranchModel?> getBranchInfo(int id);
  Future<CompanyModel?> getCompanyInfo(int id);
  Future<void> saveAllCurency(List<CurencyModel> curencyList);
  Future<List<CurencyModel>> getAllCurency();

  Future<void> saveAllUnits(List<UnitModel> items);
  Future<List<UnitModel>> getAllUnits();

  Future<void> saveAllPaymentMethod(List<PaymentModel> items);
  Future<List<PaymentModel>> getAllPaymentMethod();

  Future<void> saveAllSystemDocs(List<SystemDocModel> items);
  Future<List<SystemDocModel>> getAllSystemDocs();

  //item alter and barcode
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
  Future<int> saveBranchInfo(BranchModel branchModel) async {
    AppDatabase db = AppDatabase.instance();
    var id = await db.saveSingle(db.branchTable, branchModel.toCompanion());
    return id;
  }

  @override
  Future<int> saveCompanyInfo(CompanyModel compnayModel) async {
    AppDatabase db = AppDatabase.instance();
    var id = await db.saveSingle(db.companyTable, compnayModel.toCompanion());
    return id;
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

    return await db.getAll(db.curencyTable);
  }

  @override
  Future<List<UnitModel>> getAllUnits() async {
    AppDatabase db = AppDatabase.instance();

    return await db.getAll(db.unitTable);
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
  Future<List<PaymentModel>> getAllPaymentMethod() async {
    AppDatabase db = AppDatabase.instance();

    return await db.getAll(db.paymentTable);
  }

  @override
  Future<List<SystemDocModel>> getAllSystemDocs() async {
    AppDatabase db = AppDatabase.instance();

    return await db.getAll(db.systemDocTable);
  }

  @override
  Future<void> saveAllPaymentMethod(List<PaymentModel> items) async {
    AppDatabase db = AppDatabase.instance();
    await db.saveAll(
      db.paymentTable,
      items.map((item) => item.toCompanion()).toList(),
    );
  }

  @override
  Future<void> saveAllSystemDocs(List<SystemDocModel> items) async {
    AppDatabase db = AppDatabase.instance();
    await db.saveAll(
      db.systemDocTable,
      items.map((item) => item.toCompanion()).toList(),
    );
  }
}

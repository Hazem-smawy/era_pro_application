// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:era_pro_application/src/core/api/api.dart';
import 'package:era_pro_application/src/core/api/methods.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';
import 'package:era_pro_application/src/features/main_info/data/models/barcode_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/branch_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/company_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/curency_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/item_alter_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/item_group_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/item_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/item_units_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/payment_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/system_doc_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/unit_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/user_setting_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/user_store_model.dart';

abstract class MainInfoRemoteDatasource {
  Future<CompanyModel> getCompanyInfo();
  Future<BranchModel> getBranchInfo();
  Future<List<CurencyModel>> getAllCurency();
  Future<List<UnitModel>> getAllUnits();
  Future<List<ItemGroupModel>> getAllItemGroups();
  Future<UserStoreModel> getUserStoreInfo();
  Future<List<ItemUnitsModel>> getAllItemUnit();

  Future<List<ItemModel>> getAllItems();
  Future<List<PaymentModel>> getAllPaymentMethods();
  Future<List<SystemDocModel>> getAllSystemDocs();
  Future<UserSettingModel> getUserSettings();

  //feature
  Future<List<ItemAlterModel>> getAllItemAlter();
  Future<List<BarcodeModel>> getAllBarcode();
}

class MainInfoRemoteDatasourceImp extends MainInfoRemoteDatasource {
  final ApiConnection apiConnection;
  final HttpMethod httpMethod;
  final SharedPreferencesService sharedPreferencesService;

  MainInfoRemoteDatasourceImp({
    required this.apiConnection,
    required this.httpMethod,
    required this.sharedPreferencesService,
  });

  @override
  Future<BranchModel> getBranchInfo() async {
    return httpMethod.handleRequest(
      apiConnection.branchUrl,
      (data) => BranchModel.fromJson(data),
    );
  }

  @override
  Future<CompanyModel> getCompanyInfo() async {
    return httpMethod.handleRequest(
      apiConnection.companUrl,
      (data) => CompanyModel.fromJson(data),
    );
  }

  @override
  Future<List<ItemGroupModel>> getAllItemGroups() async {
    return httpMethod.handleRequest<List<ItemGroupModel>>(
      apiConnection.itemGroupsUrl,
      (data) => ItemGroupModel.fromJsonArray(data),
    );
  }

  @override
  Future<List<UnitModel>> getAllUnits() async {
    return httpMethod.handleRequest<List<UnitModel>>(
      apiConnection.unitsUrl,
      (data) => UnitModel.fromJsonArray(data),
    );
  }

  @override
  Future<UserStoreModel> getUserStoreInfo() async {
    return httpMethod.handleRequest(
      apiConnection.userStoreUrl,
      (data) => UserStoreModel.fromJson(data),
    );
  }

  @override
  Future<List<ItemUnitsModel>> getAllItemUnit() async {
    return httpMethod.handleRequest<List<ItemUnitsModel>>(
      apiConnection.itemUnitsUrl,
      (data) => ItemUnitsModel.fromJsonArray(data),
    );
  }

  @override
  Future<List<CurencyModel>> getAllCurency() async {
    return httpMethod.handleRequest<List<CurencyModel>>(
      apiConnection.curencyUrl,
      (data) => CurencyModel.fromJsonArray(data),
    );
  }

  @override
  Future<List<ItemModel>> getAllItems() {
    return httpMethod.handleRequest<List<ItemModel>>(apiConnection.itemsUrl,
        (data) {
      return ItemModel.fromJsonArray(data);
    });
  }

  @override
  Future<List<PaymentModel>> getAllPaymentMethods() {
    return httpMethod
        .handleRequest<List<PaymentModel>>(apiConnection.paymentsUrl, (data) {
      return PaymentModel.fromJsonArray(data);
    });
  }

  @override
  Future<List<SystemDocModel>> getAllSystemDocs() {
    return httpMethod.handleRequest<List<SystemDocModel>>(
        apiConnection.systemDocsUrl,
        (data) => SystemDocModel.fromJsonArray(data));
  }

  @override
  Future<UserSettingModel> getUserSettings() {
    return httpMethod.handleRequest(
      apiConnection.userSettingsUrl,
      (data) => UserSettingModel.fromJson(data),
    );
  }

  @override
  Future<List<BarcodeModel>> getAllBarcode() {
    return httpMethod.handleRequest<List<BarcodeModel>>(
        apiConnection.itemBarcodesUrl,
        (data) => BarcodeModel.fromJsonArray(data));
  }

  @override
  Future<List<ItemAlterModel>> getAllItemAlter() {
    return httpMethod.handleRequest<List<ItemAlterModel>>(
      apiConnection.itemAlterUrl,
      (data) => ItemAlterModel.fromJsonArray(data),
    );
  }
}

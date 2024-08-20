// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:era_pro_application/src/core/api/api.dart';
import 'package:era_pro_application/src/core/api/methods.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';
import 'package:era_pro_application/src/features/main_info/data/models/branch_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/company_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/curency_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/item_group_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/item_units_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/unit_model.dart';
import 'package:era_pro_application/src/features/main_info/data/models/user_store_model.dart';

abstract class MainInfoRemoteDatasource {
  Future<CompanyModel> getCompanyInfo();
  Future<BranchModel> getBranchInfo();
  Future<List<CurencyModel>> getAllCurency();
  Future<List<UnitModel>> getAllUnits();
  Future<List<ItemGroupModel>> getAllItemGroups();
  Future<UserStoreModel> getUserStoreInfo();
  Future<List<ItemUnitsModel>> getAllItemUnit();
}

// class MainInfoRemoteDatasourceImp extends MainInfoRemoteDatasource {
//   ApiConnection apiConnection;
//   HttpMethod httpMethod;
//   SharedPreferencesService sharedPreferencesService;
//   MainInfoRemoteDatasourceImp({
//     required this.apiConnection,
//     required this.httpMethod,
//     required this.sharedPreferencesService,
//   });

//   @override
//   Future<BranchModel> getBranchInfo() async {
//     Map<String, dynamic> body = {
//       "userid": sharedPreferencesService.getString('userId'),
//       "branchid": 1,
//       "dateTime": null
//     };
//     try {
//       final data = await httpMethod.post(body, apiConnection.branchUrl);
//       return BranchModel.fromJson(data);
//     } catch (e) {
//       throw ServerFailures(message: "server error $e");
//     }
//   }

//   @override
//   Future<CompanyModel> getCompanyInfo() async {
//     Map<String, dynamic> body = {
//       "userid": sharedPreferencesService.getString('userId'),
//       "branchid": 1,
//       "dateTime": null
//     };
//     try {
//       final data = await httpMethod.post(body, apiConnection.companUrl);

//       return CompanyModel.fromJson(data);
//     } catch (e) {
//       throw ServerFailures(message: "server error $e");
//     }
//   }

//   @override
//   Future<List<CurencyModel>> getAllCurency() async {
//     Map<String, dynamic> body = {
//       "userid": sharedPreferencesService.getString('userId'),
//       "branchid": 1,
//       "dateTime": null
//     };
//     try {
//       final data = await httpMethod.post(body, apiConnection.curencyUrl);

//       return CurencyModel.fromJsonArray(data);
//     } catch (e) {
//       throw ServerFailures(message: "server error $e");
//     }
//   }

//   @override
//   Future<List<ItemGroupModel>> getAllItemGroups() async {
//     Map<String, dynamic> body = {
//       "userid": sharedPreferencesService.getString('userId'),
//       "branchid": 1,
//       "dateTime": null
//     };
//     try {
//       final data = await httpMethod.post(body, apiConnection.itemGroupsUrl);

//       return ItemGroupModel.fromJsonArray(data);
//     } catch (e) {
//       throw ServerFailures(message: "server error $e");
//     }
//   }

//   @override
//   Future<List<UnitModel>> getAllUnits() async {
//     Map<String, dynamic> body = {
//       "userid": sharedPreferencesService.getString('userId'),
//       "branchid": 1,
//       "dateTime": null
//     };
//     try {
//       final data = await httpMethod.post(body, apiConnection.unitsUrl);

//       return UnitModel.fromJsonArray(data);
//     } catch (e) {
//       throw ServerFailures(message: "server error $e");
//     }
//   }

//   @override
//   Future<UserStoreModel> getUserStoreInfo() async {
//     Map<String, dynamic> body = {
//       "userid": sharedPreferencesService.getString('userId'),
//       "branchid": 1,
//       "dateTime": null
//     };
//     try {
//       final data = await httpMethod.post(body, apiConnection.userStoreUrl);

//       return UserStoreModel.fromJson(data);
//     } catch (e) {
//       throw ServerFailures(message: "server error $e");
//     }
//   }

//   @override
//   Future<List<ItemUnitsModel>> getAllItemUnit() async {
//     Map<String, dynamic> body = {
//       "userid": sharedPreferencesService.getString('userId'),
//       "branchid": 1,
//       "dateTime": null
//     };
//     try {
//       final data = await httpMethod.post(body, apiConnection.itemUnitsUrl);

//       return ItemUnitsModel.fromJsonArray(data);
//     } catch (e) {
//       throw ServerFailures(message: "server error $e");
//     }
//   }
// }

class MainInfoRemoteDatasourceImp extends MainInfoRemoteDatasource {
  final ApiConnection apiConnection;
  final HttpMethod httpMethod;
  final SharedPreferencesService sharedPreferencesService;

  MainInfoRemoteDatasourceImp({
    required this.apiConnection,
    required this.httpMethod,
    required this.sharedPreferencesService,
  });

  Future<Map<String, dynamic>> _prepareRequestBody() async {
    return {
      "userid": sharedPreferencesService.getString('userId'),
      "branchid": 1,
      "dateTime": null,
    };
  }

  Future<T> _handleRequest<T>(
    String url,
    T Function(dynamic) fromJson,
  ) async {
    final body = await _prepareRequestBody();

    try {
      final responseData = await httpMethod.post(body, url);
      return fromJson(responseData);
    } catch (e) {
      throw ServerFailures(message: "Server error: $e");
    }
  }

  @override
  Future<BranchModel> getBranchInfo() async {
    return _handleRequest(
      apiConnection.branchUrl,
      (data) => BranchModel.fromJson(data),
    );
  }

  @override
  Future<CompanyModel> getCompanyInfo() async {
    return _handleRequest(
      apiConnection.companUrl,
      (data) => CompanyModel.fromJson(data),
    );
  }

  @override
  Future<List<ItemGroupModel>> getAllItemGroups() async {
    return _handleRequest<List<ItemGroupModel>>(
      apiConnection.itemGroupsUrl,
      (data) => ItemGroupModel.fromJsonArray(data),
    );
  }

  @override
  Future<List<UnitModel>> getAllUnits() async {
    return _handleRequest<List<UnitModel>>(
      apiConnection.unitsUrl,
      (data) => UnitModel.fromJsonArray(data),
    );
  }

  @override
  Future<UserStoreModel> getUserStoreInfo() async {
    return _handleRequest(
      apiConnection.userStoreUrl,
      (data) => UserStoreModel.fromJson(data),
    );
  }

  @override
  Future<List<ItemUnitsModel>> getAllItemUnit() async {
    return _handleRequest<List<ItemUnitsModel>>(
      apiConnection.itemUnitsUrl,
      (data) => ItemUnitsModel.fromJsonArray(data),
    );
  }

  @override
  Future<List<CurencyModel>> getAllCurency() async {
    return _handleRequest<List<CurencyModel>>(
      apiConnection.curencyUrl,
      (data) => CurencyModel.fromJsonArray(data),
    );
  }
}

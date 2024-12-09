// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:era_pro_application/src/core/api/api.dart';
import 'package:era_pro_application/src/core/constants/share_pref_keys.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';
import '../../../../core/api/methods.dart';
import '../models/main_info_model.dart';

abstract class MainInfoRemoteDatasource {
  Future<CompanyModel> getCompanyInfo();
  Future<BranchModel> getBranchInfo();
  Future<List<CurencyModel>> getAllCurency();

  Future<List<PaymentModel>> getAllPaymentMethods();
  Future<List<SystemDocModel>> getAllSystemDocs();
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
      SharedPrefKeys.DATETIME_BRANCHINFO_KEY,
    );
  }

  @override
  Future<CompanyModel> getCompanyInfo() async {
    return httpMethod.handleRequest(
      apiConnection.companUrl,
      (data) => CompanyModel.fromJson(data),
      SharedPrefKeys.DATETIME_COMPANY_KEY,
    );
  }

  @override
  Future<List<CurencyModel>> getAllCurency() async {
    return httpMethod.handleRequest<List<CurencyModel>>(
      apiConnection.curencyUrl,
      (data) => CurencyModel.fromJsonArray(data),
      SharedPrefKeys.DATETIME_CURENCIES_KEY,
    );
  }

  @override
  Future<List<PaymentModel>> getAllPaymentMethods() {
    return httpMethod
        .handleRequest<List<PaymentModel>>(apiConnection.paymentsUrl, (data) {
      return PaymentModel.fromJsonArray(data);
    }, SharedPrefKeys.DATETIME_PAYMETHODS_KEY);
  }

  @override
  Future<List<SystemDocModel>> getAllSystemDocs() {
    return httpMethod.handleRequest<List<SystemDocModel>>(
      apiConnection.systemDocsUrl,
      (data) => SystemDocModel.fromJsonArray(data),
      SharedPrefKeys.DATETIME_SYSTEMDOCS_KEY,
    );
  }
}

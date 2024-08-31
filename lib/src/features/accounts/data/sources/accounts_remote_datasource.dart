// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:era_pro_application/src/core/api/api.dart';
import 'package:era_pro_application/src/core/api/methods.dart';
import 'package:era_pro_application/src/core/error/error.dart';
import 'package:era_pro_application/src/features/accounts/data/models/account_model.dart';

abstract class AccountsRemoteDatasource {
  Future<List<AccountModel>> getAllAccounts();
}

class AccountsRemoteDatasourceImpl implements AccountsRemoteDatasource {
  HttpMethod httpMethod;
  ApiConnection apiConnection;
  AccountsRemoteDatasourceImpl({
    required this.httpMethod,
    required this.apiConnection,
  });
  @override
  Future<List<AccountModel>> getAllAccounts() async {
    return await httpMethod.handleRequest<List<AccountModel>>(
      apiConnection.accountsUrl,
      (data) => AccountModel.fromJsonArray(data),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:era_pro_application/src/core/api/api.dart';
import 'package:era_pro_application/src/core/constants/share_pref_keys.dart';
import 'package:era_pro_application/src/core/error/exception.dart';
import 'package:era_pro_application/src/features/accounts/data/models/account_model.dart';
import 'package:era_pro_application/src/features/accounts/data/models/account_operation_model.dart';
import 'package:era_pro_application/src/features/accounts/data/models/mid_account_model.dart';
import 'package:era_pro_application/src/features/accounts/data/models/ref_account_model.dart';

import '../../../../core/api/methods.dart';

abstract class AccountsRemoteDatasource {
  Future<List<AccountModel>> getAllAccounts();
  Future<List<AccountOperationModel>> getAllAccountsOperation();
  Future<List<RefAccountModel>> getAllRefAccounts();
  Future<List<MidAccountModel>> getAllMidAccounts();
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
    try {
      return await httpMethod.handleRequest<List<AccountModel>>(
        apiConnection.accountsUrl,
        (data) => AccountModel.fromJsonArray(data),
        SharedPrefKeys.DATETIME_ACCOUNTS_KEY,
      );
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<MidAccountModel>> getAllMidAccounts() async {
    try {
      return await httpMethod.handleRequest<List<MidAccountModel>>(
        apiConnection.midAccountsUrl,
        (data) => MidAccountModel.fromJsonArray(data),
        SharedPrefKeys.DATETIME_MID_ACCOUNTS_KEY,
      );
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<RefAccountModel>> getAllRefAccounts() async {
    try {
      return await httpMethod.handleRequest<List<RefAccountModel>>(
        apiConnection.refAcountsUrl,
        (data) => RefAccountModel.fromJsonArray(data),
        SharedPrefKeys.DATETIME_REF_ACCOUNTS_KEY,
      );
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<AccountOperationModel>> getAllAccountsOperation() async {
    try {
      return await httpMethod.handleRequest<List<AccountOperationModel>>(
        apiConnection.accOperationUrl,
        (data) => AccountOperationModel.fromJsonArray(data),
        SharedPrefKeys.DATETIME_ACCOUNTOPERAION_KEY,
      );
    } catch (e) {
      throw ServerException();
    }
  }
}

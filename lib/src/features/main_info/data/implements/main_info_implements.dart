// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/constants/share_pref_keys.dart';
import '../models/main_info_model.dart';

import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';

import 'package:era_pro_application/src/features/main_info/data/sources/main_info_local_datasource.dart';
import 'package:era_pro_application/src/features/main_info/data/sources/main_info_remote_datasource.dart';

import 'package:era_pro_application/src/features/main_info/domain/repositories/main_info_repository.dart';

import '../../../../core/utils/repository_helper.dart';

class MainInfoRepositoryImp implements MainInfoRepository {
  MainInfoLocalDatasource mainInfoLocalDatasource;
  MainInfoRemoteDatasource mainInfoRemoteDatasource;
  SharedPreferencesService sharedPreferencesService;
  MainInfoRepositoryImp({
    required this.mainInfoLocalDatasource,
    required this.mainInfoRemoteDatasource,
    required this.sharedPreferencesService,
  });

  @override
  Future<Either<Failure, BranchModel>> getBranchInfo() async {
    return fetchSingleDataFromLocalStorage(
      sharedPreferencesService: sharedPreferencesService,
      fetchLocalData: mainInfoLocalDatasource.getBranchInfo,
      sharedPrefKey: SharedPrefKeys.BRANCHINFO_KEY,
    );
  }

  @override
  Future<Either<Failure, CompanyModel>> getCompnayInfo() async {
    return fetchSingleDataFromLocalStorage(
      sharedPreferencesService: sharedPreferencesService,
      fetchLocalData: mainInfoLocalDatasource.getCompanyInfo,
      sharedPrefKey: SharedPrefKeys.COMPANY_KEY,
    );
  }

  //curencies

  @override
  Future<Either<Failure, List<CurencyModel>>> getAllCurencies() async {
    return fetchArrayOfDataFromLocalStorage<CurencyModel>(
      fetchFromLocal: mainInfoLocalDatasource.getAllCurency,
      localError: "Failed to retrieve curency information from local storage.",
    );
  }

  @override
  Future<Either<Failure, List<PaymentModel>>> getPaymentMethods() {
    return fetchArrayOfDataFromLocalStorage<PaymentModel>(
      fetchFromLocal: mainInfoLocalDatasource.getAllPaymentMethod,
      localError: "can't get payments info from local",
    );
  }

  @override
  Future<Either<Failure, List<SystemDocModel>>> getSystemDocs() {
    return fetchArrayOfDataFromLocalStorage<SystemDocModel>(
      fetchFromLocal: mainInfoLocalDatasource.getAllSystemDocs,
      localError: "can't get system_doc info from local",
    );
  }

  @override
  Future<Either<Failure, bool>> fetchAllMainInfo() async {
    try {
      await fetchArrayOfDataFromRemote<PaymentModel>(
        sharedPreferencesService: sharedPreferencesService,
        cacheKey: SharedPrefKeys.PAYMETHODS_KEY,
        dateTimeSharePrefKey: SharedPrefKeys.DATETIME_PAYMETHODS_KEY,
        fetchFromRemote: mainInfoRemoteDatasource.getAllPaymentMethods,
        saveDataToLocal: mainInfoLocalDatasource.saveAllPaymentMethod,
        remoteError: "can't get itpaymentsem info from server",
      );
      await fetchSingleDataFromRemote(
        sharedPreferencesService: sharedPreferencesService,
        sharedPrefKey: SharedPrefKeys.BRANCHINFO_KEY,
        fetchRemoteData: mainInfoRemoteDatasource.getBranchInfo,
        saveLocalData: mainInfoLocalDatasource.saveBranchInfo,
        dateTimeShredPreKey: SharedPrefKeys.DATETIME_BRANCHINFO_KEY,
      );
      await fetchSingleDataFromRemote(
        sharedPreferencesService: sharedPreferencesService,
        fetchRemoteData: mainInfoRemoteDatasource.getCompanyInfo,
        saveLocalData: mainInfoLocalDatasource.saveCompanyInfo,
        sharedPrefKey: SharedPrefKeys.COMPANY_KEY,
        dateTimeShredPreKey: SharedPrefKeys.DATETIME_COMPANY_KEY,
      );
      await fetchArrayOfDataFromRemote<CurencyModel>(
        cacheKey: SharedPrefKeys.CURENCIES_KEY,
        dateTimeSharePrefKey: SharedPrefKeys.DATETIME_CURENCIES_KEY,
        sharedPreferencesService: sharedPreferencesService,
        fetchFromRemote: mainInfoRemoteDatasource.getAllCurency,
        saveDataToLocal: mainInfoLocalDatasource.saveAllCurency,
        remoteError: "Failed to retrieve curency information from the server.",
      );
      await fetchArrayOfDataFromRemote<SystemDocModel>(
        sharedPreferencesService: sharedPreferencesService,
        cacheKey: SharedPrefKeys.SYSTEMDOCS_KEY,
        dateTimeSharePrefKey: SharedPrefKeys.DATETIME_SYSTEMDOCS_KEY,
        fetchFromRemote: mainInfoRemoteDatasource.getAllSystemDocs,
        saveDataToLocal: mainInfoLocalDatasource.saveAllSystemDocs,
        remoteError: "can't get system_doc info from server",
      );

      return const Right(true);
    } catch (e) {
      return Left(ServerFailures(message: e.toString()));
    }
  }
}

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

/*
  // @override
  // Future<Either<Failure, BranchEntity>> getBranchInfo() async {
  //   try {
  //     var branchId = sharedPreferencesService.getString('branchId');
  //     if (branchId != null) {
  //       final branch =
  //           await mainInfoLocalDatasource.getBranchInfo(int.parse(branchId));
  //       if (branch != null) {
  //         return Right(branch);
  //       } else {
  //         throw LocalStorageException();
  //       }
  //     } else {
  //       final branch = await mainInfoRemoteDatasource.getBranchInfo();
  //       await sharedPreferencesService.setString(
  //           'branchId', branch.id.toString());
  //       await mainInfoLocalDatasource.saveBranchInfo(branch);
  //       return Right(branch);
  //     }
  //   } on LocalStorageException {
  //     return const Left(
  //         LocalStorageFailures(message: "can't get branch info from local"));
  //   } on ServerException {
  //     return const Left(
  //         ServerFailures(message: "can't get branch inf from server"));
  //   } catch (e) {
  //     return const Left(ServerFailures(message: "server failures"));
  //   }
  // }

  // @override
  // Future<Either<Failure, CompanyEntity>> getCompnayInfo() async {
  //   try {
  //     var companyId = sharedPreferencesService.getString('companyId');
  //     if (companyId != null) {
  //       final company =
  //           await mainInfoLocalDatasource.getCompanyInfo(int.parse(companyId));
  //       if (company != null) {
  //         return Right(company);
  //       } else {
  //         throw LocalStorageException();
  //       }
  //     } else {
  //       final company = await mainInfoRemoteDatasource.getCompanyInfo();
  //       await sharedPreferencesService.setString(
  //           'companyId', company.id.toString());
  //       await mainInfoLocalDatasource.saveCompanyInfo(company);
  //       return Right(company);
  //     }
  //   } on LocalStorageException {
  //     return const Left(
  //         LocalStorageFailures(message: "can't get company info from local"));
  //   } on ServerException {
  //     return const Left(
  //         ServerFailures(message: "can't get company inf from server"));
  //   } catch (e) {
  //     return const Left(ServerFailures(message: "server failures"));
  //   }
  // }
  */

  @override
  Future<Either<Failure, BranchModel>> getBranchInfo() async {
    return fetchSingleData(
        sharedPreferencesService: sharedPreferencesService,
        fetchLocalData: mainInfoLocalDatasource.getBranchInfo,
        fetchRemoteData: mainInfoRemoteDatasource.getBranchInfo,
        saveLocalData: mainInfoLocalDatasource.saveBranchInfo,
        sharedPrefKey: SharedPrefKeys.BRANCHINFO_KEY,
        dateTimeShredPreKey: SharedPrefKeys.DATETIME_BRANCHINFO_KEY);
  }

  @override
  Future<Either<Failure, CompanyModel>> getCompnayInfo() async {
    return fetchSingleData(
        sharedPreferencesService: sharedPreferencesService,
        fetchLocalData: mainInfoLocalDatasource.getCompanyInfo,
        fetchRemoteData: mainInfoRemoteDatasource.getCompanyInfo,
        saveLocalData: mainInfoLocalDatasource.saveCompanyInfo,
        sharedPrefKey: SharedPrefKeys.COMPANY_KEY,
        dateTimeShredPreKey: SharedPrefKeys.DATETIME_COMPANY_KEY);
  }

  //curencies

  @override
  Future<Either<Failure, List<CurencyModel>>> getAllCurencies() async {
    return fetchArrayOfData<CurencyModel>(
      cacheKey: SharedPrefKeys.CURENCIES_KEY,
      dateTimeSharePrefKey: SharedPrefKeys.DATETIME_CURENCIES_KEY,
      sharedPreferencesService: sharedPreferencesService,
      fetchFromLocal: mainInfoLocalDatasource.getAllCurency,
      fetchFromRemote: mainInfoRemoteDatasource.getAllCurency,
      saveDataToLocal: mainInfoLocalDatasource.saveAllCurency,
      localError: "Failed to retrieve curency information from local storage.",
      remoteError: "Failed to retrieve curency information from the server.",
      genericError:
          "An unexpected error occurred while retrieving curency information.",
    );
  }

  @override
  Future<Either<Failure, List<PaymentModel>>> getPaymentMethods() {
    return fetchArrayOfData<PaymentModel>(
      sharedPreferencesService: sharedPreferencesService,
      cacheKey: SharedPrefKeys.PAYMETHODS_KEY,
      dateTimeSharePrefKey: SharedPrefKeys.DATETIME_PAYMETHODS_KEY,
      fetchFromLocal: mainInfoLocalDatasource.getAllPaymentMethod,
      fetchFromRemote: mainInfoRemoteDatasource.getAllPaymentMethods,
      saveDataToLocal: mainInfoLocalDatasource.saveAllPaymentMethod,
      localError: "can't get payments info from local",
      remoteError: "can't get itpaymentsem info from server",
      genericError: "server failures to get payments",
    );
  }

  @override
  Future<Either<Failure, List<SystemDocModel>>> getSystemDocs() {
    return fetchArrayOfData<SystemDocModel>(
      sharedPreferencesService: sharedPreferencesService,
      cacheKey: SharedPrefKeys.SYSTEMDOCS_KEY,
      dateTimeSharePrefKey: SharedPrefKeys.DATETIME_SYSTEMDOCS_KEY,
      fetchFromLocal: mainInfoLocalDatasource.getAllSystemDocs,
      fetchFromRemote: mainInfoRemoteDatasource.getAllSystemDocs,
      saveDataToLocal: mainInfoLocalDatasource.saveAllSystemDocs,
      localError: "can't get system_doc info from local",
      remoteError: "can't get system_doc info from server",
      genericError: "server failures to get system_doc",
    );
  }
}
/**
 

 
 */

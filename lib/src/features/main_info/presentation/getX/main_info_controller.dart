// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/error.dart';
import 'package:era_pro_application/src/core/utils/usecase_helper.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/branch_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/company_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/curency_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/unit_enitity.dart';
import 'package:era_pro_application/src/features/main_info/domain/usecases/get_all_curencies.dart';
import 'package:era_pro_application/src/features/main_info/domain/usecases/get_all_units_usecase.dart';
import 'package:get/get.dart';

import 'package:era_pro_application/src/features/main_info/domain/usecases/get_branch_usecase.dart';
import 'package:era_pro_application/src/features/main_info/domain/usecases/get_company_usecase.dart';

typedef Usecase<T> = Future<Either<Failure, T>> Function();

class MainInfoController extends GetxController {
  GetBranchUsecase getBranchUsecase;
  GetCompanyUsecase getCompanyUsecase;
  GetAllCurenciesUseCase getAllCurencies;
  GetAllUnitsUsecase getAllUnitsUsecase;
  var company = Rx<CompanyEntity?>(null);

  var branch = Rx<BranchEntity?>(null);
  var allCurencies = Rx<List<CurencyEntity>>([]);

  var units = Rx<List<UnitEnitity>>([]);
  final errorMessage = ''.obs;
  MainInfoController({
    required this.getBranchUsecase,
    required this.getCompanyUsecase,
    required this.getAllCurencies,
    required this.getAllUnitsUsecase,
  });

  @override
  void onInit() {
    super.onInit();
    getBranchInfo();
    getCompanyInfo();
    getAllCurenciesInfo();
    getAllUnits();
  }

  Future<void> getBranchInfo() async {
    await handleUsecase(
      usecase: getBranchUsecase.call,
      target: branch,
      errorMessageTarget: errorMessage,
    );
  }

  Future<void> getCompanyInfo() async {
    await handleUsecase(
      usecase: getCompanyUsecase.call,
      target: company,
      errorMessageTarget: errorMessage,
    );
  }

  Future<void> getAllCurenciesInfo() async {
    await handleUsecase(
      usecase: getAllCurencies.call,
      target: allCurencies,
      errorMessageTarget: errorMessage,
    );
  }

  Future<void> getAllUnits() async {
    await handleUsecase(
      usecase: getAllUnitsUsecase.call,
      target: units,
      errorMessageTarget: errorMessage,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:era_pro_application/src/features/main_info/domain/entities/branch_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/company_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/curency_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/usecases/get_all_curencies.dart';
import 'package:era_pro_application/src/features/main_info/domain/usecases/get_all_units_usecase.dart';
import 'package:get/get.dart';

import 'package:era_pro_application/src/features/main_info/domain/usecases/get_branch_usecase.dart';
import 'package:era_pro_application/src/features/main_info/domain/usecases/get_company_usecase.dart';

class MainInfoController extends GetxController {
  GetBranchUsecase getBranchUsecase;
  GetCompanyUsecase getCompanyUsecase;
  GetAllCurenciesUseCase getAllCurencies;
  GetAllUnitsUsecase getAllUnitsUsecase;
  var company = Rx<CompanyEntity?>(null);
  var branch = Rx<BranchEntity?>(null);
  var allCurencies = <CurencyEntity>[].obs;
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
    final result = await getBranchUsecase();
    result.fold((f) {
      errorMessage.value = f.message;
    }, (r) {
      branch.value = r;
    });
  }

  Future<void> getCompanyInfo() async {
    final result = await getCompanyUsecase();
    result.fold((f) {
      errorMessage.value = f.message;
    }, (r) {
      company.value = r;
    });
  }

  Future<void> getAllCurenciesInfo() async {
    final result = await getAllCurencies();

    result.fold((f) {
      errorMessage.value = f.message;
    }, (r) {
      allCurencies.value = r;
    });
  }

  Future<void> getAllUnits() async {
    final result = await getAllUnitsUsecase();

    result.fold((f) {
      errorMessage.value = f.message;
      print(f.message);
    }, (r) {
      print(r);
    });
  }
}

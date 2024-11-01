// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import 'package:era_pro_application/src/core/error/error.dart';
import 'package:era_pro_application/src/core/utils/usecase_helper.dart';
import '../../domain/entities/main_info_entity.dart';
import '../../domain/usecases/main_info_usecase.dart';

typedef Usecase<T> = Future<Either<Failure, T>> Function();

class MainInfoController extends GetxController {
  GetBranchUsecase getBranchUsecase;
  GetCompanyUsecase getCompanyUsecase;
  GetAllCurenciesUseCase getAllCurenciesUsecase;

  GetAllPaymentsUsecase getAllPaymentsUsecase;
  GetAllSystemDocsUsecase getAllSystemDocsUsecase;

  var company = Rx<CompanyEntity?>(null);

  var branch = Rx<BranchEntity?>(null);

  var allCurencies = Rx<List<CurencyEntity>>([]);

  var allPaymentsMethod = Rx<List<PaymentEntity>>([]);
  var allSystemDocs = Rx<List<SystemDocEntity>>([]);
  // var status = RxStatus.empty();

  final errorMessage = ''.obs;

  MainInfoController({
    required this.getBranchUsecase,
    required this.getCompanyUsecase,
    required this.getAllCurenciesUsecase,
    required this.getAllPaymentsUsecase,
    required this.getAllSystemDocsUsecase,
  });

  @override
  void onInit() async {
    super.onInit();
    await getAllMainInfo();
  }

  Future<void> getAllMainInfo() async {
    await getBranchInfo();
    await getCompanyInfo();
    await getAllCurenciesInfo();
    await getAllPaymentsMethod();
    await getAllSystemDocs();
  }

  Future<void> getBranchInfo() async {
    // status(RxStatus.error());
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

  Future<List<CurencyEntity>> getAllCurenciesInfo() async {
    await handleUsecase(
      usecase: getAllCurenciesUsecase.call,
      target: allCurencies,
      errorMessageTarget: errorMessage,
    );

    return allCurencies.value;
  }

  Future<void> getAllPaymentsMethod() async {
    await handleUsecase(
      usecase: getAllPaymentsUsecase.call,
      target: allPaymentsMethod,
      errorMessageTarget: errorMessage,
    );
  }

  Future<void> getAllSystemDocs() async {
    await handleUsecase(
      usecase: getAllSystemDocsUsecase.call,
      target: allSystemDocs,
      errorMessageTarget: errorMessage,
    );
  }
}

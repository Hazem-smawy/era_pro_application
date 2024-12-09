// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/accounts/domain/usecases/get_all_accounts_usecase.dart';
import 'package:flutter/material.dart';
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
  GetAllAccountsUseCase getAllAccountsUseCase;

  var company = Rx<CompanyEntity?>(null);

  var branch = Rx<BranchEntity?>(null);
  var allAccount = Rx<List<AccountEntity>>([]);

  var allCurencies = Rx<List<CurencyEntity>>([]);
  final selecteCurency = Rx<CurencyEntity?>(null);

  CurencyEntity? get storCurency {
    if (allCurencies.value.isNotEmpty) {
      return allCurencies.value.firstWhereOrNull((e) => e.storeCurrency) ??
          allCurencies.value.first;
    } else {
      return null;
    }
  }

  CurencyEntity? get localCurency {
    if (allCurencies.value.isNotEmpty) {
      return allCurencies.value.firstWhereOrNull((e) => e.localCurrency) ??
          allCurencies.value.first;
    } else {
      return null;
    }
  }

  var allPaymentsMethod = Rx<List<PaymentEntity>>([]);
  var selectedPaymentsMethod = Rx<PaymentEntity?>(null);
  final paymentType = true.obs;
  final paymentAmountTextEditingController = TextEditingController().obs;
  final selectedPaymentsMethodDetails = Rx<AccountEntity?>(null);
  final paymentsMethodDetails = [].obs;
  var allSystemDocs = Rx<List<SystemDocEntity>>([]);

  // var status = RxStatus.empty();

  final errorMessage = ''.obs;

  MainInfoController({
    required this.getBranchUsecase,
    required this.getCompanyUsecase,
    required this.getAllCurenciesUsecase,
    required this.getAllPaymentsUsecase,
    required this.getAllSystemDocsUsecase,
    required this.getAllAccountsUseCase,
  });

  @override
  onInit() {
    super.onInit();
    getAllCurenciesInfo();
  }

  Future<void> changeSelectedPaymentMethodsDetails(List list) async {
    paymentsMethodDetails.value = list;
  }

  Future<void> getAllAccounts() async {
    handleUsecase(
      usecase: getAllAccountsUseCase.call,
      target: allAccount,
    );
  }

  Future<void> getAllMainInfo() async {
    await getBranchInfo();
    await getCompanyInfo();
    await getAllCurenciesInfo();
    await getAllPaymentsMethod();
    await getAllSystemDocs();
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

  Future<List<CurencyEntity>> getAllCurenciesInfo() async {
    await handleUsecase(
      usecase: getAllCurenciesUsecase.call,
      target: allCurencies,
      errorMessageTarget: errorMessage,
    );

    // selecteCurency.value =
    //     allCurencies.value.firstWhereOrNull((e) => e.storeCurrency);

    return allCurencies.value;
  }

  Future<void> getAllPaymentsMethod() async {
    await handleUsecase(
      usecase: getAllPaymentsUsecase.call,
      target: allPaymentsMethod,
      errorMessageTarget: errorMessage,
    );
    if (allPaymentsMethod.value.isNotEmpty &&
        selectedPaymentsMethod.value == null) {
      selectedPaymentsMethod.value = allPaymentsMethod.value.first;
    }
  }

  Future<void> getAllSystemDocs() async {
    await handleUsecase(
      usecase: getAllSystemDocsUsecase.call,
      target: allSystemDocs,
      errorMessageTarget: errorMessage,
    );
  }

  Future<void> changePaymentMethod(PaymentEntity? value) async {
    await getAllPaymentsMethod();
    final newValue = value ??
        allPaymentsMethod.value.firstWhere(
          (method) => method.id != 0,
          orElse: () => allPaymentsMethod.value.first,
        );

    selectedPaymentsMethod.value = newValue;

    final newPaymentMethodDetails =
        allAccount.value.where((e) => e.accCatagory == newValue.id).toList();

    if (newPaymentMethodDetails.isNotEmpty) {
      paymentsMethodDetails.value = newPaymentMethodDetails;
      selectedPaymentsMethodDetails.value = paymentsMethodDetails.first;
    } else {
      selectedPaymentsMethodDetails.value = null;
    }
  }
}

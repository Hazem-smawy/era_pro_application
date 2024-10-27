import 'package:era_pro_application/src/core/utils/usecase_helper.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/accounts/domain/usecases/add_account_usecase.dart';
import 'package:era_pro_application/src/features/accounts/domain/usecases/usecases.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountsController extends GetxController {
  GetAccountsUseCase getAccountsUseCase;
  AddAccountUsecase addAccountUsecase;

  AccountsController(
      {required this.getAccountsUseCase, required this.addAccountUsecase});

  final allAccounts = Rx<List<AccountEntity>>([]);
  final refAllAccounts = Rx<List<AccountEntity>>([]);
  final specialAccounts = Rx<List<AccountEntity>>([]);
  final customers = Rx<List<AccountEntity>>([]);
  final errorMessage = ''.obs;
  int? tap;

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController limit = TextEditingController();
  TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() async {
    super.onInit();
    await getAllAccounts();
  }

  Future<List<AccountEntity>> getAllAccounts() async {
    tap = 0;
    await handleUsecase(
      usecase: getAccountsUseCase.call,
      target: allAccounts,
    );

    customers.value = allAccounts.value
        .where(
            (account) => account.accCatagory != 1 && account.accCatagory != 2)
        .toList();
    refAllAccounts.value = allAccounts.value;
    return allAccounts.value;
  }

  Future<List<AccountEntity>> getSpecailAccounts() async {
    tap = 1;
    await getAllAccounts();
    return allAccounts.value
        .where(
            (account) => account.accCatagory == 1 || account.accCatagory == 2)
        .toList();
  }

  void search(String name) {
    print('object');

    if (name.trim().isNotEmpty) {
      allAccounts.value =
          allAccounts.value.where((e) => e.accName.contains(name)).toList();
      customers.value = allAccounts.value
          .where(
              (account) => account.accCatagory != 1 && account.accCatagory != 2)
          .toList();
    } else {
      getAllAccounts();
    }
  }

  Future<void> addAccount() async {
    if (formKey.currentState!.validate()) {
      final account = AccountEntity(
        accNumber: 1,
        accName: name.text.trim(),
        accParent: 1,
        accType: 1,
        note: '',
        accCatagory: 3,
        accCatId: 1,
        accPhone: phone.text.trim(),
        address: address.text.trim(),
        email: email.text.trim() == '' ? 'لايوجد' : email.text.trim(),
        accLimit: int.parse((limit.text.trim().isEmpty) ? '0' : limit.text),
        paymentType: 2,
        branchId: 1,
        accStoped: true,
        newData: true,
      );

      final result = await addAccountUsecase(account);
      result.fold((f) => errorMessage.value = f.message, (r) {
        getAllAccounts();
        Get.back();
      });
    } else {}
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    phone.dispose();
    address.dispose();
    limit.dispose();
    email.dispose();
  }
}

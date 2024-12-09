// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/accounts_operations_entity.dart';
import 'package:era_pro_application/src/features/accounts/domain/usecases/add_list_accounts_operations_usecase.dart';
import 'package:era_pro_application/src/features/accounts/domain/usecases/delete_account_operation_usecase.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/main_info_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:era_pro_application/src/core/utils/usecase_helper.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/mid_account_entity.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/ref_account_entity.dart';
import 'package:era_pro_application/src/features/accounts/domain/usecases/add_account_usecase.dart';
import 'package:era_pro_application/src/features/accounts/domain/usecases/get_all_accounts_operation_usecase.dart';
import 'package:era_pro_application/src/features/accounts/domain/usecases/get_all_accounts_usecase.dart';
import 'package:era_pro_application/src/features/accounts/domain/usecases/get_all_mid_account_usecase.dart';
import 'package:era_pro_application/src/features/accounts/domain/usecases/get_all_ref_account_usecase.dart';

class AccountsController extends GetxController {
  GetAllAccountsUseCase getAccountsUseCase;
  GetAllMidAccountUsecase getAllMidAccountUsecase;
  GetAllRefAccountUsecase getAllRefAccountUsecase;
  GetAllAccountsOperationUsecase getAllAccountsOperationUsecase;
  AddAccountUsecase addAccountUsecase;
  AddListAccountsOperationsUsecase addListAccountsOperationsUsecase;
  DeleteAccountOperationUsecase deleteAccountOperationUsecase;

  final allAccounts = Rx<List<AccountEntity>>([]);
  final refAccounts = Rx<List<RefAccountEntity>>([]);
  final midAccounts = Rx<List<MidAccountEntity>>([]);
  final refAllAccounts = Rx<List<AccountEntity>>([]);
  final specialAccounts = Rx<List<AccountEntity>>([]);
  final accountsOperation = Rx<List<AccountsOperationsEntity>>([]);
  final customers = Rx<List<AccountEntity>>([]);
  final errorMessage = ''.obs;

  AccountsController({
    required this.getAccountsUseCase,
    required this.getAllMidAccountUsecase,
    required this.getAllRefAccountUsecase,
    required this.getAllAccountsOperationUsecase,
    required this.addAccountUsecase,
    required this.addListAccountsOperationsUsecase,
    required this.deleteAccountOperationUsecase,
  });

  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController limit = TextEditingController();
  TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> getAccountInfo() async {
    await getAllAccounts();
    await getAllRefAccounts();
    await getAllMidAccounts();
    await getAllAccountsOperation();
    await getSpecailAccounts();
  }

  Future<List<AccountEntity>> getAllAccounts() async {
    try {
      await handleUsecase(
        usecase: getAccountsUseCase.call,
        target: allAccounts,
      );

      customers.value = allAccounts.value
          .where((account) => account.accCatagory == 3)
          .toList();
      refAllAccounts.value = allAccounts.value;

      return allAccounts.value;
    } catch (e) {
      return [];
    }
  }

  Future<List<RefAccountEntity>> getAllRefAccounts() async {
    await handleUsecase(
      usecase: getAllRefAccountUsecase.call,
      target: refAccounts,
    );

    return refAccounts.value;
  }

  Future<List<AccountsOperationsEntity>> getAllAccountsOperation() async {
    await handleUsecase(
      usecase: getAllAccountsOperationUsecase.call,
      target: accountsOperation,
    );

    return accountsOperation.value;
  }

  Future<List<MidAccountEntity>> getAllMidAccounts() async {
    await handleUsecase(
      usecase: getAllMidAccountUsecase.call,
      target: midAccounts,
    );

    return midAccounts.value;
  }

  Future<List<AccountEntity>> getSpecailAccounts() async {
    // await getAllAccounts();
    return allAccounts.value
        .where((account) => account.accCatagory != 3)
        .toList();
  }

  void search(String name) {
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
        phone.clear();
        name.clear();
        address.clear();
        limit.clear();
        Get.back();
      });
    } else {}
  }

  Future<void> addExchangeOperation(
      {required int type,
      required int customerAccount,
      required int sellerAccount,
      required double amount,
      required totalAmount,
      required bool isOld,
      required CurencyEntity currency,
      required CurencyEntity localCurency,
      required int snadNumber}) async {
    if (isOld) {
      await deleteAccountOperationUsecase
          .call(Params(OperationType(id: snadNumber, type: type)));
    }
    final operations = [
      AccountsOperationsEntity(
        accountNumber: customerAccount,
        operationDate: DateTime.now(),
        currencyId: currency.id,
        currencyValue: currency.value,
        operationCredit: type == 2 ? amount : 0,
        operationDebit: type == 1 ? amount : 0,
        operationRef: '1',
        operationId: snadNumber,
        operationStatement: '',
        operationType: type,
      ),
      AccountsOperationsEntity(
        accountNumber: sellerAccount,
        operationDate: DateTime.now(),
        currencyId: localCurency.id,
        currencyValue: localCurency.value,
        operationCredit: type == 1 ? totalAmount : 0,
        operationDebit: type == 2 ? totalAmount : 0,
        operationId: snadNumber,
        operationRef: '1',
        operationStatement: '',
        operationType: type,
      )
    ];

    await addListAccountsOperationsUsecase.call(Params(operations));
  }

  Future<void> addListOfAccountOperation({
    required CurencyEntity currency,
    required int debitAccount,
    required double amount,
    required int type,
    required double salesCost,
    required double freQTYConst,
    required double totalDiscount,
    required double totalAverageCost,
    required double earnings,
    required double totalVat,
    required double salesTaxValue,
    required int billId,
    required bool isOld,
  }) async {
    if (isOld) {
      await deleteAccountOperationUsecase.call(
        Params(OperationType(id: billId, type: type)),
      );
    }

    if (refAccounts.value.isEmpty || midAccounts.value.isEmpty) {
      await getAccountInfo();
    }

    if (refAccounts.value.isNotEmpty && midAccounts.value.isNotEmpty) {
      // Retrieve account numbers based on account tags
      final accountMap = {
        'salesCostAccount':
            refAccounts.value.firstWhere((e) => e.accTag == 3).accNumber,
        'salesFreeQtyCostAccount':
            refAccounts.value.firstWhere((e) => e.accTag == 9).accNumber,
        'discountAllowedAccount':
            refAccounts.value.firstWhere((e) => e.accTag == 6).accNumber,
        'storeAccount':
            refAccounts.value.firstWhere((e) => e.accTag == 1).accNumber,
        'earningsConstAccount':
            refAccounts.value.firstWhere((e) => e.accTag == 2).accNumber,
        'addedTaxAccount':
            midAccounts.value.firstWhere((e) => e.accTag == 5).accNumber,
        'salesCostTaxAccount':
            midAccounts.value.firstWhere((e) => e.accTag == 11).accNumber,
        'backInvoiceAccount':
            refAccounts.value.firstWhere((e) => e.accTag == 4).accNumber,
        'costBackInvoiceAccount':
            refAccounts.value.firstWhere((e) => e.accTag == 5).accNumber,
        'costBackInvoiceAndFreeQtyAccount':
            refAccounts.value.firstWhere((e) => e.accTag == 10).accNumber,
      };

      final operations = <AccountsOperationsEntity>[];
      final now = DateTime.now();

      if (type == 8) {
        // Add operations for type 8
        operations.addAll([
          _createOperation(
            debitAccount,
            0,
            amount,
            type,
            billId,
            now,
            currency,
          ),
          _createOperation(
            accountMap['salesCostAccount']!,
            0,
            salesCost,
            type,
            billId,
            now,
            currency,
          ),
          _createOperation(
            accountMap['salesFreeQtyCostAccount']!,
            0,
            freQTYConst,
            type,
            billId,
            now,
            currency,
          ),
          _createOperation(
            accountMap['discountAllowedAccount']!,
            0,
            totalDiscount,
            type,
            billId,
            now,
            currency,
          ),
          _createOperation(
            accountMap['storeAccount']!,
            totalAverageCost + freQTYConst,
            0,
            type,
            billId,
            now,
            currency,
          ),
          _createOperation(
            accountMap['earningsConstAccount']!,
            earnings,
            0,
            type,
            billId,
            now,
            currency,
          ),
          _createOperation(
            accountMap['addedTaxAccount']!,
            totalVat,
            0,
            type,
            billId,
            now,
            currency,
          ),
          _createOperation(
            accountMap['salesCostTaxAccount']!,
            salesTaxValue,
            0,
            type,
            billId,
            now,
            currency,
          ),
        ]);
      } else {
        // Add operations for other types
        operations.addAll([
          _createOperation(
            accountMap['backInvoiceAccount']!,
            0,
            earnings,
            type,
            billId,
            now,
            currency,
          ),
          _createOperation(
            accountMap['storeAccount']!,
            0,
            totalAverageCost + freQTYConst,
            type,
            billId,
            now,
            currency,
          ),
          _createOperation(
            accountMap['addedTaxAccount']!,
            0,
            totalVat,
            type,
            billId,
            now,
            currency,
          ),
          _createOperation(
            accountMap['salesCostTaxAccount']!,
            0,
            salesTaxValue,
            type,
            billId,
            now,
            currency,
          ),
          _createOperation(
            debitAccount,
            amount,
            0,
            type,
            billId,
            now,
            currency,
          ),
          _createOperation(
            accountMap['costBackInvoiceAccount']!,
            salesCost,
            0,
            type,
            billId,
            now,
            currency,
          ),
          _createOperation(
            accountMap['costBackInvoiceAndFreeQtyAccount']!,
            freQTYConst,
            0,
            type,
            billId,
            now,
            currency,
          ),
          _createOperation(
            accountMap['discountAllowedAccount']!,
            totalDiscount,
            0,
            type,
            billId,
            now,
            currency,
          ),
        ]);
      }

      final result =
          await addListAccountsOperationsUsecase.call(Params(operations));
      // print(operations.length);
      result.fold(
        (failure) {
          print(failure.message);
        },
        (_) {
          print('successfull added');
        },
      );
    } else {}
  }

  AccountsOperationsEntity _createOperation(
    int accountNumber,
    double credit,
    double debit,
    int type,
    int billId,
    DateTime operationDate,
    CurencyEntity currency,
  ) {
    return AccountsOperationsEntity(
      accountNumber: accountNumber,
      operationDate: operationDate,
      currencyId: currency.id,
      currencyValue: currency.value,
      operationCredit: credit,
      operationDebit: debit,
      operationRef: '1',
      operationId: billId,
      operationStatement: '',
      operationType: type,
    );
  }

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    phone.dispose();
    address.dispose();
    limit.dispose();
    email.dispose();
  }
}

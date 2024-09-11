import 'package:era_pro_application/src/core/utils/usecase_helper.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/accounts/domain/usecases/usecases.dart';
import 'package:get/get.dart';

class AccountsController extends GetxController {
  GetAccountsUseCase getAccountsUseCase;
  AccountsController({required this.getAccountsUseCase});

  final allAccounts = Rx<List<AccountEntity>>([]);

  final selectedAccounts = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getAllAccounts();
  }

  Future<List<AccountEntity>> getAllAccounts() async {
    await handleUsecase(
      usecase: getAccountsUseCase.call,
      target: allAccounts,
    );
    return allAccounts.value;
  }
}

import 'package:era_pro_application/src/core/constants/share_pref_keys.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';
import 'package:era_pro_application/src/features/main_info/domain/usecases/main_info_usecase.dart';
import 'package:get/get.dart';

import 'package:era_pro_application/src/features/user/domain/entities/user_entity.dart';
import 'package:era_pro_application/src/features/user/domain/usecases/usecases.dart';

class UserController extends GetxController {
  SharedPreferencesService sharedPreferencesService;
  GetUserUseCase getUserUseCase;
  GetUserSettingsUsecase getUserSettingsUsecase;
  @override
  void onInit() async {
    super.onInit();
    await getUser();
    await getUserSetting();
  }

  UserController(
      {required this.getUserUseCase,
      required this.getUserSettingsUsecase,
      required this.sharedPreferencesService});

  var user = Rx<UserEntity?>(null);

  Future<void> getUser() async {
    final res = await getUserUseCase();
    res.fold((f) {}, (r) {
      user.value = r;
    });
  }

  Future<void> getUserSetting() async {
    final usersettingCustomergroupKey = sharedPreferencesService.getString(
      SharedPrefKeys.USERSETTING_CUSTOMERGROUP_KEY,
    );
    if (usersettingCustomergroupKey == null) {
      final res = await getUserSettingsUsecase();
      res.fold((f) {}, (r) {
        print('the user setting fetched correctly');
      });
    }
  }
}

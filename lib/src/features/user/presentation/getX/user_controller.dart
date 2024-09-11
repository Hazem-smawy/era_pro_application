import 'package:get/get.dart';

import 'package:era_pro_application/src/features/user/domain/entities/user_entity.dart';
import 'package:era_pro_application/src/features/user/domain/usecases/usecases.dart';

class UserController extends GetxController {
  GetUserUseCase getUserUseCase;
  @override
  void onInit() {
    super.onInit();
    getUser();
  }

  UserController({
    required this.getUserUseCase,
  });

  var user = Rx<UserEntity?>(null);

  Future<void> getUser() async {
    final res = await getUserUseCase();
    res.fold((f) {}, (r) {
      user.value = r;
    });
  }
}

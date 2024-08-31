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

  // Rx<UserEntity> user = Rx(UserEntity(
  //   id: 0,
  //   userName: "",
  //   password: "",
  //   userAcctype: 0,
  //   branchId: 0,
  //   groupId: 0,
  //   note: "",
  // ));
  var user = Rx<UserEntity?>(null);

  Future<void> getUser() async {
    final res = await getUserUseCase();
    res.fold((f) {
    }, (r) {
      user.value = r;
    });
  }
}

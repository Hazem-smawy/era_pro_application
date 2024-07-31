import 'package:get/get.dart';

import 'package:era_pro_applicationlication/src/features/user/domain/entities/user_entity.dart';
import 'package:era_pro_applicationlication/src/features/user/domain/usecases/usecases.dart';

class UserController extends GetxController {
  GetUserUseCase getUserUseCase;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUser();
  }

  UserController({
    required this.getUserUseCase,
  });

  Rx<UserEntity> user = Rx(UserEntity(
    id: 0,
    userName: "",
    password: "",
    userAcctype: 0,
    branchId: 0,
    groupId: 0,
    note: "",
  ));

  Future<void> getUser() async {
    final res = await getUserUseCase();
    res.fold((f) {
      print("failures get user: ${f.message}");
    }, (r) {
      user.value = r;
    });
  }
}

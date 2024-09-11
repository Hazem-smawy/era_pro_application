
  import 'package:get/get.dart'; 
  import 'sand_controller.dart';

  class SandBinding implements Bindings {
    @override
    void dependencies() => Get.lazyPut(() => SandController());
  }
  
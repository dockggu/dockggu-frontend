import 'package:dockggu/controller/nav_controller.dart';
import 'package:get/get.dart';

class InitBining extends Bindings {
  void dependencies() {
    Get.put(BottomNavController(),
        // 앱이 종료되기 전까지 이 인스턴스는 살아있음.
        permanent: true);
  }
}
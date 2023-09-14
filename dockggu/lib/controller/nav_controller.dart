import 'package:get/get.dart';

enum PageName { FIRST, SECOND, THIRD }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changeBottomNav(int value) {
    var page = PageName.values[value];

    switch (page) {
      case PageName.FIRST:
      case PageName.SECOND:
      case PageName.THIRD:
        _changePage(value);
        break;
    }
  }

  void _changePage(int value) {
    pageIndex(value);
  }
}
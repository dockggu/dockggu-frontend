import 'package:dockggu/page/mygroup.dart';
import 'package:dockggu/page/mypage_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'binding/init_binding.dart';
import 'controller/nav_controller.dart';
import 'page/home.dart';

void main() {
  runApp(const App());
}

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KR'),
      ],
      initialBinding: InitBining(),
      home: Obx(() => Scaffold(
            body: IndexedStack(
                index: controller.pageIndex.value,
                children:  [Home(), MyGroup() ,Mypage1()]),
            bottomNavigationBar: BottomNavigationBar(
                onTap: controller.changeBottomNav,
         
                elevation: 3,
                type:
                    BottomNavigationBarType.fixed, // 버튼이 활성화 되었을 때 위로 안올라가게 고정
                currentIndex: controller.pageIndex.value,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.home,
                      ),
                      activeIcon: Icon(Icons.home),
                      label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.collections_bookmark),
                      activeIcon: Icon(Icons.collections_bookmark),
                      label: 'My group'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle),
                      activeIcon: Icon(Icons.account_circle),
                      label: 'My page'),
                ]),
          )),
    );
  }
}

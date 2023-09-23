import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {

  const AppBarWidget({Key? key,
    required this.appBar,
    required this.title,
    this.center = false})
      : super(key: key);

  final AppBar appBar;
  final String title;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return AppBar(
          backgroundColor: Colors.white,
          title: Text( '$title' ,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          centerTitle: center,
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: Colors.black,
            ),
            onTap: () {
              Get.back();
            },
          ),
          elevation: 0,
        );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
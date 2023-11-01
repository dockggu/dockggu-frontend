import 'package:flutter/material.dart';

enum CategoryType { CLICKED, UNCLICKED }

class MainCategory extends StatelessWidget {
  String categoryName;
  double? fontsize;
  double? height;
  CategoryType type;

  MainCategory(
      {super.key,
      required this.categoryName,
      this.fontsize = 15,
      this.height = 30,
      required this.type});

  Widget _unClicked() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xffCBC6C6))
          ),
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              categoryName,
              style: TextStyle(fontSize: fontsize),
            ),
          ],
        ),
      ), // 각 아이템에 다른 텍스트 설정
    );
  }

  Widget _clicked() {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffFFC100),
          borderRadius: BorderRadius.circular(15),
          ),
      height: height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              categoryName,
              style: TextStyle(fontSize: fontsize, color: Colors.white),
            ),
          ],
        ),
      ), // 각 아이템에 다른 텍스트 설정
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case CategoryType.CLICKED:
        return _clicked();
      case CategoryType.UNCLICKED:
        return _unClicked();
    }
    ;
  }
}

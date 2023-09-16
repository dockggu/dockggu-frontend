import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  String categoryName;

  CategoryWidget({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xffCBC6C6))),
      height: 30,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              categoryName,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ), // 각 아이템에 다른 텍스트 설정
    );
  }
}

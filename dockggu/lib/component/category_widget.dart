import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  String categoryName;
  double? fontsize;
  double? height;

  CategoryWidget({super.key, required this.categoryName,this.fontsize =15, this.height=30});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xffCBC6C6))),
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
}

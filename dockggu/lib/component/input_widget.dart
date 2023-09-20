import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  TextEditingController? textEditingController; // 나중에 필수 입력값으로 바꾸기
  double? height;
  String title;

  InputWidget(
      {super.key,
      this.textEditingController,
      this.height = 45,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
      ],
    );
  }
}

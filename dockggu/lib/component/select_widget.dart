import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectPopup extends StatelessWidget {
  final String title;
  final Function()? reportfunc;
  final Function()? blockfunc;

  SelectPopup({super.key, required this.reportfunc, required this.blockfunc,required this.title});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            // 창 둥글게
            borderRadius: BorderRadius.circular(20),
            child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //수정삭제 버튼 만들기
                    GestureDetector(
                      onTap: reportfunc,
                      child: Container(
                        alignment: Alignment.center,
                        width: Get.width,
                        height: 50,
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      width: Get.width,
                      height: 0.3,
                    ),
                    GestureDetector(
                      onTap: blockfunc,
                      child: Container(
                        alignment: Alignment.center,
                        width: Get.width,
                        height: 50,
                        child: Text(
                          '닫기',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

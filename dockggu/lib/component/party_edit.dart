import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartyEdit extends StatelessWidget {
  final Function()? deletefunc;
  final Function()? updatefunc;

  final Function()? exitfunc;

  PartyEdit(
      {super.key,
      required this.deletefunc,
      required this.exitfunc,
      required this.updatefunc});

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
                    // Container(
                    //   color: Colors.grey,
                    //   width: Get.width,
                    //   height: 0.3,
                    // ),
                    // GestureDetector(
                    //   onTap: updatefunc,
                    //   child: Container(
                    //     alignment: Alignment.center,
                    //     width: Get.width,
                    //     height: 50,
                    //     child: Text(
                    //       "수정",
                    //       style: TextStyle(fontSize: 17),
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   color: Colors.grey,
                    //   width: Get.width,
                    //   height: 0.3,
                    // ),
                    GestureDetector(
                      onTap: deletefunc,
                      child: Container(
                        alignment: Alignment.center,
                        width: Get.width,
                        height: 50,
                        child: Text(
                          "모임 삭제",
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
                      onTap: exitfunc,
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

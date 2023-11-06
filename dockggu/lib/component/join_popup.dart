import 'package:dockggu/component/join_success_popup.dart';
import 'package:dockggu/component/yellow_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JoinPopup extends StatelessWidget {
  String groupName;
    final Function()? okbtn;

  JoinPopup({super.key, required this.groupName,required this.okbtn});

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
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: Get.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '📝 모임 가입하기',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              // Get.back();
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "x",
                              style: TextStyle(
                                  color: Color(0xff737475), fontSize: 26),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      groupName,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '모임에 가입하시겠습니까?',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    
                    Align(
                      alignment: Alignment.center,
                      child: YellowButton(
                        ontap: () {
                          okbtn!();
                          showDialog(
                              context: context,
                              builder: (context) => JoinSuccess(
                                    groupName: '기술경영',
                                  ));
                        },
                        buttonText: '가입하기',
                        buttonWidth: 120),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

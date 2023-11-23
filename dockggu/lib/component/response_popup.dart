import 'package:dockggu/component/join_success_popup.dart';
import 'package:dockggu/component/yellow_button.dart';
import 'package:dockggu/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/team_controller.dart';

class ResponsePopup extends StatelessWidget {
  String content;
  String yestext;

  final Function()? okbtn;

  ResponsePopup({
    super.key,
    required this.content,
    required this.yestext,
    required this.okbtn,
  });

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
                width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(content,style: TextStyle(fontSize: 16),),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        YellowButton(
                            ontap: okbtn, buttonText: yestext, buttonWidth: 260),
           
                      ],
                    ),
                    SizedBox(height: 10,)
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

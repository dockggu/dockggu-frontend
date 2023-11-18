import 'package:dockggu/component/join_success_popup.dart';
import 'package:dockggu/component/yellow_button.dart';
import 'package:dockggu/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/team_controller.dart';

class TwobtnDialog extends StatelessWidget {
  String content;
  String yestext;
  String notext;

  final Function()? okbtn;
  final Function()? nobtn;

  TwobtnDialog({
    super.key,
    required this.content,
    required this.yestext,
    required this.notext,
    required this.okbtn,
    required this.nobtn,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        YellowButton(
                            ontap: okbtn, buttonText: yestext, buttonWidth: 130),
                        YellowButton(
                            ontap: nobtn, buttonText: notext, buttonWidth: 130)
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

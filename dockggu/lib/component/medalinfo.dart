import 'package:dockggu/component/join_success_popup.dart';
import 'package:dockggu/component/yellow_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedalInfo extends StatelessWidget {
  MedalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: Get.width * 0.9,
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '🥇독꾸 메달 기준',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '책 완독하는 횟수에 따라 메달이 주어져요!',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/3rd_medal.png'),
                            Column(
                              children: [
                                Image.asset('assets/next.png'),
                                Text('5개')
                              ],
                            ),
                            Image.asset('assets/2nd_medal.png'),
                            Column(
                              children: [
                                Image.asset('assets/next.png'),
                                Text('10개')
                              ],
                            ),
                            Image.asset('assets/1st_medal.png')
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 5,
                    child: IconButton(
                      color: Color(0xff737475),
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

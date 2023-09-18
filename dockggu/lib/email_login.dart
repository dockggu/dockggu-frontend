import 'package:dockggu/component/yellow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app.dart';

class EmailLogin extends StatelessWidget {
  const EmailLogin({super.key});

void unfocusKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: unfocusKeyboard,
      child: Scaffold(
        backgroundColor: Color(0xffFFD66C),
        body: Stack(
          children: [
            // 📧 이메일로 로그인하기
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 600,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          Text(
                            '📧 이메일로 로그인하기',
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                          Container(
                            width: 230,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  contentPadding: EdgeInsets.zero),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 230,
                            height: 40,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: '비밀번호',
                                  contentPadding: EdgeInsets.zero),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: YellowButton(
                                  ontap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) => App()));
                                  },
                                  buttonText: '로그인 하기',
                                  buttonWidth: 350))
                        ]),
                  ),
                ),
              ],
            ),
            Positioned(
                right: 5,
                top: 200,
                child: SvgPicture.asset('assets/glasses_book.svg')),
          ],
        ),
      ),
    );
  }
}

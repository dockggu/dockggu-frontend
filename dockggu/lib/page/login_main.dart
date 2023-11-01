import 'package:dockggu/app.dart';
import 'package:dockggu/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home.dart';

class LoginMain extends StatefulWidget {
  const LoginMain({super.key});

  @override
  State<LoginMain> createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {
  Widget _introtext() {
    return Column(
      children: [
        const SizedBox(
          height: 150,
        ),
        SvgPicture.asset(
          'assets/login_pic.svg',
          width: 200,
          height: 200,
        ),
        const SizedBox(
          height: 60,
        ),
        const Text(
          '지금 독꾸와 함께',
          style: TextStyle(
              color: Color(0xff3E423A),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          '북커톤을 시작해요 ! 😔',
          style: TextStyle(
              color: Color(0xff3E423A),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          '모임 생성부터 책 추천까지',
          style: TextStyle(color: Color(0xff9D9D9D)),
        )
      ],
    );
  }

  Widget _loginselect() {
    return Column(
      children: [
        const Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Expanded(child: Divider(color: Color(0xff9D9D9D))),
            SizedBox(
              width: 15,
            ),
            Text('SNS 회원가입/로그인'),
            SizedBox(
              width: 15,
            ),
            Expanded(child: Divider(color: Color(0xff9D9D9D))),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SignUp()));
                },
                child: SvgPicture.asset(
                  'assets/apple_login.svg',
                  // width: 200,
                  // height: 200,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => SignUp()));
                },
                child: SvgPicture.asset(
                  'assets/kakao_login.svg',
                  // width: 200,
                  // height: 200,
                ),
              ),
              SvgPicture.asset(
                'assets/google_login.svg',
                // width: 200,
                // height: 200,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => App()));
          },
          child: Text(
            '이메일로 가입하기',
            style: TextStyle(
                color: Color(0xff9D9D9D), decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        _introtext(),
        const SizedBox(
          height: 50,
        ),
        _loginselect()
      ],
    )));
  }
}

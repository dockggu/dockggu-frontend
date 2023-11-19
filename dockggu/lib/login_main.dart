import 'dart:convert';

import 'package:dockggu/app.dart';
import 'package:dockggu/email_login.dart';
import 'package:dockggu/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:http/http.dart' as http;

import 'page/home.dart';

class LoginMain extends StatefulWidget {
  const LoginMain({super.key});

  @override
  State<LoginMain> createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {
  Widget _introtext(BuildContext context) {
    return Column(
      children: [
         SizedBox(
          height: MediaQuery.of(context).size.height*0.18,
        ),
        SvgPicture.asset(
          'assets/login_pic.svg',
          width: 200,
          height: MediaQuery.of(context).size.height*0.23,
        ),
         SizedBox(
          height: MediaQuery.of(context).size.height*0.045,
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

        SizedBox(height: MediaQuery.of(context).size.height*0.05,),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => EmailLogin()));
          },
          child: Container(
            alignment: Alignment.center,
            width: 200,
            height: 40,
            child: Text(
              "이메일 로그인",
              style: TextStyle(fontWeight:FontWeight.w600),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xffFFD66C)),
          ),
        ),
        const SizedBox(
          height:30,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => SignUp()));
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
        _introtext(context),
         SizedBox(
          height: MediaQuery.of(context).size.height*0.055,
        ),
        _loginselect()
      ],
    )));
  }
}

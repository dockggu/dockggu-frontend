import 'dart:convert';

import 'package:dockggu/app.dart';
import 'package:dockggu/email_login.dart';
import 'package:dockggu/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import 'page/home.dart';

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

  // Future<void> initiateKakaoSignUp() async {
  //   // 카카오 로그인
  //   final clientId = '155bd25b5b420714ad17441b610b274e';
  //   final redirectUri =
  //       'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080/api/oauth/kakao';

  //   final url = Uri.https(
  //     'kauth.kakao.com',
  //     '/oauth/authorize',
  //     {
  //       'client_id': clientId,
  //       'redirect_uri': redirectUri,
  //       'response_type': 'code',

  //     },

  //   );

  //   launchUrl(Uri.parse(url.toString()));

  // }

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
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 60),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       GestureDetector(
        //         onTap: () {
        //           Navigator.push(
        //               context, MaterialPageRoute(builder: (_) => App()));
        //         },
        //         child: SvgPicture.asset(
        //           'assets/apple_login.svg',
        //           // width: 200,
        //           // height: 200,
        //         ),
        //       ),
        //       GestureDetector(
        //         onTap: () {
        //           Navigator.push(
        //               context, MaterialPageRoute(builder: (_) => SignUp()));
        //         },
        //         child: GestureDetector(
        //           onTap: () async {
        //             var redirecturi =
        //                 "http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080/api/oauth/kakao";
        //             if (await isKakaoTalkInstalled()) {
        //               try {
        //                 await UserApi.instance.loginWithKakaoTalk();
        //                 print('카카오톡으로 로그인 성공');
        //               } catch (error) {
        //                 print('카카오톡으로 로그인 실패 $error');

        //                 // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        //                 // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        //                 if (error is PlatformException &&
        //                     error.code == 'CANCELED') {
        //                   return;
        //                 }
        //                 // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        //                 try {
        //                   var ddd =
        //                       await UserApi.instance.loginWithKakaoAccount();
        //                   print(ddd);
        //                   print('카카오계정으로 로그인 성공');
        //                 } catch (error) {
        //                   print('카카오계정으로 로그인 실패 $error');
        //                 }
        //               }
        //             } else {
        //               try {
        //                 var ddd =
        //                     await UserApi.instance.loginWithKakaoAccount();
        //                 print("여긴가${ddd}");
        //                 // Navigator.push(
        //                 //     context, MaterialPageRoute(builder: (_) => App()));

        //                 print('카카오계정으로 로그인 성공');
        //               } catch (error) {
        //                 print('카카오계정으로 로그인 실패 $error');
        //               }
        //             }
        //           },
        //           child: SvgPicture.asset(
        //             'assets/kakao_login.svg',
        //             // width: 200,
        //             // height: 200,
        //           ),
        //         ),
        //       ),
        //       SvgPicture.asset(
        //         'assets/google_login.svg',
        //         // width: 200,
        //         // height: 200,
        //       ),
        //     ],
        //   ),
        // ),
        const SizedBox(
          height: 20,
        ),
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
        _introtext(),
        const SizedBox(
          height: 50,
        ),
        _loginselect()
      ],
    )));
  }
}

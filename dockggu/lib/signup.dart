import 'package:dockggu/component/yellow_button.dart';
import 'package:dockggu/email_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'app.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '독꾸를 경험하기 위해',
              style: TextStyle(color: Color(0xffA6A6A6), fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '회원가입이',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 7,
            ),
            Text('필요해요',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold))
          ],
        ),
        SizedBox(
          width: 30,
        ),
        SvgPicture.asset('assets/glasses_book.svg')
      ],
    );
  }

  Widget _inputList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                  hintText: '이름입력', contentPadding: EdgeInsets.zero),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: 250,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Email', contentPadding: EdgeInsets.zero),
            ),
          ),
                    SizedBox(height: 20,),

          Container(
            width: 250,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                  hintText: '비밀번호', contentPadding: EdgeInsets.zero),
            ),
          ),
                    SizedBox(height: 20,),

          Container(
            width: 250,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                  hintText: '비밀번호 확인', contentPadding: EdgeInsets.zero),
            ),
          ),
        ],
      ),
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
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => SignUp()));
                },
                child: SvgPicture.asset(
                  'assets/apple_login.svg',
                  // width: 200,
                  // height: 200,
                ),
              ),
              SvgPicture.asset(
                'assets/kakao_login.svg',
                // width: 200,
                // height: 200,
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
            Navigator.push(
                        context, MaterialPageRoute(builder: (_) => EmailLogin()));
          },
          child: const Text(
            '이메일로 가입하기',
            style: TextStyle(
                color: Color(0xff9D9D9D), decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }

void unfocusKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: unfocusKeyboard,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
            ),
            _header(),
            SizedBox(
              height: 40,
            ),
            _inputList(),
            SizedBox(height: 35,),
            Align(
              alignment: Alignment.center,
              child: YellowButton(ontap: (){
    
                Navigator.push(
                        context, MaterialPageRoute(builder: (_) => App()));
              }, buttonText: '가입하기', buttonWidth: 300)),
              SizedBox(height: 40,),
              _loginselect()
          ],
        ),
      ),
    );
  }
}

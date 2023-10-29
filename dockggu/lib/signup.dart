import 'package:dockggu/component/yellow_button.dart';
import 'package:dockggu/email_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'app.dart';
import 'package:http/http.dart' as http;

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
          SizedBox(
            height: 20,
          ),
          Container(
            width: 250,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Email', contentPadding: EdgeInsets.zero),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 250,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                  hintText: '비밀번호', contentPadding: EdgeInsets.zero),
            ),
          ),
          SizedBox(
            height: 20,
          ),
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

// Future<Info> fetchInfo() async {
// var url = 'https://api.mockaroo.com/api/5ee43e50?count=1&key=6213f2b0';
// final response = await http.get(Uri.parse(url));

// if (response.statusCode == 200) {
//   //만약 서버가 ok응답을 반환하면, json을 파싱합니다
//   print('응답했다');
//   print(json.decode(response.body));
//   return Info.fromJson(json.decode(response.body));
// } else {
//   //만약 응답이 ok가 아니면 에러를 던집니다.
//   throw Exception('계좌정보를 불러오는데 실패했습니다');
// }
// }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://kauth.kakao.com/oauth/authorize?client_id=155bd25b5b420714ad17441b610b274e&redirect_uri=http://ec2-16-16-217-214.eu-north-1.compute.amazonaws.com:8080/api/oauth/kakao&response_type=code'));

    if (response.statusCode == 200) {
      // HTTP 요청이 성공한 경우
      print('Response data: ${response.body}');
    } else {
      // HTTP 요청이 실패한 경우
      print('Failed to load data');
    }
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
            // _inputList(),
            SizedBox(
              height: 35,
            ),
            Align(
                alignment: Alignment.center,
                child: YellowButton(
                    ontap: () {
                      fetchData();

                      // Navigator.push(
                      //         context, MaterialPageRoute(builder: (_) => App()));
                    },
                    buttonText: '카카오 가입하기',
                    buttonWidth: 300)),
            SizedBox(
              height: 40,
            ),
            // _loginselect()
          ],
        ),
      ),
    );
  }
}



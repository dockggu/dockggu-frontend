import 'dart:convert';
import 'dart:io';

import 'package:dockggu/component/yellow_button.dart';
import 'package:dockggu/email_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

import 'component/twobtn_dialog.dart';
import 'controller/signup_controller.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

final picker = ImagePicker();

class _SignUpState extends State<SignUp> {
  WebViewController? _webViewController;
  var controller = Get.put(SignUpController());
  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      if (image != null) {
        controller.image.value = File(image.path); // 가져온 이미지를 _image에 저장
        print(controller.image.value);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('사진을 선택해주세요 !'),
          duration: Duration(seconds: 2),
        ));
      }
    });
  }

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
              controller: controller.inputName,
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
              controller: controller.inputEmail,
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
              controller: controller.inputPw,
              decoration: InputDecoration(
                  hintText: '비밀번호 6자리 이상', contentPadding: EdgeInsets.zero),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 250,
            height: 40,
            child: TextField(
              controller: controller.inputRePw,
              decoration: InputDecoration(
                  hintText: '비밀번호 확인', contentPadding: EdgeInsets.zero),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          _selectImage()
        ],
      ),
    );
  }

  Widget _selectImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '프로필 사진',
          style: TextStyle(
              color: Color.fromARGB(255, 112, 111, 111),
              fontSize: 16,
              fontWeight: FontWeight.w300),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
            alignment: Alignment.center,
            height: 100,
            width: 100,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 0,
                blurRadius: 2.0,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: GestureDetector(
              onTap: () async {
                await getImage(ImageSource.gallery);
              },
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (controller.image.value == null)
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: SvgPicture.asset('assets/camera-photo.svg'),
                      )
                    else
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50)),
                        child: Image.file(
                          File(controller.image.value!.path),
                          height: 90,
                          fit: BoxFit.fill,
                        ),
                      )
                  ]),
            )),
        const SizedBox(
          height: 20,
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

  Future<void> getUserInf() async {
    // 헤더에 로그인 토큰 주고 데이터 불러오기 샘플

    const token =
        'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMyIsImlhdCI6MTY5OTQzNjYwNiwiZXhwIjoxNjk5Nzk2NjA2fQ.ibmLuZSETf8L_7gAbSUCi8oIMg4IfqmJExLUItF96NvpohbBu1w_eNLsQy263Mjcn6iJO5rnm1T_nJhxIuaOaA';
    const path = 'api/mypage/user';
    final response = await http.get(
      Uri.parse(
          'http://ec2-16-16-217-214.eu-north-1.compute.amazonaws.com:8080/$path'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
    print(responseJson);
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

            SizedBox(
              height: 35,
            ),
            Align(
                alignment: Alignment.center,
                child: YellowButton(
                    ontap: () async {
                      showDialog(
                          context: context,
                          builder: (context) => TwobtnDialog(
                              content: "가입하시겠습니까?",
                              yestext: "가입",
                              notext: "취소",
                              okbtn: () async {
                                controller.signUp(context);
                              },
                              nobtn: () {
                                Navigator.pop(context);
                              }));

                      // fetchData();
                      // getUserInf();
                      // initiateKakaoSignUp();

                      // Navigator.push(
                      //         context, MaterialPageRoute(builder: (_) => App()));
                    },
                    buttonText: '가입하기',
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

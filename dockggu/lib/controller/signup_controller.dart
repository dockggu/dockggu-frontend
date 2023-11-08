import 'package:dockggu/model/mypageDTO.dart';
import 'package:dockggu/repogistory/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController inputName = TextEditingController();
  TextEditingController inputEmail = TextEditingController();
  TextEditingController inputPw = TextEditingController();
  TextEditingController inputRePw = TextEditingController();

  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPw = TextEditingController();

  Future<void> signUp() async {
    if (inputPw.text == inputRePw.text) {
      var signupData = SignUpDTO(
          userEmail: inputEmail.text,
          userPassword: inputPw.text,
          userPasswordCheck: inputRePw.text,
          userNickname: inputName.text);

      UserRepo.signUp(signupData);
    } else {
      print('비밀번호 확인해주세여ㅛ');
    }
  }

  Future<void> login() async {
    var signupData =
        LoginDTO(userEmail: loginEmail.text, userPassword: loginPw.text);

    UserRepo.gologin(signupData);
  }
}

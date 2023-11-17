import 'dart:io';

import 'package:dockggu/component/toast_message.dart';
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
  final Rx<File?> image = Rx<File?>(null);

  Future<void> signUp(BuildContext context) async {
    if (inputPw.text == inputRePw.text) {
      var signupData = SignUpDTO(
          userEmail: inputEmail.text,
          userPassword: inputPw.text,
          userPasswordCheck: inputRePw.text,
          userNickname: inputName.text);
      UserRepo.signUp(signupData,image.value!);
      Navigator.pop(context);
    } else {
      ToastMessage().showToast("비밀번호를 확인해주세요.");
    }
  }

  Future<void> login(BuildContext context) async {
    var signupData =
        LoginDTO(userEmail: loginEmail.text, userPassword: loginPw.text);

    UserRepo.gologin(signupData,context);
  }
}

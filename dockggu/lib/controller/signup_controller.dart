import 'dart:io';

import 'package:dockggu/component/toast_message.dart';
import 'package:dockggu/model/mypageDTO.dart';
import 'package:dockggu/repogistory/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/twobtn_dialog.dart';

class SignUpController extends GetxController {
  TextEditingController inputName = TextEditingController();
  TextEditingController inputEmail = TextEditingController();
  TextEditingController inputPw = TextEditingController();
  TextEditingController inputRePw = TextEditingController();

  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPw = TextEditingController();
  final Rx<File?> image = Rx<File?>(null);

  Future<void> signUp(BuildContext context) async {
    if (inputPw.text == inputRePw.text && inputPw.text.length >= 6) {
      if (inputName.text.length < 6) {
        var signupData = SignUpDTO(
            userEmail: inputEmail.text,
            userPassword: inputPw.text,
            userPasswordCheck: inputRePw.text,
            userNickname: inputName.text);
        UserRepo.signUp(signupData, image.value!,context);
        Navigator.pop(context);
        Navigator.pop(context);
        
      } else {
        ToastMessage().showToast("이름은 5자 이하로 작성해주세요.");
        Navigator.pop(context);
      }
    } else {
      ToastMessage().showToast("비밀번호를 확인해주세요.");
      Navigator.pop(context);
    }
  }

  Future<void> login(BuildContext context) async {
    var signupData =
        LoginDTO(userEmail: loginEmail.text, userPassword: loginPw.text);

    UserRepo.gologin(signupData, context);
  }
}

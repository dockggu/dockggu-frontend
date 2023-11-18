import 'dart:io';

import 'package:dockggu/controller/home_controller.dart';
import 'package:dockggu/controller/team_controller.dart';
import 'package:dockggu/model/partyinfoDTO.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../component/toast_message.dart';
import '../repogistory/main_repo.dart';

class MakePartyController extends GetxController {
  final Rx<File?> image = Rx<File?>(null);
  var category = "".obs;
  var categorycode = "".obs;
  TextEditingController inputPartyName = TextEditingController();
  TextEditingController inputPartyInfo = TextEditingController();
  TextEditingController inputMaxMembers = TextEditingController();

  Future<void> makeParty() async {
    // print(image.value);
    
    try{
 await MainRepo.makeParty(image.value!, inputPartyName.text,
        inputPartyInfo.text, categorycode.value, int.parse(inputMaxMembers.text));
    Get.find<HomeContoller>().initCategory();
    Get.put(TeamController());
    Get.find<TeamController>().isMembers();

    }catch(e){
      ToastMessage().showToast("인원 수는 숫자로 입력해주세요.");


    }
   

  }
}

import 'dart:io';

import 'package:dockggu/model/partyinfoDTO.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
    print(categorycode.value);
    
    await MainRepo.makeParty(image.value!, inputPartyName.text,
        inputPartyInfo.text, categorycode.value, int.parse(inputMaxMembers.text));
  }
}

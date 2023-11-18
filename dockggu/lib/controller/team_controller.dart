import 'package:dockggu/controller/home_controller.dart';
import 'package:dockggu/model/bookathoninfoDTO.dart';
import 'package:dockggu/page/home.dart';
import 'package:dockggu/repogistory/main_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/makebookathonDTO.dart';
import '../model/mypageDTO.dart';
import '../model/partyinfoDTO.dart';
import '../repogistory/main_repo.dart';

class TeamController extends GetxController {
  var currentTeam = PartyResponseDto().obs;
  RxList<PartyMembersDTO> partyMembers = RxList();
  RxList<BookathonDTO> bookathonList = RxList();

  var ongoingthonList = BookathonDTO().obs;
  var currentUser = UserDto().obs;
  var isRegister = false.obs;
  var isMaster = false.obs;
  
  RxList<ParicipateBookathon> participateBook = RxList();
  var selectBook = ParicipateBookathon().obs;

  TextEditingController inputPage = TextEditingController();

  void onInit() async {
    currentUser.value = await MainRepo.getCurrentUser();
  }

  Future<void> isMembers() async {
    isRegister.value = false;
    for (PartyMembersDTO i in partyMembers) {
      if (currentUser.value.userId == i.userId) {
        isRegister.value = true;
      } else {}
    }
  }

  Future<void> participateThon() async {
    selectBook.value.bookTotalPage = int.parse(inputPage.text);
    selectBook.value.bookertonId = ongoingthonList.value.bookertonId;
    inputPage.clear();
    print(selectBook.toJson());
    await MainRepo.participateThon(selectBook.value);

    // Get.back();
  }

  Future<void> getPartyMember() async {
    partyMembers(await MainRepo.getPartyMembers(currentTeam.value.partyId!));
  }

  Future<void> getBookathonList() async {
    bookathonList(await MainRepo.getAllBookathon(currentTeam.value.partyId!));
    getOngoingThon();
    print(bookathonList);
  }

  Future<void> getOngoingThon() async {
    for (BookathonDTO data in bookathonList) {
      print(data.bookertonStatus);
      if (data.bookertonStatus == "A") {
        ongoingthonList(data);
      }
    }
    print(ongoingthonList);
  }
}

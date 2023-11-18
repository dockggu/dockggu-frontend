import 'package:dockggu/component/toast_message.dart';
import 'package:dockggu/controller/home_controller.dart';
import 'package:dockggu/model/bookathoninfoDTO.dart';
import 'package:dockggu/page/home.dart';
import 'package:dockggu/repogistory/main_repo.dart';
import 'package:flutter/cupertino.dart';
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
    await getPartyMember();
    await getBookathonList();
  }

  Future<void> isMembers() async {
    isRegister.value = false;
    for (PartyMembersDTO i in partyMembers) {
      if (currentUser.value.userId == i.userId || currentTeam.value.partyMaster == currentUser.value.userId) {
        isRegister.value = true;
      } else {}
    }
  }

  Future<void> participateThon() async {
    try {
      selectBook.value.bookTotalPage = int.parse(inputPage.text);
      selectBook.value.bookertonId = ongoingthonList.value.bookertonId;
      inputPage.clear();
      await MainRepo.participateThon(selectBook.value);
      getBookathonList();
    } catch (e) {
      ToastMessage().showToast("페이지 수는 숫자로 입력해주세요.");
    }

    // Get.back();
  }

  Future<void> getPartyMember() async {
    partyMembers(await MainRepo.getPartyMembers(currentTeam.value.partyId!));
    isMembers();
  }

  Future<void> getBookathonList() async {
    bookathonList(await MainRepo.getAllBookathon(currentTeam.value.partyId!));
    getOngoingThon();
  }

  Future<void> getOngoingThon() async {
    for (BookathonDTO data in bookathonList) {
      if (data.bookertonStatus == "A") {
        ongoingthonList(data);
      }
    }
  }
}

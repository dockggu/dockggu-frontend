import 'package:dockggu/controller/bookerton_controller.dart';
import 'package:dockggu/controller/team_controller.dart';
import 'package:dockggu/repogistory/main_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../component/toast_message.dart';
import '../model/partyinfoDTO.dart';

class AddThonController extends GetxController {
  var currentTeam = PartyResponseDto().obs;
  TextEditingController inputThonName = TextEditingController();
  TextEditingController inputMaxMembers = TextEditingController();
  Rx<DateTimeRange> dateRange = Rx(DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(Duration(days: 7)),
  ));

  Future<void> addThon() async {
    try {
      var parseNum = int.parse(inputMaxMembers.text);
      var selectDate = DateTime(dateRange.value.start.year,
              dateRange.value.start.month, dateRange.value.start.day)
          .microsecondsSinceEpoch;
      var currentDate = DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day+1)
          .microsecondsSinceEpoch;
      if (selectDate < currentDate) {
        ToastMessage().showToast("시작 날짜는 현재 날짜 다음 날부터 선택 가능합니다.");
      } else {
        await MainRepo.addThon(
            currentTeam.value.partyId!,
            inputThonName.text,
            DateFormat("yyyyMMdd").format(dateRange.value.start),
            DateFormat("yyyyMMdd").format(dateRange.value.end),
            parseNum);
        Get.find<TeamController>().getBookathonList();
        Get.find<BookertonController>()
            .fetchBookertonData(currentTeam.value.partyId!, 0);
        Get.put(BookertonController());
        Navigator.pop(Get.context!);
      }
    } catch (e) {
      ToastMessage().showToast("인원 수는 숫자로 입력해주세요.");
    }
  }
}

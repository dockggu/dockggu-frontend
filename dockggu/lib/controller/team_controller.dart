import 'package:dockggu/component/mypage_widget.dart';
import 'package:dockggu/model/bookathoninfoDTO.dart';
import 'package:dockggu/repogistory/main_repo.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/mypageDTO.dart';
import '../model/partyinfoDTO.dart';

class TeamController extends GetxController {
  var currentTeam = PartyResponseDto().obs;
  RxList<PartyMembersDTO> partyMembers = RxList();
  RxList<BookathonDTO> bookathonList = RxList();
  var ongoingthonList = BookathonDTO().obs;
  var currentUser = UserDto().obs;
  var isRegister = false.obs;

  void onInit() async {
    currentUser.value = await MainRepo.getCurrentUser();
  }

  Future<void> isMembers()async{
    for(PartyMembersDTO i in partyMembers){
      print(i.userId);
      if(currentUser.value.userId == i.userId){
        isRegister.value = true;
      }

    }

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

  // Future<void> fetchImage() async{
  //   // 백엔드에서 이미지에 대한 URL을 여기에 입력하세요.
  //   final url = 'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080/src/main/java/com/DXsprint/upload/img/8f7013ab-7d75-4711-92f0-7b349df00734_pre.avif';
  //   var response = http.get(Uri.parse(url),headers: {
  //       'Content-Type': 'application/json; charset=utf-8',
  //       'Authorization': 'Bearer $token',
  //       'Accept-Charset': 'utf-8',
  //     },);
  //   print(response.bodyBytes);
  // }
  
}

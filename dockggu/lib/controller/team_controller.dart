import 'package:dockggu/component/mypage_widget.dart';
import 'package:dockggu/model/bookathoninfoDTO.dart';
import 'package:dockggu/repogistory/main_repo.dart';
import 'package:get/get.dart';

import '../model/partyinfoDTO.dart';

class TeamController extends GetxController {
  var currentTeam = PartyResponseDto().obs;
  RxList<PartyMembersDTO> partyMembers = RxList();
  RxList<BookathonDTO> bookathonList = RxList();
    var ongoingthonList = BookathonDTO().obs;


  Future<void> getPartyMember() async {
    partyMembers(await MainRepo.getPartyMembers(currentTeam.value.partyId!));
  }

  Future<void> getBookathonList() async {
    bookathonList(await MainRepo.getAllBookathon(currentTeam.value.partyId!));
    getOngoingThon();
    print(bookathonList);
  }

  Future<void> getOngoingThon() async {
    for(BookathonDTO data in  bookathonList){
      print(data.bookertonStatus);
      if (data.bookertonStatus == "A"){

        ongoingthonList(data);
      }
      
    }
    print(ongoingthonList);

  }

}

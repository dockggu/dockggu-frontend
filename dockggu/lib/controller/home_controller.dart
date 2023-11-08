import 'dart:convert';

import 'package:dockggu/model/partyinfoDTO.dart';
import 'package:dockggu/repogistory/main_repo.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/mypageDTO.dart';

class HomeContoller extends GetxController {
  var categoryopen = true.obs;
  var currentUser = UserDto().obs;
  RxList<int> medalList = [0,0,0].obs;
  final RxMap<String, String> itemsmap = {
    'bc0000': '📚 전체',
    'bc0001': '🕵🏻‍♂️ 소설',
    'bc0002': '📕 에세이',
    'bc0003': '🗺 여행',
    'bc0004': '👤 인문학',
    'bc0005': '🎨 디자인',
    'bc0006': '🧐 철학',
    'bc0007': '🗿 역사',
    'bc0008': '🎫 예술/문화',
    'bc0009': '📈 경제/경영',
    'bc0010': '👩🏻‍⚖️ 사회/정치',
    'bc0011': '✍🏻 시',
    'bc0012': '🛍 라이프스타일',
    'bc0013': '🏗 건축',
    'bc0014': '🧬 과학',
    'bc0015': '🖥 컴퓨터/IT',
    'bc0016': '💪 건강/운동',
    'bc0017': '👨🏻‍💻 자기계발',
    'bc0018': '💵 재테크',
    'bc0019': '📱 마케팅'
  }.obs;

  RxList<String> initList = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ].obs;

  RxList<String> clickedlist = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ].obs;
  RxList<PartyResponseDto> paryList = RxList();
  void onInit() async {
    // currentUser.value = await MainRepo.getCurrentUser();
    // print(currentUser.value.userAward);
    // if (currentUser.value.userAward! > 0 &&
    //     currentUser.value.userAward != null) {
    //   medalList.value = [
    //     currentUser.value.userAward!,
    //     if (currentUser.value.userAward! > 5)
    //       (currentUser.value.userAward! / 5).toInt()
    //     else
    //       0,
    //     if (currentUser.value.userAward! > 10)
    //       (currentUser.value.userAward! / 10).toInt()
    //     else
    //       0
    //   ];
    // } else {
    //   medalList.value = [0, 0, 0];
    // }
    // initCategory();
    super.onInit();
  }

  Future<void> medalFunc()async{
    if (currentUser.value.userAward! > 0 &&
        currentUser.value.userAward != null) {
      medalList.value = [
        currentUser.value.userAward!,
        if (currentUser.value.userAward! > 5)
          (currentUser.value.userAward! / 5).toInt()
        else
          0,
        if (currentUser.value.userAward! > 10)
          (currentUser.value.userAward! / 10).toInt()
        else
          0
      ];
    } else {
      medalList.value = [0, 0, 0];
    }
  }
  
  Future<void> initCategory() async {
    initList.value = itemsmap.keys.toList();

    QueryData searchTeam =
        QueryData(categories: initList, partyName: "", page: "0");
    paryList.clear();
    print(json.encode(searchTeam.toMap()));

    const path = 'api/party/search';
    final response = await http.post(
      Uri.parse(
          'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080/$path'),
      body: json.encode(searchTeam.toMap()),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
        'Accept-Charset': 'utf-8',
      },
    );
    final responseJson =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
// jsonDecode(source)

    if (responseJson['data'].length > 0) {
      for (int i = 0; i < responseJson['data'].length; i++) {
        paryList.add(PartyResponseDto.fromJson(responseJson['data'][i]));
      }
      print(paryList);
    } else {}
  }

  Future<void> changedCategory() async {
    QueryData searchTeam =
        QueryData(categories: clickedlist, partyName: "", page: "0");
    paryList.clear();
    print(json.encode(searchTeam.toMap()));

    const path = 'api/party/search';
    final response = await http.post(
      Uri.parse(
          'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080/$path'),
      body: json.encode(searchTeam.toMap()),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
        'Accept-Charset': 'utf-8',
      },
    );
    final responseJson =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
// jsonDecode(source)

    if (responseJson['data'].length > 0) {
      for (int i = 0; i < responseJson['data'].length; i++) {
        paryList.add(PartyResponseDto.fromJson(responseJson['data'][i]));
      }
      print(paryList);
    } else {}
  }
}

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dockggu/component/response_popup.dart';
import 'package:dockggu/component/twobtn_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../controller/home_controller.dart';
import '../model/bookathoninfoDTO.dart';
import '../model/makebookathonDTO.dart';
import '../model/mypageDTO.dart';
import '../model/partyinfoDTO.dart';

var tttt = "";
var token = "";

class MainRepo {
// 본인 누군지 가져오는 함수
  static Future<UserDto> getCurrentUser() async {
    print("여기로 가져오나 ?${token}");
    const path = 'api/mypage/user';
    final response = await http.get(
      Uri.parse(
          'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080/$path'),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
        'Accept-Charset': 'utf-8',
      },
    );
    final responseJson =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return UserDto.fromJson(responseJson['data']['userDto']);
  }

  // 내가 읽은 책 리스트
  static Future<List<MyBookDto>> getMyBook() async {
    print("여기로 가져오나 ?${token}");
    List<MyBookDto> bookList = [];
    const path = 'api/mypage/user';
    final response = await http.get(
      Uri.parse(
          'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080/$path'),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
        'Accept-Charset': 'utf-8',
      },
    );
    final responseJson =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

    for (int i = 0; i < responseJson['data']['mybookDtoList'].length; i++) {
      bookList
          .add(MyBookDto.fromJson(responseJson['data']['mybookDtoList'][i]));
    }

    return bookList;
  }

  // 파티에서 진행한 모든 북커톤 가져오기
  // static Future<UserDto> getPartyBookathonList() async {

  //   return UserDto.fromJson(responseJson['data']['userDto']);
  // }

// 파티가입
  static Future<void> registerParty(int thisparty) async {
    var party = {"partyId": thisparty};
    const path = '/api/party/participant';
    final response = await http.post(
      Uri.parse(
          'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080$path'),
      body: json.encode(party),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
        'Accept-Charset': 'utf-8',
      },
    );
  }

  // 모임 멤버 불러오기

  static Future<List<PartyMembersDTO>> getPartyMembers(int thisparty) async {
    List<PartyMembersDTO> memberList = [];

    var path = '/api/party/partyInfo?partyId=$thisparty';
    final response = await http.post(
      Uri.parse(
          'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080$path'),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
        'Accept-Charset': 'utf-8',
      },
    );
    final responseJson =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

    for (int i = 0;
        i < responseJson['data']['partyUserListResponseDto'].length;
        i++) {
      memberList.add(PartyMembersDTO.fromJson(
          responseJson['data']['partyUserListResponseDto'][i]));
    }

    return memberList;
  }

  // 해당 모임에서 진행하고 있는 모든 북커톤 일정 불러오기
  static Future<List<BookathonDTO>> getAllBookathon(int thisparty) async {
    List<BookathonDTO> bookathonList = [];

    var path = '/api/bookerton/list?partyId=$thisparty&page=0';
    final response = await http.get(
      Uri.parse(
          'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080$path'),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
        'Accept-Charset': 'utf-8',
      },
    );
    final responseJson =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    for (int i = 0; i < responseJson['data'].length; i++) {
      bookathonList.add(BookathonDTO.fromJson(responseJson['data'][i]));
    }
    return bookathonList;
  }

  static Future<void> makeParty(File imageFile, String partyName,
      String partyIntro, String partyCategory, int partyUserMaxnum) async {
    var path = '/api/party/throw';

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080$path'),
      );
      request.headers['Authorization'] = 'Bearer $token';

      request.fields['partyName'] = partyName;
      request.fields['partyIntro'] = partyIntro;
      request.fields['partyCategory'] = partyCategory;
      request.fields['partyUserMaxnum'] = partyUserMaxnum.toString();

      request.files.add(
        await http.MultipartFile.fromPath('imgFile', imageFile.path,
            contentType: MediaType('image', 'jpg')),
      );

      final response = await request.send();

      if (response.statusCode == 200) {
        print('response.statusCode = ${response.statusCode}');

        print('파티 생성 성공');
        
      } else {
        print('파티 업로드 실패: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('오류 발생: $error');
    }
  }

  static Future<void> addThon(int partyId, String thonName, String startDate,
      String endtDate, int maxMember) async {
    var thondata = CreateBookertonRequest(
        partyId: partyId,
        bookertonName: thonName,
        bookertonStartDate: startDate,
        bookertonEndDate: endtDate,
        bookertonUserMaxnum: maxMember);

    // var party = {"partyId": thisparty};
    const path = '/api/bookerton/create';

    final response = await http.post(
      Uri.parse(
          'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080$path'),
      body: json.encode(thondata),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
        'Accept-Charset': 'utf-8',
      },
    );
    if (response.statusCode == 200) {
      showDialog(
          context: Get.context!,
          builder: (context) => ResponsePopup(
                content: "북커톤이 생성되었습니다.",
                yestext: "확인",
                okbtn: () async {
                  Navigator.pop(context);
                },
              ));
    }
  }

  static Future<void> participateThon(ParicipateBookathon data) async {
    // var party = {"partyId": thisparty};
    const path = '/api/bookerton/participant';

    final response = await http.post(
      Uri.parse(
          'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080$path'),
      body: json.encode(data),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
        'Accept-Charset': 'utf-8',
      },
    );
    if (response.statusCode == 200) {
      showDialog(
          context: Get.context!,
          builder: (context) => ResponsePopup(
                content: "북커톤에 참여하였습니다!",
                yestext: "확인",
                okbtn: () async {
                  Navigator.pop(context);
                },
              ));
    }
  }

  static Future<void> partyreport(int partyId) async {
    var party = {"partyId": partyId};
    const path = '/api/party/report';

    final response = await http.post(
      Uri.parse(
          'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080$path'),
      body: json.encode(party),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
        'Accept-Charset': 'utf-8',
      },
    );
  }

  static Future<void> blockMember(int partyId, int userId) async {
    var party = {"partyId": partyId, "userId": userId};
    const path = '/api/party/kick';

    final response = await http.post(
      Uri.parse(
          'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080$path'),
      body: json.encode(party),
      headers: {
        'Content-Type': 'application/json; charset=utf-8',
        'Authorization': 'Bearer $token',
        'Accept-Charset': 'utf-8',
      },
    );
  }

  static Future<void> deleteParty(int partyId, int partyMaster) async {
    var path = '/api/party/delete?partyId=$partyId&partyMaster=$partyMaster';

    try {
      final response = await http.post(
        Uri.parse(
            'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080$path'),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': 'Bearer $token',
          'Accept-Charset': 'utf-8',
        },
      );

      if (response.statusCode == 200) {
        print("삭제 성공");
        // Navigator.pop(Get.context!);
        Get.find<HomeContoller>().initCategory();
       

      
      } else {}
    } catch (error) {
      print('오류가 발생했습니다: $error');
    }
  }

  static Future<void> updateParty(int partyId,File imageFile, String partyName,
      String partyIntro, String partyCategory, int partyUserMaxnum) async {
    var path = '/api/party/update';

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080$path'),
      );
      request.headers['Authorization'] = 'Bearer $token';

      request.fields['partyName'] = partyName;
      request.fields['partyIntro'] = partyIntro;
      request.fields['partyCategory'] = partyCategory;
      request.fields['partyUserMaxnum'] = partyUserMaxnum.toString();

      request.files.add(
        await http.MultipartFile.fromPath('imgFile', imageFile.path,
            contentType: MediaType('image', 'jpg')),
      );

      final response = await request.send();

      if (response.statusCode == 200) {
        print('response.statusCode = ${response.statusCode}');

        print('파티 생성 성공');
        showDialog(
            context: Get.context!,
            builder: (context) => ResponsePopup(
                content: "모임이 수정되었습니다.",
                yestext: "확인",
                okbtn: () async {
                  Navigator.pop(context);
                }));
      } else {
        print('파티 업로드 실패: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('오류 발생: $error');
    }
  }
}

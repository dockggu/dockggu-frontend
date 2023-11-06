import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/bookathoninfoDTO.dart';
import '../model/makebookathonDTO.dart';
import '../model/mypageDTO.dart';
import '../model/partyinfoDTO.dart';

const token =
    'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMyIsImlhdCI6MTY5OTExNDA2MywiZXhwIjoxNjk5NDc0MDYzfQ.VYbYWqcNyCw39g9GEce05jNfnTvVP7ofOKH1k8I9eujCK-v7GnElhHMpm_OYTuW4KVZQuwZy2bz0U7UBLhBH3w';

class MainRepo {
// 본인 누군지 가져오는 함수
  static Future<UserDto> getCurrentUser() async {
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

    print(response.body);
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

      // 다른 필드 추가
      request.fields['partyName'] = partyName;
      request.fields['partyIntro'] = partyIntro;
      request.fields['partyCategory'] = partyCategory;
      request.fields['partyUserMaxnum'] = partyUserMaxnum.toString();

      // 이미지 파일 추가
      request.files.add(
        await http.MultipartFile.fromPath(
          'imgFile',
          imageFile.path,
        ),
      );
      // print(request.files);

      final response = await request.send();

      if (response.statusCode == 200) {
        // 성공적으로 업로드된 경우
        print('response.statusCode = ${response.statusCode}');

        print('파티 생성 성공');
      } else {
        // 업로드 실패한 경우
        print('파티 업로드 실패: ${response.reasonPhrase}');
      }
    } catch (error) {
      // 예외 처리
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
    print(json.encode(thondata));
    print(response.body);
  }
}

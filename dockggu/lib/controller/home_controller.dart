import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeContoller extends GetxController {

final RxMap<String, String> itemsmap = {
    'bc0001': '📚 전체',
    'bc0002': '🕵🏻‍♂️ 소설',
    'bc0003': '📕 에세이',
    'bc0004': '🗺 여행',
    'bc0005': '👤 인문학',
    'bc0006': '🎨 디자인',
    'bc0007': '🧐 철학',
    'bc0008': '🗿 역사',
    'bc0009': '🎫 예술/문화',
    'bc0010': '📈 경제/경영',
    'bc0011': '👩🏻‍⚖️ 사회/정치',
    'bc0012': '✍🏻 시',
    'bc0013': '🛍 라이프스타일',
    'bc0014': '🏗 건축',
    'bc0015': '🧬 과학',
    'bc0016': '🖥 컴퓨터/IT',
    'bc0017': '💪 건강/운동',
    'bc0018': '👨🏻‍💻 자기계발',
    'bc0019': '💵 재테크',
    'bc0020': '📱 마케팅'
  }.obs;
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

  Future<void> changedCategory() async {
    const token =
        'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNjk4NjQzOTMwLCJleHAiOjE2OTg2NDc1MzB9.XslVzLWQ_nFQa7_YmgPt7zK4BfqH1IzIcjpaJLo6lvAdj5_GugE9fxXqJtvqC7otTr83L1ZTj8mQDJ0quwNRRg';
    const path = 'api/party/search';
    final response = await http.post(
      Uri.parse(
          'http://ec2-16-16-217-214.eu-north-1.compute.amazonaws.com:8080/$path'),
          body: {},
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
    print(responseJson);

  }
}

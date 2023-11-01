import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/mypageDTO.dart';

class MainRepo {
  final token =
      'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNjk4NjQzOTMwLCJleHAiOjE2OTg2NDc1MzB9.XslVzLWQ_nFQa7_YmgPt7zK4BfqH1IzIcjpaJLo6lvAdj5_GugE9fxXqJtvqC7otTr83L1ZTj8mQDJ0quwNRRg';

  Future<void> getUserInf() async {
    // 헤더에 로그인 토큰 주고 데이터 불러오기 샘플
  }

  static Future<UserDto> getCurrentUser() async {
    const token =
        'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNjk4NzYzOTM3LCJleHAiOjE2OTkxMjM5Mzd9.EcSP0CkJ9YlnOrsQu6bmLWpVswQ_OnaVclxMq02bSnVSmbidaFWWy29F5MBB9EvgeZrk_-h0MQq9ont48vtIdg';
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
}

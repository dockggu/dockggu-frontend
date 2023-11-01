import 'dart:convert';

import 'package:http/http.dart' as http;

class MainRepo {
  final token =
      'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIzIiwiaWF0IjoxNjk4NjQzOTMwLCJleHAiOjE2OTg2NDc1MzB9.XslVzLWQ_nFQa7_YmgPt7zK4BfqH1IzIcjpaJLo6lvAdj5_GugE9fxXqJtvqC7otTr83L1ZTj8mQDJ0quwNRRg';
      

  Future<void> getUserInf() async {
    // 헤더에 로그인 토큰 주고 데이터 불러오기 샘플

    const path = 'api/mypage/user';
    final response = await http.get(
      Uri.parse(
          'http://ec2-16-16-217-214.eu-north-1.compute.amazonaws.com:8080/$path'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
    print(responseJson);
  }
}

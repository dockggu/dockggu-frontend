import 'dart:convert';

import 'package:dockggu/controller/home_controller.dart';
import 'package:dockggu/model/mypageDTO.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../controller/team_controller.dart';
import 'main_repo.dart';

class UserRepo {
  static Future<void> signUp(SignUpDTO signupdata) async {
    const path = '/api/auth/signUp';
    // final response = await http.post(
    //   Uri.parse(
    //       'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080$path'),
    //   body: json.encode(signupdata),
    //   headers: {
    //     'Content-Type': 'application/json; charset=utf-8',
    //     'Authorization': 'Bearer $token',
    //     'Accept-Charset': 'utf-8',
    //   },
    // );

    // print(response.body);
    final url = Uri.parse(
        'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080$path');

    try {
      final response = await http.post(
        url,
        body: json.encode(signupdata),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': 'Bearer $token',
          'Accept-Charset': 'utf-8',
        },
      );

      if (response.statusCode == 200) {
        // 성공적인 응답 처리
        final responseData = json.decode(response.body);
        // responseData를 가지고 원하는 동작 수행
      } else {
        // 서버로부터 오류 응답을 받은 경우
        print("요청 실패: ${response.statusCode}");
        // 오류 처리 로직을 추가할 수 있습니다.
      }
    } catch (e) {
      // 네트워크 연결 또는 다른 예외 상황 처리
      print("오류 발생: $e");
      // 오류 처리 로직을 추가할 수 있습니다.
    }
  }

  static Future<void> gologin(LoginDTO logindata) async {
    const path = '/api/auth/signIn';

    // print(response.body);
    final url = Uri.parse(
        'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080$path');

    try {
      final response = await http.post(
        url,
        body: json.encode(logindata),
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'Authorization': 'Bearer $token',
          'Accept-Charset': 'utf-8',
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        token = responseData["data"]["token"];
        Get.put(HomeContoller());
        Get.find<HomeContoller>().currentUser.value =
            await MainRepo.getCurrentUser();

        Get.find<HomeContoller>().initCategory();
        Get.find<HomeContoller>().medalFunc();
      } else {
        print("요청 실패: ${response.statusCode}");
      }
    } catch (e) {
      print("오류 발생: $e");
    }
  }
}


import 'package:dockggu/model/bookathoninfoDTO.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../repogistory/main_repo.dart';

class BookUpdateController extends GetxController {
  var updateSuccess = false.obs;
  // ...

  Future<void> updateBookPage(int? bookertonId, String bookReadPage) async {
    final String apiUrl = 'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080/api/bookerton/updatePage'; // API 엔드포인트를 여기에 입력
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token', // 인증 토큰을 여기에 입력
    };

    // BookUpdateModel을 사용하여 데이터 준비
    final BookUpdateModel updateData = BookUpdateModel(
      bookertonId: bookertonId,
      bookReadPage: bookReadPage,
    );

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(updateData.toJson()), // 모델을 JSON 문자열로 변환
      );

      if (response.statusCode == 200) {
        updateSuccess.value = true;
        print('책 페이지 업데이트 성공.');
        // 성공한 경우 추가 작업 수행
        update();
      } else {
        updateSuccess.value = false;
        print('책 페이지 업데이트 실패. 상태 코드: ${response.statusCode}');
        // 실패한 경우 오류 처리
      }
    } catch (e) {
      updateSuccess.value = false;
      print('책 페이지 업데이트 오류: $e');
      // 오류 발생 시 처리
    }
  }
}
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../model/bookathoninfoDTO.dart';

class MyBookController extends GetxController {
  final _myBookList = <MyBookDto>[].obs;
  List<MyBookDto> get myBookList => _myBookList;

  Future<void> fetchMyBookData(int bookertonId) async {
    final baseUrl = 'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080';
    final path = '/api/bookerton/userList';

    final url = Uri.parse('$baseUrl$path?bookertonId=$bookertonId');

    final headers = {
      'Authorization':
      'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIxMyIsImlhdCI6MTY5OTQzNjYwNiwiZXhwIjoxNjk5Nzk2NjA2fQ.ibmLuZSETf8L_7gAbSUCi8oIMg4IfqmJExLUItF96NvpohbBu1w_eNLsQy263Mjcn6iJO5rnm1T_nJhxIuaOaA', 
    };

    try {
      final response = await get(url, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = json.decode(utf8.decode(response.bodyBytes));
        final myBookData = jsonData['data']['mybookDtoList'];

        _myBookList.value = (myBookData as List)
            .map((data) => MyBookDto.fromJson(data as Map<String, dynamic>))
            .toList();
            print(_myBookList);

        update();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

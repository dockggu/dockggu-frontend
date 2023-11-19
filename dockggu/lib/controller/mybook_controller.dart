import 'package:dockggu/controller/home_controller.dart';
import 'package:dockggu/model/bookertonUserDTO.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'dart:convert';
import '../model/bookathoninfoDTO.dart';
import '../repogistory/main_repo.dart';

class MyBookController extends GetxController {
  var controller = Get.put(HomeContoller());
  final _myBookList = <MyBookDto>[].obs;
  List<MyBookDto> get myBookList => _myBookList;

  final _userList = <UserListResponseDto>[].obs;
  List<UserListResponseDto> get userList => _userList;

  final Map<int, int> _bookReadPages = {};
  final Map<int, int> _bookTotalPages = {};

  int? getBookReadPage(int bookertonId) => _bookReadPages[bookertonId];
  int? getBookTotalPage(int bookertonId) => _bookTotalPages[bookertonId];

  Future<void> fetchMyBookData(int bookertonId) async {
    final baseUrl =
        'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080';
    final path = '/api/bookerton/userList';

    final url = Uri.parse('$baseUrl$path?bookertonId=$bookertonId');

    final headers = {
      'Authorization': 'Bearer $token',
    };

    try {
      final response = await get(url, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = json.decode(utf8.decode(response.bodyBytes));
        final myBookData = jsonData['data']['mybookDtoList'];

        _myBookList.value = (myBookData as List)
            .map((data) => MyBookDto.fromJson(data as Map<String, dynamic>))
            .toList();

        final userData = jsonData['data']['userListResponseDtoList'];
        _userList.value = (userData as List)
            .map((data) =>
                UserListResponseDto.fromJson(data as Map<String, dynamic>))
            .toList();

        for (MyBookDto book in _myBookList) {
          _bookReadPages[book.bookertonId!] = book.bookReadPage ?? 0;
          _bookTotalPages[book.bookertonId!] = book.bookTotalPage ?? 0;
        }

        update();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

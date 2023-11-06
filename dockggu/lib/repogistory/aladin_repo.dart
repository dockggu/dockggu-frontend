import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/bookathoninfoDTO.dart';

class AladinRepo {
  static Future<List<Book>> searchBook(String keyword) async {
    List<Book> resultList = [];
    const path = 'api/mypage/user';
    final response = await http.get(
      Uri.parse(
          'http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?TTBkey=ttbwhdgnsqwe1240001&Query=$keyword&Output=JS&Version=20131101'),
    );
    final responseJson =
        jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;

    for (int i = 0; i < responseJson['item'].length; i++) {
      resultList.add(Book(
          title: responseJson['item'][i]['title'],
          author: responseJson['item'][i]['author'],
          pubDate: responseJson['item'][i]['pubDate'],
          cover: responseJson['item'][i]['cover'],
          categoryId: responseJson['item'][i]['categoryId'],
          categoryName: responseJson['item'][i]['categoryName'],
          publisher: responseJson['item'][i]['publisher']));
    }
    return resultList;
  }
}

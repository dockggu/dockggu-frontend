import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../model/bookathoninfoDTO.dart';
import '../repogistory/main_repo.dart';

class BookertonController extends GetxController {
  // final _bookertonList = <BookathonDTO>[].obs;
  // List<BookathonDTO> get bookertonList => _bookertonList;

  RxList bookertonList = [].obs;

  // void onInit() async {
  //   await fetchBookertonData(1, 1);
  // }

  Future<void> fetchBookertonData(int partyId, int page) async {
    final baseUrl =
        'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080';
    final path = '/api/bookerton/list';

    final url = Uri.parse('$baseUrl$path?partyId=$partyId&page=$page');

    final headers = {
      'Authorization':
          'Bearer $token',
    };

    try {
      final response = await get(url, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = json.decode(utf8.decode(response.bodyBytes));
        final bookertonData = jsonData['data'];

        bookertonList.value = (bookertonData as List)
            .map((data) => BookathonDTO.fromJson(data as Map<String, dynamic>))
            .toList();
        print(bookertonList);

        update();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}

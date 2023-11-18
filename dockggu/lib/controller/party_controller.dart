import 'dart:convert';
import 'package:dockggu/model/partyinfoDTO.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../repogistory/main_repo.dart';

class PartyController extends GetxController {
  var partyList = <PartyResponseDto>[].obs;

  // List<PartyResponseDto> get partyList => partyList;

  Future<void> fetchPartyList() async {
    final baseUrl =
        'http://ec2-51-20-35-25.eu-north-1.compute.amazonaws.com:8080';
    final path = '/api/party/partyList';

    final url = Uri.parse('$baseUrl$path');

    final headers = {
      'Authorization':
          'Bearer $token',
    };

    try {
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final jsonData = json.decode(utf8.decode(response.bodyBytes));
        final List<dynamic>? partyData = jsonData['data'];

        if (partyData != null) {
          partyList.value =
              partyData.map((data) => PartyResponseDto.fromJson(data)).toList();
        } else {
          // "data" 필드가 null인 경우 빈 목록으로 처리
          partyList.value = [];
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

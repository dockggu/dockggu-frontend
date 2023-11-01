import 'package:dockggu/page/login_main.dart';
import 'package:dockggu/page/tabview.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginMain()
    );
  }
}
// 파라미터로 요청해서 get으로 받아오기

// Future<WeatherResponse> getWeatherDataFromLocation() async {
//     final params = {
//       "lat": "35",
//       "lon": "139",
//       "appid": ""
//     };

//     final response = await http.get(
//       Uri.https("api.openweathermap.org", "/data/2.5/weather", params),
//     );

//     if (response.statusCode == 200) {
//       log(response.body.toString());

//       return WeatherResponse.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('FAIL');
//     }

import 'package:dockggu/page/tabview.dart';
import 'package:dockggu/page/test.dart';
import 'package:dockggu/page/test2.dart';
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
      home: TabView()
    );
  }
}

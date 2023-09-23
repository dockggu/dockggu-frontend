import 'package:flutter/material.dart';

import '../component/mypage_widget.dart';
import '../component/profile_widget.dart';

class Mypage1 extends StatelessWidget {
  const Mypage1({super.key});

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        '마이페이지',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      ),
    );
  }

  Widget _profile() {
    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          a(),
          Column(
            children: [
              b(),
              c(),
            ],
          ),
          d(),
        ],
      ),
    );
  }

  Widget _center() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text('📖 읽은 책들',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600
      ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [_header(), _profile(), _center(), GridViewWidget()],
      ),
    );
  }
}

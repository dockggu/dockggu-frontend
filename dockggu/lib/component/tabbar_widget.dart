import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicator: BoxDecoration(
        color: Color(0xffFFD66C).withOpacity(0.57),
        borderRadius: BorderRadius.circular(20.0),
      ),
      indicatorPadding: EdgeInsets.symmetric(horizontal: 56.0, vertical: 8.0),
      labelColor: Color(0xff000000),
      labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      tabs: [
        Tab(
          text: '홈',
          height: 50,
        ),
        Tab(
          text: '북커톤',
          height: 50,
        ),
      ],
    );
  }
}
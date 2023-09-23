import 'package:dockggu/page/bookathon_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InProgressWidget extends StatelessWidget {
  String date;
  String dday;
  String duration;
  String progress;

  InProgressWidget({
    super.key,
    this.date = '9/16 (토)',
    this.dday = 'D-5',
    this.duration = '날짜 : 9/16 ~ 9/23 (1주)',
    this.progress = '독서 진행률: 90%',
  });

  Widget _header() {
    return Row(
      children: [
        Text(
          '$date',
          style: TextStyle(
              fontSize: 16,
              color: Color(0xff000000),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          '$dday',
          style: TextStyle(
            fontSize: 16,
            color: Color(0xffFF0404),
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _duration() {
    return Text(
      '$duration',
      style: TextStyle(
        fontSize: 14,
        color: Color(0xff000000),
        fontWeight: FontWeight.normal,
      ),
    );
  }

    Widget _progress() {
    return Text(
      '$progress',
      style: TextStyle(
        fontSize: 14,
        color: Color(0xff000000),
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget _state() {
    return Container(
      width: 80,
      height: 40,
      child: Center(
        child: Text(
          '참여중',
          style: TextStyle(
              color: Color(0xffFFFFFF),
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffFFD66C),
      ),
    );
  }

  Widget _inprogressWidget() {
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _header(),
                  SizedBox(
                    height: 20,
                  ),
                  _duration(),
                  SizedBox(
                    height: 5,
                  ),
                  _progress(),
                ],
              ),
              SizedBox(
                width: 90,
              ),
              _state(),
            ],
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(BookatghonDetail());
      },
      child: _inprogressWidget()
    );
  }
}

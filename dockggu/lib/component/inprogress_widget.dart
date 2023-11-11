import 'package:dockggu/controller/mybook_controller.dart';
import 'package:dockggu/page/bookathon_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InProgressWidget extends StatelessWidget {
  final int? currentUserId;
  final int? bookertonId;
  final int? partyId;
  final int? userId;
  final String? bookertonName;
  final String? bookertonStartDate;
  final String? bookertonEndDate;
  final int? bookertonUserNum;
  final int? bookertonUserMaxnum;
  final String? bookertonStatus;
  final String? bookertonCreationTime;
  // final int? bookTotalPage;
  // final int? bookReadPage;

  InProgressWidget({
    super.key,
    this.currentUserId,
    this.bookertonId,
    this.partyId,
    this.userId,
    this.bookertonName,
    this.bookertonStartDate,
    this.bookertonEndDate,
    this.bookertonUserNum,
    this.bookertonUserMaxnum,
    this.bookertonStatus,
    this.bookertonCreationTime,
    // this.bookReadPage,
    // this.bookTotalPage
  });
  final MyBookController myBookController = Get.put(MyBookController());

  Widget _header() {
    DateTime startDate = DateTime.parse(bookertonStartDate ?? '');
    DateTime endDate = DateTime.parse(bookertonEndDate ?? '');
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MM/dd (E)', 'ko_KR').format(startDate);
    Duration difference = endDate.difference(now);
    int dDay = endDate.isBefore(now) ? 0 : difference.inDays;

    return Row(
      children: [
        Text(
          '$formattedDate',
          style: TextStyle(
              fontSize: 16,
              color: Color(0xff000000),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          'D-$dDay',
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
    DateTime startDate = DateTime.parse(bookertonStartDate ?? '');
    DateTime endDate = DateTime.parse(bookertonEndDate ?? '');
    String formattedStartDate = DateFormat('MM/dd', 'ko_KR').format(startDate);
    String formattedEndDate = DateFormat('MM/dd', 'ko_KR').format(endDate);

    Duration difference = endDate.difference(startDate);
    int weeksDifference = (difference.inDays / 7).ceil();

    return Text(
      '날짜: $formattedStartDate ~ $formattedEndDate ($weeksDifference주일)',
      style: TextStyle(
        fontSize: 14,
        color: Color(0xff000000),
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget _progress() {
    int? bookReadPage = myBookController.getReadPageForUser(currentUserId?? 0);
    int? bookTotalPage = myBookController.getTotalPageForUser(currentUserId?? 0);
    // double progressPercentage =
    //     (bookReadPage ?? 0) / (bookTotalPage ?? 1) * 100;
    return Text(
      // '독서 진행률: ${progressPercentage.toStringAsFixed(0)}%',
      '독서 진행률: $currentUserId%',
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
            Expanded(
              child: SizedBox(width: 90), // 고정 너비
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
        onTap: () {
          Get.to(BookatghonDetail(currentBookertonId: bookertonId));
        },
        child: _inprogressWidget());
  }
}

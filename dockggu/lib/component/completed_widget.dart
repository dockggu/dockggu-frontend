import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CompletedWidget extends StatelessWidget {
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

  CompletedWidget({
    super.key,
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

  Widget _header() {
    DateTime startDate = DateTime.parse(bookertonStartDate ?? '');
    DateTime endDate = DateTime.parse(bookertonEndDate ?? '');
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MM/dd (E)', 'ko_KR').format(startDate);
    var a = bookertonName;
    return Text(
      '$a',
      style: TextStyle(
          fontSize: 16, color: Color(0xff000000), fontWeight: FontWeight.bold),
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
    DateTime now = DateTime.now();
    DateTime startDate = DateTime.parse(bookertonStartDate ?? '');
    DateTime endDate = DateTime.parse(bookertonEndDate ?? '');
    String formattedStartDate = DateFormat('MM/dd', 'ko_KR').format(startDate);
    String formattedEndDate = DateFormat('MM/dd', 'ko_KR').format(endDate);
    double progress = (now.difference(startDate).inMilliseconds /
            endDate.difference(startDate).inMilliseconds) *
        100;
    String formattedProgress = progress.toStringAsFixed(2);
    var a = now.difference(startDate);
    var b = endDate.difference(startDate);
    return Text(
      '진행률: 100%',
      style: TextStyle(
        fontSize: 14,
        color: Color(0xff000000),
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget _banner() {
    return Container(
      width: 80,
      height: 40,
      child: Center(
        child: Text(
          '종료',
          style: TextStyle(
              color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Gesture Successfully Detected!');
      },
      child: Container(
        height: 120,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.grey[200],
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
                width: MediaQuery.of(context).size.width*0.2,
              ),
              _banner(),
            ],
          ),
        ),
      ),
    );
  }
}

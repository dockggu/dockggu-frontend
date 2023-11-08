import 'package:flutter/material.dart';

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

  CompletedWidget(
      {super.key,
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
    return Text(
      'date',
      style: TextStyle(
          fontSize: 16, color: Color(0xff000000), fontWeight: FontWeight.bold),
    );
  }

  Widget _duration() {
    return Text(
      'duration',
      style: TextStyle(
        fontSize: 14,
        color: Color(0xff000000),
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget _progress() {
    return Text(
      'progress',
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
          '참여완료',
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
                width: 90,
              ),
              _banner(),
            ],
          ),
        ),
      ),
    );
  }
}

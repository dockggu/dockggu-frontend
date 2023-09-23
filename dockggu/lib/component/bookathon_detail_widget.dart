import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'profile_widget.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      margin: EdgeInsets.only(top: 20),
      height: 150,
      child: Center(
        child: Image.asset(
          'assets/book.png',
          height: 100,
          width: 80,
        ),
      ),
    );
  }
}

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      width: MediaQuery.of(context).size.width * 0.55,
      margin: EdgeInsets.only(top: 20),
      height: 150,
      child: Column(
        children: [
          Container(
            child: FractionallySizedBox(
                child: ProfileWidget(
              thumbPath:
                  'https://images.mypetlife.co.kr/content/uploads/2023/01/03112035/bay._.curry_thumnail.png',
              size: 40,
              type: ProfileType.TYPE3,
              nickname: "Kancho",
            ),
            ),
            alignment: FractionalOffset(0.9, 1 - 0.9),
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            percent: 0.9,
            lineHeight: 10,
            barRadius: Radius.circular(10),
            progressColor: Color(0xffFFC100),
            backgroundColor: Color(0xffBBBBBB),
          ),
        ],
      ),
    );
  }
}

class PercentWidget extends StatelessWidget {
  const PercentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width * 0.15,
      margin: EdgeInsets.only(top: 20),
      height: 150,
      child: Text('90%',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 20,
          child: Text(
            '눈에 갇힌 외딴 산장에서',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../page/bookathon_detail.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProceedingBanner extends StatelessWidget {
  const ProceedingBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BookathonDetail(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '9/16 (토)',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'D-5',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xffFF0404),
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '날짜 : 9/16 ~ 9/23 (1주)',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '독서 진행률: 90%',
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff000000),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Container(
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}

class CompleteBanner extends StatelessWidget {
  const CompleteBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
                          margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                            Text(
                                              '8/23 (수)',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color(0xff000000),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          '날짜 : 9/16 ~ 9/23 (1주)',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff000000),
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text('독서 진행률: 90%',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff000000),
                                          fontWeight: FontWeight.normal,
                                        ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 80,
                                    ),
                                    Container(
                                      width: 80,
                                      height: 40,
                                      child: Center(
                                        child: Text(
                                          '참여완료',
                                          style: TextStyle(
                                              color: Color(0xff999999),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
  }
}

class ProgressBanner extends StatelessWidget {
  const ProgressBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double percent = 0.9;
    return Column(
                      children: [
                        Container(
                          height: 120,
                          child: Row(
                            children: [
                              Container(
                                child: Image.asset('assets/book.png'),
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                                child: Column(
                                  children: [
                                    Container(
                                      child: FractionallySizedBox(
                                        child: Column(
                                          children: [
                                            Text(
                                              '명탐정 코난',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xff000000),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Image.asset(
                                                'assets/profile_image.png',
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.cover),
                                          ],
                                        ),
                                      ),
                                      alignment: FractionalOffset(
                                          percent, 1 - percent),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: LinearPercentIndicator(
                                        padding: EdgeInsets.zero,
                                        percent: percent,
                                        lineHeight: 10,
                                        backgroundColor: Color(0xffBBBBBB),
                                        progressColor: Color(0xffFFC100),
                                        barRadius: Radius.circular(5),
                                      ),
                                    ),
                                  ],
                                ),
                                width: MediaQuery.of(context).size.width * 0.55,
                              ),
                              Container(
                                height: 150,
                                padding: EdgeInsets.fromLTRB(0, 98, 10, 0),
                                child: Text(
                                  '90%',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.15,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 0, 5),
                          child: Container(
                            alignment: FractionalOffset(0, 0),
                            child: Text(
                              '눈에 갇힌 외딴 산장에서',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
  }
}

class HeaderTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
      child: Container(
        child: Text(
          '다함께 완독해요! 📖',
          style: TextStyle(
            fontSize: 24,
            color: Color(0xff000000),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}



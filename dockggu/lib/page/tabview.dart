import 'package:flutter/material.dart';
import 'bookathon_detail.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(TabView());
}

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Color(0xffFFFFFF),
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color(0xff000000),
                size: 16.0,
              ),
              onPressed: () {},
            ),
            title: Align(
              alignment: Alignment(-1.2, 0),
              child: Text(
                '베이커가 221B번지', //DB에서 불러오기
                style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: 20.0,
                ),
              ),
            ),
            backgroundColor: Color(0xffFFFFFF),
            elevation: 0.0,
          ),
          body: Column(
            children: [
              TabBar(
                  indicator: BoxDecoration(
                    color: Color(0xffFFD66C).withOpacity(0.57),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  indicatorPadding:
                      EdgeInsets.symmetric(horizontal: 56.0, vertical: 8.0),
                  labelColor: Color(0xff000000),
                  labelStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  tabs: [
                    Tab(
                      text: '홈',
                      height: 50,
                    ),
                    Tab(
                      text: '게시판',
                      height: 50,
                    ),
                  ]),
              Expanded(
                  child: TabBarView(children: [
                Container(
                  width: 10,
                  color: Color(0xffFFFFFF),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/google_login.svg',
                    ),
                  ),
                ),
                ListView.builder(
                    key: PageStorageKey('PageStorage'),
                    itemCount: 2,
                    itemBuilder: (context, idx) {
                      if (idx == 1) return Container(
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
                    }),
              ]))
            ],
          )),
    );
  }
}

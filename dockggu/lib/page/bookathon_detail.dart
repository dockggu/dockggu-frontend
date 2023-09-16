import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(BookathonDetail());
}

class BookathonDetail extends StatelessWidget {
  const BookathonDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Widget ProgressBar() {
      double percent = 0.8;
      return Column(
        children: [
          Container(
            alignment: FractionalOffset(percent, 1 - percent),
            child: FractionallySizedBox(
                child: SvgPicture.asset('assets/google_login.svg',
                    width: 30, height: 30, fit: BoxFit.cover)),
          ),
          LinearPercentIndicator(
            padding: EdgeInsets.zero,
            percent: percent,
            lineHeight: 10,
            backgroundColor: Colors.black38,
            progressColor: Colors.indigo.shade900,
            width: MediaQuery.of(context).size.width,
          )
        ],
      );
    }

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
                    child: Text(
                      'Box',
                      style: TextStyle(
                          color: Color(0xff000000),
                          fontSize: 56,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListView.separated(
                  key: PageStorageKey('PageStorage'),
                  itemCount: 3,
                  itemBuilder: (BuildContext ctx, int idx) {
                    if (idx == 0) return HeaderTile();
                    return Container(
                        child: ProgressBar()
                        );
                  },
                  separatorBuilder: (BuildContext ctx, int idx) {
                    if (idx == 0) return Divider(color: Colors.transparent);
                    return Divider();
                  },
                )
              ]))
            ],
          )),
    );
  }
}

class HeaderTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text(
          '다함께 완독해요! 📖',
          style: TextStyle(
            fontSize: 26,
            color: Color(0xff000000),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

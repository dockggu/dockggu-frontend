import 'package:dockggu/app.dart';
import 'package:flutter/material.dart';
import 'bookathon_detail.dart';
import 'home.dart';
import 'package:dockggu/page/group_home.dart';
import 'package:dockggu/component/bookathon_banner.dart';
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
              onPressed: () {
                Navigator.pop(context);

              },
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
                      text: '북커톤',
                      height: 50,
                    ),
                  ]),
              Expanded(
                  child: TabBarView(children: [
                GroupHome(),
                ListView.builder(
                    key: PageStorageKey('PageStorage'),
                    itemCount: 2,
                    itemBuilder: (context, idx) {
                      if (idx == 1) return CompleteBanner();
                      return ProceedingBanner();
                    }),
              ]))
            ],
          )),
    );
  }
}

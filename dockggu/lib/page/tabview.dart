import 'package:dockggu/component/appbar_widget.dart';
import 'package:dockggu/page/group_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/completed_widget.dart';
import '../component/inprogress_widget.dart';

class TabView extends StatelessWidget {
  const TabView({super.key});

  Widget _tabbarWidget() {
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

  Widget _groupHome() {
    return Center(
      child: GroupHome(),
    );
  }

  Widget _bookathonList() {
    return ListView.builder(
        key: PageStorageKey('PageStorage'),
        itemCount: 4,
        itemBuilder: (context, idx) {
          if (idx == 0) return InProgressWidget();
          return CompletedWidget();
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget(appBar: AppBar(), title: '베이커가 221B번지'),
        body: Column(
          children: [
            _tabbarWidget(),
            Expanded(
              child: TabBarView(
                children: [
                  _groupHome(),
                  _bookathonList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

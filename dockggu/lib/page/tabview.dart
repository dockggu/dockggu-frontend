// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:dockggu/component/appbar_widget.dart';
import 'package:dockggu/controller/bookerton_controller.dart';
import 'package:dockggu/controller/home_controller.dart';
import 'package:dockggu/controller/mybook_controller.dart';
import 'package:dockggu/model/mypageDTO.dart';
import 'package:dockggu/page/group_home.dart';
import 'package:dockggu/repogistory/main_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/completed_widget.dart';
import '../component/inprogress_widget.dart';
import '../controller/team_controller.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  final BookertonController bookertonController =
      Get.put(BookertonController());
  final MyBookController myBookController = Get.put(MyBookController());

  var controller = Get.put(TeamController());
  var home_controller = Get.put(HomeContoller());

  @override
  void initState() {
    super.initState();
    bookertonController.fetchBookertonData(
        controller.currentTeam.value.partyId!, 1);
  }

  Widget _tabbarWidget() {
    return TabBar(
      indicator: BoxDecoration(
        color: Color(0xffFFD66C).withOpacity(0.57),
        borderRadius: BorderRadius.circular(20.0),
      ),
      indicatorPadding: EdgeInsets.symmetric(horizontal: 56.0, vertical: 8.0),
      labelColor: Color(0xff000000),
      labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
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
    var currentUserId = home_controller.currentUser.value.userId;
    return Obx(() => ListView.builder(
        key: PageStorageKey('PageStorage'),
        itemCount: bookertonController.bookertonList.length,
        itemBuilder: (context, index) {
          if (bookertonController.bookertonList[index].bookertonStatus == 'A')
            return InProgressWidget(
              currentUserId: currentUserId,
              bookertonId: bookertonController.bookertonList[index].bookertonId,
              partyId: bookertonController.bookertonList[index].partyId,
              userId: bookertonController.bookertonList[index].userId,
              bookertonName:
                  bookertonController.bookertonList[index].bookertonName,
              bookertonStartDate:
                  bookertonController.bookertonList[index].bookertonStartDate,
              bookertonEndDate:
                  bookertonController.bookertonList[index].bookertonEndDate,
              bookertonUserNum:
                  bookertonController.bookertonList[index].bookertonUserNum,
              bookertonUserMaxnum:
                  bookertonController.bookertonList[index].bookertonUserMaxnum,
              bookertonStatus:
                  bookertonController.bookertonList[index].bookertonStatus,
              bookertonCreationTime: bookertonController
                  .bookertonList[index].bookertonCreationTime,
              isProgress: bookertonController.bookertonList[index].isProgress,
            );
          return CompletedWidget(
            partyId: bookertonController.bookertonList[index].partyId,
            userId: bookertonController.bookertonList[index].userId,
            bookertonName:
                bookertonController.bookertonList[index].bookertonName,
            bookertonStartDate:
                bookertonController.bookertonList[index].bookertonStartDate,
            bookertonEndDate:
                bookertonController.bookertonList[index].bookertonEndDate,
            bookertonUserNum:
                bookertonController.bookertonList[index].bookertonUserNum,
            bookertonUserMaxnum:
                bookertonController.bookertonList[index].bookertonUserMaxnum,
            bookertonStatus:
                bookertonController.bookertonList[index].bookertonStatus,
            bookertonCreationTime:
                bookertonController.bookertonList[index].bookertonCreationTime,
            // bookTotalPage: myBookController.myBookList[index].bookTotalPage,
            // bookReadPage: myBookController.myBookList[index].bookReadPage,
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarWidget(
            appBar: AppBar(), title: controller.currentTeam.value.partyName!),
        body: Column(
          children: [
            _tabbarWidget(),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
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

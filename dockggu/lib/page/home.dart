import 'package:dockggu/component/category_widget.dart';
import 'package:dockggu/component/group_widget.dart';
import 'package:dockggu/component/main_category.dart';
import 'package:dockggu/controller/home_controller.dart';
import 'package:dockggu/controller/team_controller.dart';
import 'package:dockggu/page/addgroup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../repogistory/main_repo.dart';
import 'tabview.dart';

class Home extends GetView<HomeContoller> {
  Home({super.key});

  var controller = Get.put(HomeContoller());
  Widget _banner() {
    return Column(
      children: [
        const SizedBox(
          height: 70,
        ),
        Container(
          color: const Color(0xffFFF5DA),
          height: 110,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(() => Text(
                        '${controller.currentUser.value.userNickname} 님의 취향에 맞는 책 추천해드려요',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("AI 기반으로 찾아드려요"),
                  Row(
                    children: [
                      const SizedBox(
                        width: 170,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 110,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Color(0xffFFD66C)),
                        child: const Text(
                          '준비중',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                width: 25,
              ),
              const Text(
                '📚',
                style: TextStyle(fontSize: 45),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _searchParty() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 219, 218, 218)),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      width: Get.width * 0.9,
      height: 35,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              controller: controller.searchKeyword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "모임검색",
                  hintStyle: TextStyle(fontSize: 14)),
            ),
          ),
          GestureDetector(
              onTap: () async {
                controller.changedCategory();
              },
              child: Icon(
                Icons.search,
                color: Color.fromARGB(255, 192, 192, 192),
              )),
          SizedBox(
            width: 5,
          )
        ],
      ),
    );
  }

  Widget _bookathonTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '북커톤 🏃🏼',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '완독을 목표로 함께 달려봐요',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              SizedBox(
                width: 60,
              ),
              GestureDetector(
                  onTap: () {
                    if (controller.categoryopen.value) {
                      controller.categoryopen.value = false;
                    } else {
                      controller.categoryopen.value = true;
                    }
                  },
                  child: Text(
                    "+",
                    style: TextStyle(fontSize: 20),
                  )),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Widget _category() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Obx(() => Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            spacing: 8, // 좌우 간격
            runSpacing: 10, // 상하 간격
            children: List.generate(controller.itemsmap.values.toList().length,
                (index) {
              return GestureDetector(
                  onTap: () {
                    if (controller.clickedlist[index] == "") {
                      if (controller.itemsmap.keys.toList()[index] ==
                          "bc0000") {
                        controller.clickedlist.value =
                            controller.itemsmap.keys.toList();
                        controller.changedCategory();
                      } else {
                        controller.clickedlist[index] =
                            controller.itemsmap.keys.toList()[index];
                        controller.changedCategory();
                      }
                    } else {
                      if (controller.itemsmap.keys.toList()[index] ==
                          "bc0000") {
                        controller.clickedlist.value = [
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                          "",
                        ];

                        controller.changedCategory();
                      } else {
                        controller.clickedlist[0] = "";

                        controller.clickedlist[index] = '';
                        controller.changedCategory();
                      }
                    }
                  },
                  child: Column(
                    children: <Widget>[
                      if (controller.clickedlist[index] != "")
                        MainCategory(
                          categoryName:
                              controller.itemsmap.values.toList()[index],
                          type: CategoryType.CLICKED,
                        )
                      else
                        MainCategory(
                          categoryName:
                              controller.itemsmap.values.toList()[index],
                          type: CategoryType.UNCLICKED,
                        )
                    ],
                  ));
            }),
          )),
    );
  }

  Widget _groupList() {
    return Obx(() => Column(
          children: [
            SizedBox(
              height: 15,
            ),
            ...List.generate(
                controller.paryList.length,
                (index) => GestureDetector(
                      onTap: () async {
                        Get.put(TeamController());
                        Get.find<TeamController>().currentTeam.value =
                            controller.paryList[index];
                        await Get.find<TeamController>().getPartyMember();
                        await Get.find<TeamController>().isMembers();

                        await Get.find<TeamController>().getBookathonList();

                        Get.to(TabView())?.then((result) {
                          // 이곳에서 돌아왔을 때 처리할 로직
                          if (result == null) {
                            Get.delete<TeamController>();
                            // 반환된 데이터를 사용
                            print('ㅁㅇㄹㅁㄴ');
                          } else {
                            Get.delete<TeamController>();
                          }
                        });

                        Get.to(TabView());
                      },
                      child: Obx(() => GroupList(
                          teamName: controller.paryList.value[index].partyName!,
                          teaminfo:
                              controller.paryList.value[index].partyIntro!,
                          maxnum:
                              controller.paryList.value[index].partyUserMaxnum!,
                          currentNum:
                              controller.paryList.value[index].partyUserNum!,
                          category:
                              controller.paryList.value[index].partyCategory!)),
                    ))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: Get.height,
      child: Stack(children: [
        SingleChildScrollView(
          child: Obx(() => Column(
                children: [
                  _banner(),
                  _bookathonTitle(),
                  if (controller.categoryopen.value) _category(),
                  SizedBox(
                    height: 13,
                  ),
                  _searchParty(),
                  _groupList()
                ],
              )),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color(0xffFFD66C), shape: BoxShape.circle),
              width: 45,
              height: 45,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AddGroup()));
                },
                child: Text(
                  '+',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )),
        )
      ]),
    ));
  }
}

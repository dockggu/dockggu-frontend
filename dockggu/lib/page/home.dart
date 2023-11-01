import 'package:dockggu/component/category_widget.dart';
import 'package:dockggu/component/group_widget.dart';
import 'package:dockggu/component/main_category.dart';
import 'package:dockggu/controller/home_controller.dart';
import 'package:dockggu/page/addgroup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

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
                  const Text(
                    '이닛 님의 취향에 맞는 책 추천해드려요',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
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
                          '책 추천 받기 >',
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

  Widget _bookathonTitle() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
      child: Column(
        children: [
          const Row(
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
                      controller.clickedlist[index] =
                          controller.itemsmap.keys.toList()[index];
                      // controller.changedCategory();
                      print(controller.clickedlist);
                    } else {
                      controller.clickedlist[index] = '';
                      // controller.changedCategory();

                      print(controller.clickedlist);
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
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        ...List.generate(4, (index) => GroupList())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      SingleChildScrollView(
        child: Column(
          children: [_banner(), _bookathonTitle(), _category(), _groupList()],
        ),
      ),
      Positioned(
        bottom: 20,
        right: 20,
        child: Container(
            alignment: Alignment.center,
            decoration:
                BoxDecoration(color: Color(0xffFFD66C), shape: BoxShape.circle),
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
    ]));
  }
}

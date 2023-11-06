import 'package:dockggu/model/partyinfoDTO.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/makeParty_controller.dart';
import 'category_widget.dart';

class SelectCategory extends StatelessWidget {
  SelectCategory({super.key});
  var controller = Get.put(MakePartyController());



  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            // 창 둥글게
            borderRadius: BorderRadius.circular(20),
            child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width * 0.9,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          '책 장르 선택',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Wrap(
                          direction: Axis.horizontal, // 나열 방향
                          alignment: WrapAlignment.center, // 정렬 방식
                          spacing: 8, // 좌우 간격
                          runSpacing: 10, // 상하 간격
                          children: List.generate(
                              categoryMap!.values.toList().length, (index) {
                            return GestureDetector(
                                onTap: () {
                                  controller.categorycode.value =
                                      categoryMap!.keys.toList()[index];
                                  controller.category.value =
                                      categoryMap!.values.toList()[index];

                                  Navigator.pop(context);
                                },
                                child: CategoryWidget(
                                  categoryName:
                                      categoryMap!.values.toList()[index],
                                  fontsize: 12,
                                  height: 25,
                                ));
                          }),
                        ),
                      ],
                    ),
                    Positioned(
                        right: 5,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'x',
                            style: TextStyle(fontSize: 25),
                          ),
                        ))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

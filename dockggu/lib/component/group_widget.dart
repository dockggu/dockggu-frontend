import 'package:dockggu/component/category_widget.dart';
import 'package:dockggu/component/profile_widget.dart';
import 'package:dockggu/page/bookathon_detail.dart';
import 'package:dockggu/page/tabview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class GroupList extends StatelessWidget {
  String teamName;
  String teaminfo;
  int maxnum;
  int currentNum;
  String category;
  // String partyProfileImgPath;
  GroupList({
    super.key,
    required this.teamName,
    required this.teaminfo,
    required this.maxnum,
    required this.currentNum,
    required this.category,
    // required this.partyProfileImgPath
  });

  var controller = Get.put(HomeContoller());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xffFFD66C)))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: ProfileWidget(
                  thumbPath:
                      'https://health.chosun.com/site/data/img_dir/2023/07/17/2023071701753_0.jpg',
                  type: ProfileType.TYPE1,
                ),
              ),
              Container(
                // color: Colors.black,
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      teamName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      teaminfo,
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$currentNum / $maxnum',
                          style: TextStyle(color: Color(0xff9D9D9D)),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CategoryWidget(
                            categoryName: controller.itemsmap[category]!)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 28,
              ),
              SvgPicture.asset("assets/heart.svg")
            ],
          ),
        ),
      ),
    );
  }
}

class GroupList2 extends StatelessWidget {
  final int? partyId;
  final String? partyName;
  final String? partyIntro;
  final int? partyMaster;
  final String? partyCategory;
  final int? partyUserNum;
  final int? partyUserMaxnum;
  final String? partyCreationDate;
  final String? partyLink;
  final String? partyProfileImgName;
  final String? partyProfileImgPath;
  GroupList2({
    super.key,
    this.partyId,
    this.partyName,
    this.partyIntro,
    this.partyMaster,
    this.partyCategory,
    this.partyUserNum,
    this.partyUserMaxnum,
    this.partyCreationDate,
    this.partyLink,
    this.partyProfileImgName,
    this.partyProfileImgPath,
  });

  var controller = Get.put(HomeContoller());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0xffFFD66C)))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: ProfileWidget(
                  thumbPath:
                      'https://health.chosun.com/site/data/img_dir/2023/07/17/2023071701753_0.jpg',
                  type: ProfileType.TYPE1,
                ),
              ),
              Container(
                // color: Colors.black,
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$partyName',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '$partyIntro',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$partyUserNum / $partyUserMaxnum',
                          style: TextStyle(color: Color(0xff9D9D9D)),
                        ),
                        // SizedBox(
                        //   width: 40,
                        // ),
                        CategoryWidget(
                            categoryName: controller.itemsmap[partyCategory]!)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 28,
              ),
              SvgPicture.asset("assets/heart.svg")
            ],
          ),
        ),
      ),
    );
  }
}

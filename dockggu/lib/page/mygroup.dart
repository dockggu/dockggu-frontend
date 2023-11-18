import 'package:dockggu/controller/party_controller.dart';
import 'package:dockggu/page/tabview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/group_widget.dart';
import '../controller/team_controller.dart';

class MyGroup extends StatefulWidget {
  const MyGroup({super.key});

  @override
  State<MyGroup> createState() => _MyGroupState();
}

class _MyGroupState extends State<MyGroup> {
  final PartyController partyController = Get.put(PartyController());

  @override
  void initState() {
    super.initState();
    partyController.fetchPartyList();
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        '내 모임',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
    );
  }

  Widget _groupList() {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        ...List.generate(
            partyController.partyList.length,
            (index) => GestureDetector(
              onTap: () async {
                        Get.put(TeamController());
                        Get.find<TeamController>().currentTeam.value =
                            partyController.partyList[index];
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
              child: GroupList2(
                    partyId: partyController.partyList[index].partyId,
                    partyName: partyController.partyList[index].partyName,
                    partyIntro: partyController.partyList[index].partyIntro,
                    partyMaster: partyController.partyList[index].partyMaster,
                    partyCategory: partyController.partyList[index].partyCategory,
                    partyUserNum: partyController.partyList[index].partyUserNum,
                    partyUserMaxnum:
                        partyController.partyList[index].partyUserMaxnum,
                    partyCreationDate:
                        partyController.partyList[index].partyCreationDate,
                    partyLink: partyController.partyList[index].partyLink,
                    partyProfileImgName:
                        partyController.partyList[index].partyProfileImgName,
                    partyProfileImgPath:
                        partyController.partyList[index].partyProfileImgPath,
                  ),
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
  
      body: SingleChildScrollView(
        child: Column(

          children: [SizedBox(height: 80,),_header(), _groupList()],
        ),
      ),
    );
  }
}

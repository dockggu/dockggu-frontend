import 'package:dockggu/component/category_widget.dart';
import 'package:dockggu/component/join_popup.dart';
import 'package:dockggu/component/profile_widget.dart';
import 'package:dockggu/component/twobtn_dialog.dart';
import 'package:dockggu/component/yellow_button.dart';
import 'package:dockggu/controller/addThon_controller.dart';
import 'package:dockggu/model/partyinfoDTO.dart';
import 'package:dockggu/page/add_schedule.dart';
import 'package:dockggu/repogistory/main_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../component/participate_thon.dart';
import '../component/select_widget.dart';
import '../controller/bookerton_controller.dart';
import '../controller/home_controller.dart';
import '../controller/team_controller.dart';

class GroupHome extends GetView<TeamController> {
  GroupHome({super.key});
  var controller = Get.put(TeamController());
  var bookathoncontroller = Get.put(BookertonController());
  Widget _groupInf() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 170,
            width: Get.width,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  // 이미지 경로 백앤드 상의
                  "https://${controller.currentTeam.value.partyProfileImgPath!}",
                  fit: BoxFit.cover,
                ))),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.currentTeam.value.partyName!,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    controller.currentTeam.value.partyIntro!,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              CategoryWidget(
                  categoryName:
                      categoryMap![controller.currentTeam.value.partyCategory]!)
            ],
          ),
        )
      ],
    );
  }

  Widget _groupSchedule(BuildContext context) {
    // print(bookathoncontroller.bookertonList.first.isProgress);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Obx(() => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '📆 일정',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  // border: const Border(
                  //   left: BorderSide(
                  //     color: Color(0xffFFC727),
                  //     width: 1.0,
                  //   ),
                  // ),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 0,
                      blurRadius: 1.0,
                      offset: const Offset(0, 5), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                              
                                bookathoncontroller
                                        .currentThon.value.bookertonName ??
                                    "진행중인 북커톤이 없습니다.",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              // Text(
                              //   'D-5',
                              //   style: TextStyle(color: Colors.red, fontSize: 16),
                              // )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          if (bookathoncontroller
                                        .currentThon.value.bookertonStartDate ==
                              null)
                            Text("")
                          else
                            Text(
                                '날짜 : ${DateFormat("MM / dd").format(DateTime.parse(bookathoncontroller
                                        .currentThon.value.bookertonStartDate!))} ~ ${DateFormat("MM / dd").format(DateTime.parse(bookathoncontroller
                                        .currentThon.value.bookertonEndDate!))}'),
                          Obx(() => Text(
                              '참여 인원 : ${bookathoncontroller
                                        .currentThon.value.bookertonUserNum ?? 0} / ${bookathoncontroller
                                        .currentThon.value.bookertonUserMaxnum ?? 0}'))
                        ],
                      ),
                      if (bookathoncontroller
                                        .currentThon.value.bookertonStartDate !=
                          null)
                        Obx(() {
                          if (controller.isRegister.value == true) {
                            if (bookathoncontroller
                                        .currentThon.value.bookertonUserNum! >=
                                bookathoncontroller
                                        .currentThon.value
                                    .bookertonUserMaxnum!) {
                              return YellowButton(
                                ontap: () {},
                                buttonText: '마감',
                                buttonWidth: 60,
                                buttonHeight: 30,
                              );
                            } else {
                              return YellowButton(
                                ontap: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          ParticipateThon());
                                },
                                buttonText: '참가',
                                buttonWidth: 60,
                                buttonHeight: 30,
                              );
                            }
                          } else {
                            return SizedBox();
                          }
                        }),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget _memberList(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            Obx(() => Text(
                  '👥 모임 멤버 (${controller.partyMembers.length})',
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                )),
            const SizedBox(
              height: 14,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                      controller.partyMembers.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(right: 7.0),
                            child: GestureDetector(
                              onTap: () {

                                if (controller.currentTeam.value.partyMaster ==
                  controller.currentUser.value.userId){showDialog(
                                    context: context,
                                    builder: (context) => SelectPopup(
                                        title: "강퇴",
                                        reportfunc: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  TwobtnDialog(
                                                      content:
                                                          "정말 ${controller.partyMembers[index].userNickname}님을 강퇴하시겠습니까?",
                                                      yestext: "강퇴",
                                                      notext: "취소",
                                                      okbtn: () {
                                                        MainRepo.blockMember(
                                                            controller
                                                                .currentTeam
                                                                .value
                                                                .partyId!,
                                                            controller
                                                                .partyMembers[
                                                                    index]
                                                                .userId!);
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                      },
                                                      nobtn: () {
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                      }));
                                        },
                                        blockfunc: () {
                                          Navigator.pop(context);
                                        }));}
                                
                              },
                              child: ProfileWidget(
                                thumbPath:
                                    controller.partyMembers[index].fileUrl!,
                                size: 50,
                                type: ProfileType.TYPE2,
                                nickname:
                                    controller.partyMembers[index].userNickname,
                              ),
                            ),
                          ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(controller.isRegister.value);

    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(() => Column(children: [
              _groupInf(),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Color(0xffEBEBEB),
                thickness: 17,
              ),
              const SizedBox(
                height: 15,
              ),
              _groupSchedule(context),
              const SizedBox(
                height: 15,
              ),
              if (controller.currentTeam.value.partyMaster ==
                  controller.currentUser.value.userId)
                YellowButton(
                    ontap: () {
                      Get.put(AddThonController());
                      Get.find<AddThonController>().currentTeam.value =
                          controller.currentTeam.value;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const AddScadule()));
                    },
                    buttonText: "일정 만들기",
                    buttonWidth: MediaQuery.of(context).size.width * 0.6),
              const SizedBox(
                height: 30,
              ),
              _memberList(context),
              const SizedBox(
                height: 30,
              ),
              if (controller.currentTeam.value.partyMaster !=
                  controller.currentUser.value.userId)
                Obx(() {
                  if (controller.isRegister.value == false) {
                    return YellowButton(
                        ontap: () {
                          showDialog(
                              context: context,
                              builder: (context) => JoinPopup(
                                    okbtn: () async {
                                      MainRepo.registerParty(controller
                                          .currentTeam.value.partyId!);
                                      await Get.find<HomeContoller>()
                                          .initCategory();

                                      await controller.getPartyMember();
                                      await controller.isMembers();
                                    },
                                    groupName:
                                        controller.currentTeam.value.partyName!,
                                  ));
                        },
                        buttonText: '가입하기',
                        buttonWidth: 120);
                  } else {
                    return SizedBox();
                  }
                }),
              const SizedBox(
                height: 100,
              ),
              // Image.network(
              //   ''
              // ),
            ])),
      ),
    );
  }
}
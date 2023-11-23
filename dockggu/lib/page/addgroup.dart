import 'dart:io';

import 'package:dockggu/component/input_widget.dart';
import 'package:dockggu/component/select_category.dart';
import 'package:dockggu/component/twobtn_dialog.dart';
import 'package:dockggu/component/yellow_button.dart';
import 'package:dockggu/controller/makeParty_controller.dart';
import 'package:dockggu/repogistory/main_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../app.dart';

class AddGroup extends StatefulWidget {
  const AddGroup({super.key});

  @override
  State<AddGroup> createState() => _AddGroupState();
}

final picker = ImagePicker();

class _AddGroupState extends State<AddGroup> {
  var controller = Get.put(MakePartyController());

  Future getImage(ImageSource imageSource) async {
    final image = await picker.pickImage(source: imageSource);

    setState(() {
      if (image != null) {
        controller.image.value = File(image.path); // 가져온 이미지를 _image에 저장
        print(controller.image.value);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('사진을 선택해주세요 !'),
          duration: Duration(seconds: 2),
        ));
      }
    });
  }

  Widget _groupName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '모임 이름',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
            alignment: Alignment.center,
            height: 45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 0,
                blurRadius: 2.0,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextField(
                controller: controller.inputPartyName, // 나중에 주석 풀기
                decoration: const InputDecoration(
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero),
              ),
            )),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _selectImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '대표 이미지 선택',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
            alignment: Alignment.center,
            height: 120,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 0,
                blurRadius: 2.0,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: GestureDetector(
              onTap: () async {
                await getImage(ImageSource.gallery);
              },
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (controller.image.value == null)
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: SvgPicture.asset('assets/camera-photo.svg'),
                      )
                    else
                      Image.file(
                        File(controller.image.value!.path),
                        height: 110,
                      )
                  ]),
            )),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _selectCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '장르 선택',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return SelectCategory();
              },
            );
          },
          child: Container(
            child: Obx(() => Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(controller.category.value),
                )),
            alignment: Alignment.centerLeft,
            height: 45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 0,
                blurRadius: 2.0,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _introduce() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '한 줄 소개',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
            alignment: Alignment.center,
            height: 45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 0,
                blurRadius: 2.0,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextField(
                controller: controller.inputPartyInfo, // 나중에 주석 풀기
                decoration: const InputDecoration(
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            )),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _maxCount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '최대 인원 수',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
            alignment: Alignment.center,
            height: 45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 0,
                blurRadius: 2.0,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.inputMaxMembers, // 나중에 주석 풀기
                      decoration: const InputDecoration(
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero),
                    ),
                  ),
                  const Text(
                    '명',
                    style: TextStyle(color: Color(0xff999999)),
                  ),
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff000000),
            size: 16.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Align(
          alignment: Alignment(-1.2, 0),
          child: Text(
            '모임 만들기', //DB에서 불러오기
            style: TextStyle(
              color: Color(0xff000000),
              fontSize: 20.0,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 710,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 251, 232, 184),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70),
                )),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 55, left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _groupName(),
                    _selectImage(),
                    _selectCategory(),
                    _introduce(),
                    _maxCount(),
                    const SizedBox(
                      height: 50,
                    ),
                    YellowButton(
                        ontap: () async {
                          showDialog(
                              context: context,
                              builder: (context) => TwobtnDialog(
                                  content: "생성하시겠습니까?",
                                  yestext: "생성",
                                  notext: "취소",
                                  okbtn: () async {
                                    if (controller.image.value != null) {
                                      await controller.makeParty(context);

                                      Navigator.pop(context);

                                      Get.back();

                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (_) => App()));
                                    }
                                  },
                                  nobtn: () {
                                    Navigator.pop(context);
                                  }));
                        },
                        buttonText: '만들기',
                        buttonWidth: 100),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}



// dㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
// import 'package:dockggu/component/category_widget.dart';
// import 'package:dockggu/component/join_popup.dart';
// import 'package:dockggu/component/profile_widget.dart';
// import 'package:dockggu/component/twobtn_dialog.dart';
// import 'package:dockggu/component/yellow_button.dart';
// import 'package:dockggu/controller/addThon_controller.dart';
// import 'package:dockggu/model/partyinfoDTO.dart';
// import 'package:dockggu/page/add_schedule.dart';
// import 'package:dockggu/repogistory/main_repo.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// import '../component/participate_thon.dart';
// import '../component/select_widget.dart';
// import '../controller/bookerton_controller.dart';
// import '../controller/home_controller.dart';
// import '../controller/team_controller.dart';

// class GroupHome extends GetView<TeamController> {
//   GroupHome({super.key});
//   var controller = Get.put(TeamController());
//   var bookathoncontroller = Get.put(BookertonController());
//   Widget _groupInf() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//             height: 170,
//             width: Get.width,
//             child: ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.network(
//                   // 이미지 경로 백앤드 상의
//                   "https://${controller.currentTeam.value.partyProfileImgPath!}",
//                   fit: BoxFit.cover,
//                 ))),
//         const SizedBox(
//           height: 20,
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     controller.currentTeam.value.partyName!,
//                     style: const TextStyle(
//                         fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 8,
//                   ),
//                   Text(
//                     controller.currentTeam.value.partyIntro!,
//                     style: const TextStyle(fontSize: 12),
//                   ),
//                 ],
//               ),
//               CategoryWidget(
//                   categoryName:
//                       categoryMap![controller.currentTeam.value.partyCategory]!)
//             ],
//           ),
//         )
//       ],
//     );
//   }

//   Widget _groupSchedule(BuildContext context) {
//     // print(bookathoncontroller.bookertonList.first.isProgress);
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 23),
//       child: Obx(() => Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 '📆 일정',
//                 style: TextStyle(fontSize: 18, color: Colors.black),
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               Container(
//                 height: 100,
//                 decoration: BoxDecoration(
//                   // border: const Border(
//                   //   left: BorderSide(
//                   //     color: Color(0xffFFC727),
//                   //     width: 1.0,
//                   //   ),
//                   // ),
//                   borderRadius: const BorderRadius.only(
//                       topRight: Radius.circular(10),
//                       bottomRight: Radius.circular(10)),
//                   color: Colors.white,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.4),
//                       spreadRadius: 0,
//                       blurRadius: 1.0,
//                       offset: const Offset(0, 5), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.max,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Text(
                              
//                                 bookathoncontroller
//                                         .currentThon.value.bookertonName ??
//                                     "진행중인 북커톤이 없습니다.",
//                                 style: const TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold),
//                               ),
//                               const SizedBox(
//                                 width: 8,
//                               ),
//                               // Text(
//                               //   'D-5',
//                               //   style: TextStyle(color: Colors.red, fontSize: 16),
//                               // )
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           if (bookathoncontroller
//                                         .currentThon.value.bookertonStartDate ==
//                               null)
//                             Text("")
//                           else
//                             Text(
//                                 '날짜 : ${DateFormat("MM / dd").format(DateTime.parse(bookathoncontroller
//                                         .currentThon.value.bookertonStartDate!))} ~ ${DateFormat("MM / dd").format(DateTime.parse(bookathoncontroller
//                                         .currentThon.value.bookertonEndDate!))}'),
//                           Obx(() => Text(
//                               '참여 인원 : ${bookathoncontroller
//                                         .currentThon.value.bookertonUserNum ?? 0} / ${bookathoncontroller
//                                         .currentThon.value.bookertonUserMaxnum ?? 0}'))
//                         ],
//                       ),
//                       if (bookathoncontroller
//                                         .currentThon.value.bookertonStartDate !=
//                           null)
//                         Obx(() {
//                           if (controller.isRegister.value == true) {
//                             if (bookathoncontroller
//                                         .currentThon.value.bookertonUserNum! >=
//                                 bookathoncontroller
//                                         .currentThon.value
//                                     .bookertonUserMaxnum!) {
//                               return YellowButton(
//                                 ontap: () {},
//                                 buttonText: '마감',
//                                 buttonWidth: 60,
//                                 buttonHeight: 30,
//                               );
//                             } else {
//                               return YellowButton(
//                                 ontap: () {
//                                   showModalBottomSheet(
//                                       context: context,
//                                       builder: (BuildContext context) =>
//                                           ParticipateThon());
//                                 },
//                                 buttonText: '참가',
//                                 buttonWidth: 60,
//                                 buttonHeight: 30,
//                               );
//                             }
//                           } else {
//                             return SizedBox();
//                           }
//                         }),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           )),
//     );
//   }

//   Widget _memberList(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 23),
//       child: Container(
//         alignment: Alignment.centerLeft,
//         child: Column(
//           children: [
//             Obx(() => Text(
//                   '👥 모임 멤버 (${controller.partyMembers.length})',
//                   style: const TextStyle(fontSize: 18, color: Colors.black),
//                 )),
//             const SizedBox(
//               height: 14,
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   ...List.generate(
//                       controller.partyMembers.length,
//                       (index) => Padding(
//                             padding: const EdgeInsets.only(right: 7.0),
//                             child: GestureDetector(
//                               onTap: () {
//                                 showDialog(
//                                     context: context,
//                                     builder: (context) => SelectPopup(
//                                         title: "강퇴",
//                                         reportfunc: () {
//                                           showDialog(
//                                               context: context,
//                                               builder: (context) =>
//                                                   TwobtnDialog(
//                                                       content:
//                                                           "정말 ${controller.partyMembers[index].userNickname}님을 강퇴하시겠습니까?",
//                                                       yestext: "강퇴",
//                                                       notext: "취소",
//                                                       okbtn: () {
//                                                         MainRepo.blockMember(
//                                                             controller
//                                                                 .currentTeam
//                                                                 .value
//                                                                 .partyId!,
//                                                             controller
//                                                                 .partyMembers[
//                                                                     index]
//                                                                 .userId!);
//                                                         Navigator.pop(context);
//                                                         Navigator.pop(context);
//                                                       },
//                                                       nobtn: () {
//                                                         Navigator.pop(context);
//                                                         Navigator.pop(context);
//                                                       }));
//                                         },
//                                         blockfunc: () {
//                                           Navigator.pop(context);
//                                         }));
//                               },
//                               child: ProfileWidget(
//                                 thumbPath:
//                                     controller.partyMembers[index].fileUrl!,
//                                 size: 50,
//                                 type: ProfileType.TYPE2,
//                                 nickname:
//                                     controller.partyMembers[index].userNickname,
//                               ),
//                             ),
//                           ))
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(controller.isRegister.value);

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Obx(() => Column(children: [
//               _groupInf(),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Divider(
//                 color: Color(0xffEBEBEB),
//                 thickness: 17,
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               _groupSchedule(context),
//               const SizedBox(
//                 height: 15,
//               ),
//               if (controller.currentTeam.value.partyMaster ==
//                   controller.currentUser.value.userId)
//                 YellowButton(
//                     ontap: () {
//                       Get.put(AddThonController());
//                       Get.find<AddThonController>().currentTeam.value =
//                           controller.currentTeam.value;
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (_) => const AddScadule()));
//                     },
//                     buttonText: "일정 만들기",
//                     buttonWidth: MediaQuery.of(context).size.width * 0.6),
//               const SizedBox(
//                 height: 30,
//               ),
//               _memberList(context),
//               const SizedBox(
//                 height: 30,
//               ),
//               if (controller.currentTeam.value.partyMaster !=
//                   controller.currentUser.value.userId)
//                 Obx(() {
//                   if (controller.isRegister.value == false) {
//                     return YellowButton(
//                         ontap: () {
//                           showDialog(
//                               context: context,
//                               builder: (context) => JoinPopup(
//                                     okbtn: () async {
//                                       MainRepo.registerParty(controller
//                                           .currentTeam.value.partyId!);
//                                       await Get.find<HomeContoller>()
//                                           .initCategory();

//                                       await controller.getPartyMember();
//                                       await controller.isMembers();
//                                     },
//                                     groupName:
//                                         controller.currentTeam.value.partyName!,
//                                   ));
//                         },
//                         buttonText: '가입하기',
//                         buttonWidth: 120);
//                   } else {
//                     return SizedBox();
//                   }
//                 }),
//               const SizedBox(
//                 height: 100,
//               ),
//               // Image.network(
//               //   ''
//               // ),
//             ])),
//       ),
//     );
//   }
// }

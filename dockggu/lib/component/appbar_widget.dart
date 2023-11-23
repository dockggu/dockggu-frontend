import 'package:dockggu/app.dart';
import 'package:dockggu/component/party_edit.dart';
import 'package:dockggu/component/select_widget.dart';
import 'package:dockggu/component/twobtn_dialog.dart';
import 'package:dockggu/page/home.dart';
import 'package:dockggu/page/update_party.dart';
import 'package:dockggu/repogistory/main_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/team_controller.dart';
import 'response_popup.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget(
      {Key? key,
      required this.targetId,
      required this.appBar,
      required this.title,
      this.center = false})
      : super(key: key);

  final AppBar appBar;
  final String title;
  final bool center;
  final int targetId;
  var controller = Get.put(TeamController());

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        '$title',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      centerTitle: center,
      leading: GestureDetector(
        child: Icon(
          Icons.arrow_back_ios,
          size: 16,
          color: Colors.black,
        ),
        onTap: () {
// Get.delete<TeamController>();
          Get.back();
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.more_horiz,
            size: 24,
            color: Colors.black,
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  if (controller.currentUser.value.userId ==
                      controller.currentTeam.value.partyMaster) {
                    return PartyEdit(deletefunc: () {
                      showDialog(
                          context: context,
                          builder: (context) => TwobtnDialog(
                              content: "모임을 삭제하시겠습니까?",
                              yestext: "삭제",
                              notext: "취소",
                              okbtn: () async {
                                await MainRepo.deleteParty(
                                    controller.currentTeam.value.partyId!,
                                    controller.currentTeam.value.partyMaster!);
                                Navigator.pop(context);

                                showDialog(
                                    context: Get.context!,
                                    builder: (context) => ResponsePopup(
                                          content: "모임이 삭제되었습니다.",
                                          yestext: "확인",
                                          okbtn: () async {
                                            Navigator.pop(context);
                                            Navigator.pop(context);

                                            Get.back();

                                            // Navigator.push(
                                            //     context,
                                            //     MaterialPageRoute(
                                            //         builder: (_) => App()));
                                          },
                                        ));
                              },
                              nobtn: () {
                                Navigator.pop(context);
                              }));
                    }, exitfunc: () {
                      Navigator.pop(context);
                    }, updatefunc: () {
                      Get.to(UpdateParty());
                    });
                  } else {
                    return SelectPopup(
                        title: "신고",
                        reportfunc: () {
                          showDialog(
                              context: context,
                              builder: (context) => TwobtnDialog(
                                  content:
                                      "정말로 신고하시겠습니까?\n\n검토 후 24시간 내에 모임이 삭제되고\n모임장에게는 제재가 가해집니다.",
                                  yestext: "신고",
                                  notext: "취소",
                                  okbtn: () async {
                                    MainRepo.partyreport(targetId);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  nobtn: () async {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  }));
                        },
                        blockfunc: () {
                          Navigator.pop(context);
                        });
                  }
                });
          },
        ),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}

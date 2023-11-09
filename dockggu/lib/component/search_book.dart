import 'package:dockggu/component/book_widget.dart';
import 'package:dockggu/component/bookathon_detail_widget.dart';
import 'package:dockggu/controller/team_controller.dart';
import 'package:dockggu/model/makebookathonDTO.dart';
import 'package:dockggu/model/partyinfoDTO.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/makeParty_controller.dart';
import '../repogistory/aladin_repo.dart';
import 'category_widget.dart';

class SearchBook extends StatelessWidget {
  SearchBook({super.key});
  var controller = Get.put(TeamController());

  TextEditingController searchKeyword = TextEditingController();

  Widget _bookList(BuildContext context) {
    return Obx(() => Container(
          child: Column(children: [
            ...List.generate(
                controller.participateBook.length,
                (index) => BookListWidget(
                      bookimg: controller.participateBook[index].bookImgPath!,
                      title: controller.participateBook[index].bookName!,
                      author: controller.participateBook[index].bookAuthor!,
                      ontap: () async {
                        controller.selectBook.value = ParicipateBookathon(
                            bookName:
                                controller.participateBook[index].bookName!,
                            bookAuthor:
                                controller.participateBook[index].bookAuthor!,
                            bookImgPath:
                                controller.participateBook[index].bookImgPath!,
                            bookPublisher: controller
                                .participateBook[index].bookPublisher!);
                                Navigator.pop(context);
                      },
                    ))
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            // 창 둥글게
            borderRadius: BorderRadius.circular(30),
            child: Container(
                height: 600,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: MediaQuery.of(context).size.width * 0.9,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 192, 192, 192)),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              width: Get.width * 0.7,
                              height: 40,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: searchKeyword,
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        if (searchKeyword.text != null &&
                                            searchKeyword.text != "") {
                                          controller.participateBook.value =
                                              await AladinRepo.searchBook(
                                                  searchKeyword.text);
                                        }
                                      },
                                      child: Icon(
                                        Icons.search,
                                        color:
                                            Color.fromARGB(255, 192, 192, 192),
                                      )),
                                  SizedBox(
                                    width: 5,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 23.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'x',
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _bookList(context)
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

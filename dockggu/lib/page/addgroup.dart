import 'dart:io';

import 'package:dockggu/component/input_widget.dart';
import 'package:dockggu/component/select_category.dart';
import 'package:dockggu/component/yellow_button.dart';
import 'package:dockggu/controller/makeParty_controller.dart';
import 'package:dockggu/repogistory/main_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

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
            child:  Padding(
              padding:  const EdgeInsets.only(left: 10.0),
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
                          if(controller.image.value != null){
                          controller.makeParty();

                          Navigator.pop(context);

                          }
                        },
                        buttonText: '만들기',
                        buttonWidth: 100)
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

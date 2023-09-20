import 'package:dockggu/component/input_widget.dart';
import 'package:dockggu/component/select_category.dart';
import 'package:dockggu/component/yellow_button.dart';
import 'package:flutter/material.dart';

class AddGroup extends StatefulWidget {
  const AddGroup({super.key});

  @override
  State<AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<AddGroup> {
  Widget _groupName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '모임 이름',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
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
                offset: Offset(0, 1), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextField(
                // controller: textEditingController, // 나중에 주석 풀기
                decoration: InputDecoration(
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero),
              ),
            )),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _selectImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '대표 이미지 선택',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
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
                offset: Offset(0, 1), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextField(
                // controller: textEditingController, // 나중에 주석 풀기
                decoration: InputDecoration(
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero),
              ),
            )),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _selectCategory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '장르 선택',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 12,
        ),
        GestureDetector(
          onTap: () {
            showDialog(context: context, builder: (context) {
              return SelectCategory();
            },);
          },
          child: Container(
              alignment: Alignment.center,
              height: 45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.9),
                  spreadRadius: 0,
                  blurRadius: 2.0,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ], borderRadius: BorderRadius.circular(5), color: Colors.white),
              ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _introduce() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '한 줄 소개',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
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
                offset: Offset(0, 1), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextField(
                // controller: textEditingController, // 나중에 주석 풀기
                decoration: InputDecoration(
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            )),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  Widget _maxCount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '최대 인원 수',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
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
                offset: Offset(0, 1), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      // controller: textEditingController, // 나중에 주석 풀기
                      decoration: InputDecoration(
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero),
                    ),
                  ),
                  Text(
                    '명',
                    style: TextStyle(color: Color(0xff999999)),
                  ),
                  SizedBox(
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
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff000000),
            size: 16.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Align(
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
            decoration: BoxDecoration(
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
                    SizedBox(
                      height: 50,
                    ),
                    YellowButton(
                        ontap: () {
                          Navigator.pop(context);

                        }, buttonText: '만들기', buttonWidth: 100)
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

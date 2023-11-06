import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../component/mypage_widget.dart';
import '../component/profile_widget.dart';
import '../controller/home_controller.dart';

class Mypage1 extends StatefulWidget {
  Mypage1({super.key});

  @override
  State<Mypage1> createState() => _Mypage1State();
}

class _Mypage1State extends State<Mypage1> {
  var controller = Get.put(HomeContoller());
  List<int> medalList = [];
  List<String> imageList = [
    'assets/book.png',
    'assets/book.png',
    'assets/book.png',
    'assets/book.png',
  ];

  @override


  Widget _header() {
    print(controller.medalList);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        '마이페이지',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
      ),
    );
  }

  Widget _profile(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          _a(context),
          Column(
            children: [
              _b(context),
              _c(context),
            ],
          ),
          _d(context),
        ],
      ),
    );
  }

  Widget _center() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        '📖 읽은 책들',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _a(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.30,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
            child: Center(
                child: ProfileWidget(
              thumbPath:
                  'https://images.mypetlife.co.kr/content/uploads/2023/01/03112035/bay._.curry_thumnail.png',
              size: 75,
              type: ProfileType.TYPE4,
              nickname: "kancho",
            )),
          ),
        ),
        Positioned(
          left: 60,
          top: 45,
          child: ElevatedButton(
            onPressed: () {},
            child: Icon(
              Icons.settings,
              size: 18,
              color: Colors.black,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Colors.white,
              ),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                CircleBorder(),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.all(5),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _b(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.050,
      child: Obx(()=>Text(
        '${controller.currentUser.value.userNickname}님',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }

  Widget _c(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width * 0.50,
      height: MediaQuery.of(context).size.height * 0.090,
      child: _medal(),
    );
  }

  Widget _d(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      padding: EdgeInsets.fromLTRB(0, 15, 10, 0),
      width: MediaQuery.of(context).size.width * 0.10,
      child: GestureDetector(
        child: Icon(
          Icons.info,
          size: 20,
          color: Color(0xff999999),
        ),
        onTap: () {
          showDialog(context: context, builder: (context) => _medal());
        },
      ),
    );
  }

  Widget _gridView() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(8),
            color: Colors.white,
            child: Center(
              child: Column(
                children: [
                  Image.asset(imageList[index]),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '눈에 갇힌 외딴 산장에서',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '히가시노 게이고',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff9D9D9D),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _medal() {
    return Obx(()=>Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Image.asset(
              'assets/3rd_medal.png',
              height: 40,
              width: 40,
            ),
            Text(controller.medalList.value[0].toString()),
          ],
        ),
        SizedBox(
          width: 25,
        ),
        Column(
          children: [
            Image.asset(
              'assets/2nd_medal.png',
              height: 40,
              width: 40,
            ),
            Text(controller.medalList.value[1].toString()),
          ],
        ),
        SizedBox(
          width: 25,
        ),
        Column(
          children: [
            Image.asset(
              'assets/1st_medal.png',
              height: 40,
              width: 40,
            ),
            Text(controller.medalList.value[2].toString()),
          ],
        ),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: [_header(), _profile(context), _center(), _gridView()],
      ),
    );
  }
}

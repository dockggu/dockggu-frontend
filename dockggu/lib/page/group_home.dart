import 'package:dockggu/component/category_widget.dart';
import 'package:dockggu/component/join_popup.dart';
import 'package:dockggu/component/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupHome extends StatefulWidget {
  const GroupHome({super.key});

  @override
  State<GroupHome> createState() => _GroupHomeState();
}

class _GroupHomeState extends State<GroupHome> {
  Widget _groupInf() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 170,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://cdn.sisamagazine.co.kr/news/photo/202206/449057_455011_3458.jpg',
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
                    '베이커가 221B번지',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '추리소설 좋아하는 사람 모여라!',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              CategoryWidget(categoryName: '🕵🏻‍♂️ 소설')
            ],
          ),
        )
      ],
    );
  }

  Widget _groupSchedule() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '📆 일정',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '9/16 (토)',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'D-5',
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('날짜 : 9/16 ~ 9/23 (1주일)'),
                  Text('참여 인원 : 15 / 30')
                ],
              ),
            ),
            height: 100,
            decoration: BoxDecoration(
              // border: const Border(
              //   left: BorderSide(
              //     color: Color(0xffFFC727),
              //     width: 1.0,
              //   ),
              // ),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  spreadRadius: 0,
                  blurRadius: 1.0,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _memberList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '👥 모임 멤버 (15)',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(height: 14,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
              ...List.generate(10, (index) => ProfileWidget(thumbPath: 'https://images.mypetlife.co.kr/content/uploads/2023/01/03112035/bay._.curry_thumnail.png',size: 50,type: ProfileType.TYPE2,nickname: "kancho",))
            
              ],),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
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
        _groupSchedule(),
        const SizedBox(
          height: 30,
        ),
        _memberList()
        ,
        SizedBox(height: 30,)
        ,GestureDetector(
          onTap: (){
            showDialog(
          context: context,
          builder: (context) => JoinPopup(
                groupName: '기술경영',
              ));

          },
          child: Container(
            alignment: Alignment.center,
            width: 120,
            height: 40,
            child: Text('참여하기',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffFFD66C),
        
            ),
          ),
        )
      ]),
    );
  }
}

import 'package:dockggu/component/category_widget.dart';
import 'package:dockggu/component/profile_widget.dart';
import 'package:dockggu/page/bookathon_detail.dart';
import 'package:dockggu/page/tabview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GroupList extends StatelessWidget {
  const GroupList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xffFFD66C)))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: ProfileWidget(thumbPath: 'https://health.chosun.com/site/data/img_dir/2023/07/17/2023071701753_0.jpg',type: ProfileType.TYPE1,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context, MaterialPageRoute(builder: (_) => TabView()));
                  },
                  child: Text('베이커가 221B번지',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                Text('추리소설 좋아하는 사람 모여라!',style: TextStyle(fontSize:12 ),),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text('멤버 15 / 30',style: TextStyle(color: Color(0xff9D9D9D)),),
                  SizedBox(width: 40,),
                  CategoryWidget(categoryName: '🕵🏻‍♂️ 소설')
                ],)
              ],),
              SizedBox(width: 30,),
              SvgPicture.asset("assets/heart.svg")
              ],
          ),
        ),
      ),
    );
  }
}

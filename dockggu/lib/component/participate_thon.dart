import 'package:dockggu/component/yellow_button.dart';
import 'package:dockggu/repogistory/aladin_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParticipateThon extends StatelessWidget {
   ParticipateThon({super.key});
  TextEditingController searchKeyword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
              child: Padding(
                padding:  EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("📚 북커톤 참여하기 ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w200),),
                      Text("x",style: TextStyle(fontSize: 22),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text('이닛님이 읽을 책'),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 192, 192, 192)),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    width: Get.width,
                    height: 40,
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Expanded(
                        child: TextField(
                          controller: searchKeyword,
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),GestureDetector(
                        onTap: ()async{
                          // AladinRepo.searchBook(searchKeyword.text);
                          // showDialog(context: context, builder: ())

                        },
                        child: Icon(Icons.search,color:Color.fromARGB(255, 192, 192, 192) ,)),SizedBox(width: 5,)
                    ],
                  ),),
                   SizedBox(height: 20,),
                  Text('총 페이지 수'),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 192, 192, 192)),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    width: Get.width,
                    height: 40,
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),),
                  SizedBox(height: 30,),
                  Align(
                    alignment: Alignment.center,
                    child: YellowButton(ontap: (){}, buttonText: "참여 완료", buttonWidth: 170,buttonHeight: 40,))
              
                ],),
              ),)
              ;
  }
}
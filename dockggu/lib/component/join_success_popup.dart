import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class JoinSuccess extends StatelessWidget {
  String groupName;

  JoinSuccess({super.key, required this.groupName});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            // 창 둥글게
            borderRadius: BorderRadius.circular(20),
            child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: Get.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                                            Text('🎉',style: TextStyle(fontSize: 50),),SizedBox(height: 15,),

                    Text(
                      '가입 완료',
                      style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
              
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '지금부터 $groupName모임의 ',
                      style: TextStyle(fontSize: 16),
                    ),Text(
                      '북커톤에 참여할 수 있습니다. ',
                      style: TextStyle(fontSize: 16),
                    ),SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: (){
                              Navigator.of(context).pop();
                                                            Navigator.of(context).pop();



                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 40,
                          child: Text(
                            '확인',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffFFD66C),
                          ),
                        ),
                      ),
                      
                    ),
                    SizedBox(height: 20,)
                  ],
                )),
          ),
          
        ],
      ),
    );
  }
}

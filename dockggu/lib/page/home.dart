import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  Widget _banner() {
    return Container(
      color: Color(0xffFFF5DA),
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                '이닛 님의 취향에 맞는 책 추천해드려요',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text("AI 기반으로 찾아드려요"),
              Row(
                children: [
                  SizedBox(width: 170,),
                  Container(
                        alignment: Alignment.center,
                        width: 110,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffFFD66C)
                        ),
                        child: Text('책 추천 받기 >',style: TextStyle(color: Colors.white),),
                      ),
                ],
              )
            ],
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            '📚',
            style: TextStyle(fontSize: 45),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 70,
        ),
        _banner()
      ],
    ));
  }
}

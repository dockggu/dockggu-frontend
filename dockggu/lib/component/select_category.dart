import 'package:flutter/material.dart';

import 'category_widget.dart';

class SelectCategory extends StatelessWidget {
  SelectCategory({super.key});

  final List<String> items = [
    '📚 전체',
    '🕵🏻‍♂️ 소설',
    '📕 에세이',
    '🗺 여행',
    '👤 인문학',
    '🎨 디자인',
    '🧐 철학',
    '🗿 역사',
    '🎫 예술/문화',
    '📈 경제/경영',
    '👩🏻‍⚖️ 사회/정치',
    '✍🏻 시',
    '🛍 라이프스타일',
    '🏗 건축',
    '🧬 과학',
    '🖥 컴퓨터/IT',
    '💪 건강/운동',
    '👨🏻‍💻 자기계발',
    '💵 재테크',
    '📱 마케팅'
  ];

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
                width: MediaQuery.of(context).size.width * 0.9,
                child: Stack(
                  children: [Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 7,),
                      Text(
                        '책 장르 선택',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Wrap(
                        direction: Axis.horizontal, // 나열 방향
                        alignment: WrapAlignment.center, // 정렬 방식
                        spacing: 8, // 좌우 간격
                        runSpacing: 10, // 상하 간격
                        children: List.generate(items.length, (index) {
                          return CategoryWidget(categoryName: items[index],fontsize: 12,height: 25,);
                        }),
                      ),
                    ],
                  ),
                  Positioned(
                        right: 5,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Text('x',style: TextStyle(fontSize: 25),),))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

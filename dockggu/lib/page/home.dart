import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  Widget _banner() {
    return Container(
      color: const Color(0xffFFF5DA),
      height: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                '이닛 님의 취향에 맞는 책 추천해드려요',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("AI 기반으로 찾아드려요"),
              Row(
                children: [
                  const SizedBox(
                    width: 170,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 110,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffFFD66C)),
                    child: const Text(
                      '책 추천 받기 >',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            width: 25,
          ),
          const Text(
            '📚',
            style: TextStyle(fontSize: 45),
          )
        ],
      ),
    );
  }

  Widget _bookathon_title() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 30, right: 20),
      child: Column(
        children: [
          const Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '북커톤 🏃🏼',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Text('완독을 목표로 함께 달려봐요'),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Wrap(
            direction: Axis.horizontal, // 나열 방향
            alignment: WrapAlignment.start, // 정렬 방식
            spacing: 8, // 좌우 간격
            runSpacing: 10, // 상하 간격
            children: List.generate(items.length, (index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Color(0xffCBC6C6))),
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    items[index],
                    style: TextStyle(fontSize: 15),
                  ),
                ), // 각 아이템에 다른 텍스트 설정
              );
            }),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 70,
        ),
        _banner(),
        _bookathon_title(),
      ],
    ));
  }
}

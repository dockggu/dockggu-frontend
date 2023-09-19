import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressPopup extends StatelessWidget {
  const ProgressPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '🍀 현재 독서량 (%)',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    color: Color(0xff737475),
                    icon: Icon(Icons.close), // X 아이콘 사용
                    onPressed: () {
                      Navigator.of(context).pop(); // 바텀시트 닫기
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: CircularPercentIndicator(
              radius: 65.0,
              lineWidth: 12.0,
              percent: 0.90,
              center: Text(
                "90%",
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff000000),
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Color(0xffBBBBBB),
              progressColor: Color(0xffFFD66C),
            ),
          ),
        ],
      ),
      height: 300,
      decoration: const BoxDecoration(
        color: Colors.white, // 모달 배경색
        borderRadius: BorderRadius.all(
          Radius.circular(24), // 모달 전체 라운딩 처리
        ),
      ),
    );
    ;
  }
}

class PageInputPopup extends StatelessWidget {
  const PageInputPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '📝 페이지 수 기록하기',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    color: Color(0xff737475),
                    icon: Icon(Icons.close), // X 아이콘 사용
                    onPressed: () {
                      Navigator.of(context).pop(); // 바텀시트 닫기
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('몇 페이지까지 읽었는지 입력해주세요'),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 150,
            height: 50,
            child: TextField(
              style: TextStyle(fontSize: 24),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixText: 'P. ',
                prefixStyle: TextStyle(
                  fontSize: 20.0,
                  color: Color(0xff000000),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 90,
            height: 45,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Color(0xffffFFD66C),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ProgressPopup();
                  },
                  backgroundColor: Colors.transparent,
                );
              },
              child: Text(
                '확인',
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      height: 300,
      decoration: const BoxDecoration(
        color: Colors.white, // 모달 배경색
        borderRadius: BorderRadius.all(
          Radius.circular(24), // 모달 전체 라운딩 처리
        ),
      ),
    );
  }
}

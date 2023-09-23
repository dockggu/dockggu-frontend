import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PageInput extends StatelessWidget {
  const PageInput({Key? key}) : super(key: key);

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
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
              icon: Icon(Icons.close),
              onPressed: () {
                Get.back(); 
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _explain() {
    return Text('몇 페이지까지 읽었는지 입력해주세요');
  }

  Widget _input() {
    return Container(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _header(),
          SizedBox(
            height: 20,
          ),
          _explain(),
          SizedBox(
            height: 10,
          ),
          _input(),
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
                    return CurrentProgress();
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
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
    );
  }
}

class CurrentProgress extends StatelessWidget {
  const CurrentProgress({Key? key}) : super(key: key);

  _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
              icon: Icon(Icons.close),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  _progressCircle() {
    return Container(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _header(),
          SizedBox(
            height: 30,
          ),
          _progressCircle()
        ],
      ),
      height: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(24),
        ),
      ),
    );
  }
}

import 'package:dockggu/component/yellow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddScadule extends StatefulWidget {
  const AddScadule({super.key});

  @override
  State<AddScadule> createState() => _AddScaduleState();
}

class _AddScaduleState extends State<AddScadule> {
  DateTimeRange _range = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(Duration(days: 7)),
  );

  Future<void> _rangeDateTime(BuildContext context) async {
    final DateTimeRange? range = await showDateRangePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
        locale: const Locale('ko', 'KR'));

    setState(() {
      _range = range!;
    });
  }

  Widget _scheduleName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '🏷 일정 이름',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
            alignment: Alignment.center,
            height: 45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 0,
                blurRadius: 2.0,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextField(
                // controller: textEditingController, // 나중에 주석 풀기
                decoration: InputDecoration(
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero),
              ),
            )),
        SizedBox(
          height: 40,
        )
      ],
    );
  }

  Widget _selectDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '📆 날짜 선택',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
            alignment: Alignment.center,
            height: 45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 0,
                blurRadius: 2.0,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "${_range.start.year.toString()}-${_range.start.month.toString().padLeft(2, '0')}-${_range.start.day.toString().padLeft(2, '0')} - ${_range.end.year.toString()}-${_range.end.month.toString().padLeft(2, '0')}-${_range.end.day.toString().padLeft(2, '0')} ",
                  )),
                  GestureDetector(
                      onTap: () {
                        // _StartSelectDateTime(context);
                        _rangeDateTime(context);
                      },
                      child: SvgPicture.asset('assets/Vector.svg')),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            )),
        SizedBox(
          height: 40,
        )
      ],
    );
  }

  Widget _maxCount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '최대 인원 수',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
            alignment: Alignment.center,
            height: 45,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 0,
                blurRadius: 2.0,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      // controller: textEditingController, // 나중에 주석 풀기
                      decoration: InputDecoration(
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero),
                    ),
                  ),
                  Text(
                    '명',
                    style: TextStyle(color: Color(0xff999999)),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff000000),
            size: 16.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Align(
          alignment: Alignment(-1.2, 0),
          child: Text(
            '일정 추가', //DB에서 불러오기
            style: TextStyle(
              color: Color(0xff000000),
              fontSize: 20.0,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: 710,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 251, 232, 184),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70),
                )),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 55, left: 25, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _scheduleName(),
                    _selectDate(),
                    _maxCount(),
                    SizedBox(height: 60),
                    YellowButton(
                        ontap: () {
                          Navigator.pop(context);
                        },
                        buttonText: '일정 추가',
                        buttonWidth: 100)
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
import 'package:dockggu/component/yellow_button.dart';
import 'package:dockggu/controller/addThon_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddScadule extends StatefulWidget {
  const AddScadule({super.key});

  @override
  State<AddScadule> createState() => _AddScaduleState();
}

class _AddScaduleState extends State<AddScadule> {

    var controller = Get.put(AddThonController());

  DateTimeRange _range = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(const Duration(days: 7)),
  );

  Future<void> _rangeDateTime(BuildContext context) async {
    final DateTimeRange? range = await showDateRangePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
        locale: const Locale('ko', 'KR'));

    setState(() {
      controller.dateRange.value = range!;
    });
  }

  Widget _scheduleName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '🏷 일정 이름',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
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
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextField(
                controller: controller.inputThonName, // 나중에 주석 풀기
                decoration:const  InputDecoration(
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.zero),
              ),
            )),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }

  Widget _selectDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '📆 날짜 선택',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
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
                offset: const Offset(0, 1), // changes position of shadow
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
                  const SizedBox(
                    width: 10,
                  )
                ],
              ),
            )),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }

  Widget _maxCount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '최대 인원 수',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
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
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ], borderRadius: BorderRadius.circular(5), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.inputMaxMembers, // 나중에 주석 풀기
                      decoration: const InputDecoration(
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.zero),
                    ),
                  ),
                  const Text(
                    '명',
                    style: TextStyle(color: Color(0xff999999)),
                  ),
                  const SizedBox(
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
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff000000),
            size: 16.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Align(
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
            decoration: const BoxDecoration(
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
                    const SizedBox(height: 60),
                    YellowButton(
                        ontap: () async{
                          await controller.addThon();
                          // Navigator.pop(context);
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

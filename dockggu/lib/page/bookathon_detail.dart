import 'package:dockggu/component/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../component/bottomsheet_widget.dart';
import '../component/profile_widget.dart';
import '../component/bookathon_detail_widget.dart';

class BookatghonDetail extends StatelessWidget {
  const BookatghonDetail({super.key});

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        '다함께 완독해요! 📖',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _progressList() {
    return Column(
      children: List.generate(
        50,
        (index) => Column(
          children: [
            Row(
              children: [BookWidget(), ProgressWidget(), PercentWidget()],
            ),
            TitleWidget(),
            Divider(
              indent: 20,
              endIndent: 20,
              color: Color(0xffFFD66C),
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(appBar: AppBar(), title: '베이커가 221B번지'),
      body: Stack(
        children: [
          ListView(
            children: [_header(), _progressList()],
          ),
          Positioned(
            right: 10,
            bottom: 100,
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return PageInput();
                  },
                  backgroundColor: Colors.transparent,
                );
              },
              child: Text(
                '📝',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Color(0xffFFD66C),
                ),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  CircleBorder(),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.all(16.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

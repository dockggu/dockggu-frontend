import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

void main() => runApp(Test());

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    Widget lastRidingProgress() {
      double percent = 0.9;
      return Column(
        children: [
          Container(
            alignment: FractionalOffset(percent, 1 - percent),
            child: FractionallySizedBox(
                child: SvgPicture.asset('assets/google_login.svg',
                    width: 30, height: 30, fit: BoxFit.cover)),
          ),
          LinearPercentIndicator(
            padding: EdgeInsets.zero,
            percent: percent,
            lineHeight: 10,
            backgroundColor: Colors.black38,
            progressColor: Colors.indigo.shade900,
            width: MediaQuery.of(context).size.width,
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('percent_indicator'),
      ),
      body: lastRidingProgress()
    );
  }
}


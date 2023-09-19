import 'package:dockggu/component/bookathon_popup.dart';
import 'package:flutter/material.dart';
import 'tabview.dart';
import 'home.dart';
import 'package:dockggu/page/group_home.dart';
import 'package:dockggu/component/bookathon_banner.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(BookathonDetail());
}

class BookathonDetail extends StatelessWidget {
  const BookathonDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff000000),
              size: 16.0,
            ),
            onPressed: () {
              Navigator.push(
                    context, MaterialPageRoute(builder: (_) => TabView()));
            },
          ),
          title: Align(
            alignment: Alignment(-1.2, 0),
            child: Text(
              '베이커가 221B번지', //DB에서 불러오기
              style: TextStyle(
                color: Color(0xff000000),
                fontSize: 20.0,
              ),
            ),
          ),
          backgroundColor: Color(0xffFFFFFF),
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    child: ListView.separated(
                  key: PageStorageKey('PageStorage'),
                  itemCount: 3,
                  itemBuilder: (BuildContext ctx, int idx) {
                    if (idx == 0) return HeaderTile();
                    return ProgressBanner();
                  },
                  separatorBuilder: (BuildContext ctx, int idx) {
                    if (idx == 0) return Divider(color: Colors.transparent);
                    return Divider(
                      color: Color(0xffFFD66C),
                      indent: 20,
                      endIndent: 20,
                    );
                  },
                )),
              ],
            ),
            Positioned(
              bottom: 90.0,
              right: 10.0,
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return PageInputPopup();
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
      ),
    );
  }
}


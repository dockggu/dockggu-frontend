import 'package:dockggu/component/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../component/profile_widget.dart';
import '../component/bookathon_detail_widget.dart';
import '../controller/bookupdate_controller.dart';
import '../controller/mybook_controller.dart';

class BookatghonDetail extends StatefulWidget {
  const BookatghonDetail({super.key});

  @override
  State<BookatghonDetail> createState() => _BookatghonDetailState();
}

class _BookatghonDetailState extends State<BookatghonDetail> {
  final MyBookController myBookController = Get.put(MyBookController());

  @override
  void initState() {
    super.initState();
    myBookController.fetchMyBookData(1);
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        '다함께 완독해요 📖',
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
        myBookController.myBookList.length,
        (index) => Column(
          children: [
            Row(
              children: [
                BookWidget(),
                ProgressWidget(
                  bookId: myBookController.myBookList[index].bookId,
                  userId: myBookController.myBookList[index].userId,
                  bookertonId: myBookController.myBookList[index].bookertonId,
                  bookName: myBookController.myBookList[index].bookName,
                  bookAuthor: myBookController.myBookList[index].bookAuthor,
                  bookPublisher:
                      myBookController.myBookList[index].bookPublisher,
                  bookTotalPage:
                      myBookController.myBookList[index].bookTotalPage,
                  bookReadPage: myBookController.myBookList[index].bookReadPage,
                  bookImgName: myBookController.myBookList[index].bookImgName,
                  bookImgPath: myBookController.myBookList[index].bookImgPath,
                ),
                PercentWidget(
                  bookId: myBookController.myBookList[index].bookId,
                  userId: myBookController.myBookList[index].userId,
                  bookertonId: myBookController.myBookList[index].bookertonId,
                  bookName: myBookController.myBookList[index].bookName,
                  bookAuthor: myBookController.myBookList[index].bookAuthor,
                  bookPublisher:
                      myBookController.myBookList[index].bookPublisher,
                  bookTotalPage:
                      myBookController.myBookList[index].bookTotalPage,
                  bookReadPage: myBookController.myBookList[index].bookReadPage,
                  bookImgName: myBookController.myBookList[index].bookImgName,
                  bookImgPath: myBookController.myBookList[index].bookImgPath,
                )
              ],
            ),
            TitleWidget(
              bookId: myBookController.myBookList[index].bookId,
              userId: myBookController.myBookList[index].userId,
              bookertonId: myBookController.myBookList[index].bookertonId,
              bookName: myBookController.myBookList[index].bookName,
              bookAuthor: myBookController.myBookList[index].bookAuthor,
              bookPublisher: myBookController.myBookList[index].bookPublisher,
              bookTotalPage: myBookController.myBookList[index].bookTotalPage,
              bookReadPage: myBookController.myBookList[index].bookReadPage,
              bookImgName: myBookController.myBookList[index].bookImgName,
              bookImgPath: myBookController.myBookList[index].bookImgPath,
            ),
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
      body: GetBuilder<MyBookController>(
        builder: (myBookController) {
          if (myBookController.myBookList.isEmpty) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Stack(
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
          );
        },
      ),
    );
  }
}

class PageInput extends StatefulWidget {
  const PageInput({Key? key}) : super(key: key);

  @override
  State<PageInput> createState() => _PageInputState();
}

class _PageInputState extends State<PageInput> {
  final BookUpdateController controller = Get.put(BookUpdateController());
  final TextEditingController pageController = TextEditingController();

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
        controller: pageController,
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
                String pageCount = pageController.text;
                controller.updateBookPage('1', pageCount);
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

class CurrentProgress extends StatefulWidget {
  const CurrentProgress({Key? key}) : super(key: key);

  @override
  State<CurrentProgress> createState() => _CurrentProgressState();
}

class _CurrentProgressState extends State<CurrentProgress> {
  final MyBookController myBookController = Get.put(MyBookController());

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
    int readPage = myBookController.myBookList[0].bookReadPage ?? 0;
    int totalPage = myBookController.myBookList[0].bookTotalPage ?? 1;

    double percentage = (readPage / totalPage) * 100;
    int intPercentage = percentage.toInt(); 

    return Container(
      child: CircularPercentIndicator(
        radius: 65.0,
        lineWidth: 12.0,
        percent: 0.90,
        center: Text(
          "$intPercentage%",
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

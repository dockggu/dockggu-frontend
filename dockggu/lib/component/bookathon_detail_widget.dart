import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'profile_widget.dart';

class BookWidget extends StatelessWidget {
  final String? bookImgPath;
  const BookWidget({
    super.key,
    this.bookImgPath,
  });

  @override
  Widget build(BuildContext context) {
    String encodedUrl = '$bookImgPath';

// URL 디코딩
    String decodedUrl = Uri.decodeFull(encodedUrl);
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      margin: EdgeInsets.only(top: 20),
      height: 150,
      child: Center(
        child: Image.network(
          decodedUrl,
          height: 100,
          width: 80,
        ),
      ),
    );
  }
}

class ProgressWidget extends StatelessWidget {
  final int? bookId;
  final int? userId;
  final int? bookertonId;
  final String? bookName;
  final String? bookAuthor;
  final String? bookPublisher;
  final int? bookTotalPage;
  final int? bookReadPage;
  final String? bookImgName;
  final String? bookImgPath;
  final String? userNickname;
  final String? userProfileImgPath;

  const ProgressWidget({
    super.key,
    this.bookId,
    this.userId,
    this.bookertonId,
    this.bookName,
    this.bookAuthor,
    this.bookPublisher,
    this.bookTotalPage,
    this.bookReadPage,
    this.bookImgName,
    this.bookImgPath,
    this.userNickname,
    this.userProfileImgPath
  });

  @override
  Widget build(BuildContext context) {
    double getPagePercent(int readPage, int totalPage) {
      if (totalPage == 0) {
        return 0.0;
      }
      return (readPage / totalPage);
    }

    double pagePercent = getPagePercent(bookReadPage ?? 0, bookTotalPage ?? 0);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      width: MediaQuery.of(context).size.width * 0.55,
      margin: EdgeInsets.only(top: 20),
      height: 150,
      child: Column(
        children: [
          Container(
            child: FractionallySizedBox(
              child: ProfileWidget(
                thumbPath:
                    'https://$userProfileImgPath',
                size: 40,
                type: ProfileType.TYPE3,
                nickname: "$userNickname",
              ),
            ),
            alignment: FractionalOffset(pagePercent, 1 - pagePercent),
          ),
          SizedBox(
            height: 5,
          ),
          LinearPercentIndicator(
            percent: pagePercent,
            lineHeight: 10,
            barRadius: Radius.circular(10),
            progressColor: Color(0xffFFC100),
            backgroundColor: Color(0xffBBBBBB),
          ),
        ],
      ),
    );
  }
}

class PercentWidget extends StatelessWidget {
  final int? bookId;
  final int? userId;
  final int? bookertonId;
  final String? bookName;
  final String? bookAuthor;
  final String? bookPublisher;
  final int? bookTotalPage;
  final int? bookReadPage;
  final String? bookImgName;
  final String? bookImgPath;

  const PercentWidget({
    super.key,
    this.bookId,
    this.userId,
    this.bookertonId,
    this.bookName,
    this.bookAuthor,
    this.bookPublisher,
    this.bookTotalPage,
    this.bookReadPage,
    this.bookImgName,
    this.bookImgPath,
  });

  @override
  Widget build(BuildContext context) {
    double getPagePercent(int readPage, int totalPage) {
      return (readPage / totalPage) * 100.0;
    }

    double pagePercent = getPagePercent(bookReadPage ?? 0, bookTotalPage ?? 0);
    int percenttoInt = pagePercent.toInt();
    return Container(
      padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width * 0.15,
      margin: EdgeInsets.only(top: 20),
      height: 150,
      child: Text(
        '$percenttoInt%',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  final int? bookId;
  final int? userId;
  final int? bookertonId;
  final String? bookName;
  final String? bookAuthor;
  final String? bookPublisher;
  final int? bookTotalPage;
  final int? bookReadPage;
  final String? bookImgName;
  final String? bookImgPath;
  const TitleWidget({
    super.key,
    this.bookId,
    this.userId,
    this.bookertonId,
    this.bookName,
    this.bookAuthor,
    this.bookPublisher,
    this.bookTotalPage,
    this.bookReadPage,
    this.bookImgName,
    this.bookImgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 20,
          child: Text(
            '$bookName',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

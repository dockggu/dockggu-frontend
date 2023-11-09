import 'package:dockggu/component/yellow_button.dart';
import 'package:flutter/material.dart';

class BookListWidget extends StatelessWidget {
  String bookimg;
  String title;
  String author;
      final Function()? ontap;


  BookListWidget({
    super.key,
    required this.bookimg,
    required this.title,
    required this.author,
    required this.ontap
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:13.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.network(bookimg),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      author,
                      style: TextStyle(fontSize: 10),
                    )),
                SizedBox(
                  height: 13,
                ),
                YellowButton(ontap: ontap, buttonText: "선택", buttonWidth: 50,buttonHeight: 30,fontSize: 12,)
              ],
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:dockggu/component/appbar_widget.dart';
// import 'package:dockggu/controller/home_controller.dart';
// import 'package:dockggu/controller/team_controller.dart';
// import 'package:dockggu/model/mypageDTO.dart';
// import 'package:dockggu/repogistory/main_repo.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';

// import '../component/profile_widget.dart';
// import '../component/bookathon_detail_widget.dart';
// import '../component/response_popup.dart';
// import '../controller/bookupdate_controller.dart';
// import '../controller/mybook_controller.dart';

// class BookatghonDetail extends StatefulWidget {
//   final int? currentBookertonId;
//   const BookatghonDetail({super.key, this.currentBookertonId});

//   @override
//   State<BookatghonDetail> createState() => _BookatghonDetailState();
// }

// class _BookatghonDetailState extends State<BookatghonDetail> {
//   final MyBookController myBookController = Get.put(MyBookController());
//   var controller = Get.put(TeamController());

//   // isProgress 로 책 업데이트 버튼 조절해야함

//   @override
//   void initState() {
//     super.initState();
//     myBookController.fetchMyBookData(widget.currentBookertonId ?? 0);
//   }

//   Widget _header() {
//     return const Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//       child: Text(
//         '다함께 완독해요 📖',
//         style: TextStyle(
//           fontSize: 24,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   Widget _progressList() {
//     return Column(
//       children: List.generate(
//         myBookController.myBookList.length,
//         (index) => Column(
//           children: [
//             Row(
//               children: [
//                 BookWidget(
//                   bookImgPath: myBookController.myBookList[index].bookImgPath,
//                 ),
//                 ProgressWidget(
//                   bookId: myBookController.myBookList[index].bookId,
//                   userId: myBookController.myBookList[index].userId,
//                   bookertonId: myBookController.myBookList[index].bookertonId,
//                   bookName: myBookController.myBookList[index].bookName,
//                   bookAuthor: myBookController.myBookList[index].bookAuthor,
//                   bookPublisher:
//                       myBookController.myBookList[index].bookPublisher,
//                   bookTotalPage:
//                       myBookController.myBookList[index].bookTotalPage,
//                   bookReadPage: myBookController.myBookList[index].bookReadPage,
//                   bookImgName: myBookController.myBookList[index].bookImgName,
//                   bookImgPath: myBookController.myBookList[index].bookImgPath,
//                   userNickname: myBookController.userList[index].userNickname,
//                   userProfileImgPath:
//                       myBookController.userList[index].userProfileImgPath,
//                 ),
//                 PercentWidget(
//                   bookId: myBookController.myBookList[index].bookId,
//                   userId: myBookController.myBookList[index].userId,
//                   bookertonId: myBookController.myBookList[index].bookertonId,
//                   bookName: myBookController.myBookList[index].bookName,
//                   bookAuthor: myBookController.myBookList[index].bookAuthor,
//                   bookPublisher:
//                       myBookController.myBookList[index].bookPublisher,
//                   bookTotalPage:
//                       myBookController.myBookList[index].bookTotalPage,
//                   bookReadPage: myBookController.myBookList[index].bookReadPage,
//                   bookImgName: myBookController.myBookList[index].bookImgName,
//                   bookImgPath: myBookController.myBookList[index].bookImgPath,
//                 )
//               ],
//             ),
//             TitleWidget(
//               bookId: myBookController.myBookList[index].bookId,
//               userId: myBookController.myBookList[index].userId,
//               bookertonId: myBookController.myBookList[index].bookertonId,
//               bookName: myBookController.myBookList[index].bookName,
//               bookAuthor: myBookController.myBookList[index].bookAuthor,
//               bookPublisher: myBookController.myBookList[index].bookPublisher,
//               bookTotalPage: myBookController.myBookList[index].bookTotalPage,
//               bookReadPage: myBookController.myBookList[index].bookReadPage,
//               bookImgName: myBookController.myBookList[index].bookImgName,
//               bookImgPath: myBookController.myBookList[index].bookImgPath,
//             ),
//             const Divider(
//               indent: 20,
//               endIndent: 20,
//               color: Color(0xffFFD66C),
//               thickness: 1,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(widget.currentBookertonId);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBarWidget(
//           targetId: controller.currentTeam.value.partyId!,
//           appBar: AppBar(),
//           title: controller.currentTeam.value.partyName!),
//       body: Obx(() {
//         if (myBookController.myBookList.isEmpty) {
//           return const Center(
//             child: Text('북커톤에 참여한 유저가 없습니다.'),
//           );
//         }
//         return Stack(
//           children: [
//             ListView(
//               children: [_header(), _progressList()],
//             ),
//             Positioned(
//               right: 10,
//               bottom: 100,
//               child: Obx(() {
//                 // 로그인한 사용자의 userId
//                 var loggedInUserId = controller.currentUser.value.userId;

//                 // 로그인한 사용자의 userId와 일치하는 도서들의 리스트
//                 var matchingBooks = myBookController.myBookList
//                     .where((book) => book.userId == loggedInUserId)
//                     .toList();

//                 // 로그인한 사용자의 userId와 일치하는 도서가 하나 이상인 경우에만 버튼을 표시
//                 if (matchingBooks.isNotEmpty &&
//                     myBookController.isProgress.value) {
//                   return ElevatedButton(
//                     onPressed: () {
//                       showModalBottomSheet(
//                         context: context,
//                         builder: (context) {
//                           return PageInput(
//                             currentBookertonId: widget.currentBookertonId,
//                           );
//                         },
//                         backgroundColor: Colors.transparent,
//                       );
//                     },
//                     child: const Text(
//                       '📝',
//                       style: TextStyle(
//                         fontSize: 25,
//                       ),
//                     ),
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all<Color>(
//                         const Color(0xffFFD66C),
//                       ),
//                       shape: MaterialStateProperty.all<OutlinedBorder>(
//                         const CircleBorder(),
//                       ),
//                       padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//                         const EdgeInsets.all(16.0),
//                       ),
//                     ),
//                   );
//                 } else {
//                   // 일치하는 도서가 없을 경우 빈 컨테이너 반환
//                   return Container();
//                 }
//               }),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }

// class PageInput extends StatefulWidget {
//   final int? currentBookertonId;
//   const PageInput({Key? key, this.currentBookertonId}) : super(key: key);

//   @override
//   State<PageInput> createState() => _PageInputState();
// }

// class _PageInputState extends State<PageInput> {
//   final BookUpdateController controller = Get.put(BookUpdateController());
//   final TextEditingController pageController = TextEditingController();
//   final MyBookController myBookController = Get.put(MyBookController());

//   // Define a variable to hold the string representation of currentBookertonId
//   int? currentBookertonId;

//   @override
//   void initState() {
//     super.initState();

//     // Convert int? to String and assign it to the variable
//     currentBookertonId = widget.currentBookertonId ?? 0;
//   }

//   Widget _header() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//       child: Container(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               '📝 페이지 수 기록하기',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             IconButton(
//               color: const Color(0xff737475),
//               icon: const Icon(Icons.close),
//               onPressed: () {
//                 Get.back();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _explain() {
//     return const Text('몇 페이지까지 읽었는지 입력해주세요');
//   }

//   Widget _input() {
//     return Container(
//       width: 150,
//       height: 50,
//       child: TextField(
//         controller: pageController,
//         style: const TextStyle(fontSize: 24),
//         keyboardType: TextInputType.number,
//         decoration: InputDecoration(
//           prefixText: 'P. ',
//           prefixStyle: const TextStyle(
//             fontSize: 20.0,
//             color: Color(0xff000000),
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10.0),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         FocusManager.instance.primaryFocus?.unfocus();
//       },
//       child: Container(
//         // ignore: sort_child_properties_last
//         child: Column(
//           children: [
//             _header(),
//             const SizedBox(
//               height: 20,
//             ),
//             _explain(),
//             const SizedBox(
//               height: 10,
//             ),
//             _input(),
//             const SizedBox(
//               height: 20,
//             ),
//             SizedBox(
//               width: 90,
//               height: 45,
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   backgroundColor: const MaterialStatePropertyAll(
//                     Color(0xffffFFD66C),
//                   ),
//                   shape: MaterialStateProperty.all<OutlinedBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                   ),
//                 ),
//                 onPressed: () {
//                   String pageCount = pageController.text;
//                   var Index = myBookController.myBookList.indexWhere(
//                     (book) => book.bookertonId == currentBookertonId,
//                   );

//                   // int totalPage =
//                   //     myBookController.myBookList[Index].bookTotalPage ?? 0;
//                   // int enteredPage = int.tryParse(pageCount) ?? 0;
//                   controller.updateBookPage(currentBookertonId, pageCount);
//                   showModalBottomSheet(
//                     context: context,
//                     builder: (context) {
//                       return CurrentProgress(
//                           currentBookertonId: widget.currentBookertonId);
//                     },
//                     backgroundColor: Colors.transparent,
//                     isScrollControlled: true,
//                   );
//                 },
//                 child: const Text(
//                   '확인',
//                   style: TextStyle(
//                       color: Color(0xffFFFFFF),
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ),
//           ],
//         ),

//         height: MediaQuery.of(context).size.height * 0.7,
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(
//             Radius.circular(24),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CurrentProgress extends StatefulWidget {
//   final int? currentBookertonId;
//   const CurrentProgress({Key? key, this.currentBookertonId}) : super(key: key);

//   @override
//   State<CurrentProgress> createState() => _CurrentProgressState();
// }

// class _CurrentProgressState extends State<CurrentProgress> {
//   final MyBookController myBookController = Get.put(MyBookController());
//   var controller = Get.put(HomeContoller());
//   int? currentBookertonId;

//   @override
//   void initState() {
//     super.initState();
//     currentBookertonId = widget.currentBookertonId ?? 0;
//     // myBookController.fetchMyBookData(widget.currentBookertonId ?? 0);
//   }

//   _header() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//       child: Container(
//         alignment: Alignment.topLeft,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               '🍀 현재 독서량 (%)',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             IconButton(
//               color: const Color(0xff737475),
//               icon: const Icon(Icons.close),
//               onPressed: () {
//                 Get.back();
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   _progressCircle() {
//     return Container(
//       child: Obx(() {
//         // 로그인한 사용자의 userId
//         var loggedInUserId = controller.currentUser.value.userId;

//         // 로그인한 사용자와 동일한 userId를 가진 도서의 index를 찾습니다.
//         var userBookIndex = myBookController.myBookList
//             .indexWhere((book) => book.userId == loggedInUserId);

//         // 만약 해당 사용자의 도서가 없다면 기본값 0으로 설정합니다.
//         if (userBookIndex == -1) {
//           userBookIndex = 0;
//         }

//         int readPage =
//             myBookController.myBookList[userBookIndex].bookReadPage ?? 0;
//         int totalPage =
//             myBookController.myBookList[userBookIndex].bookTotalPage ?? 1;

//         double percentage = (readPage / totalPage);
//         double percentage2 = (readPage / totalPage) * 100;
//         int intPercentage2 = percentage2.toInt();
//         int intPercentage = percentage.toInt();

//         if (percentage > 1) {
//           return CircularPercentIndicator(
//             radius: 65.0,
//             lineWidth: 12.0,
//             percent: 1,
//             center: Text(
//               "100%",
//               style: const TextStyle(
//                 fontSize: 24,
//                 color: Color(0xff000000),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             backgroundColor: const Color(0xffBBBBBB),
//             progressColor: const Color(0xffFFD66C),
//           );
//         } else {
//           return CircularPercentIndicator(
//             radius: 65.0,
//             lineWidth: 12.0,
//             percent: percentage,
//             center: Text(
//               "$intPercentage2%",
//               style: const TextStyle(
//                 fontSize: 24,
//                 color: Color(0xff000000),
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             backgroundColor: const Color(0xffBBBBBB),
//             progressColor: const Color(0xffFFD66C),
//           );
//         }
//       }),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           _header(),
//           const SizedBox(
//             height: 30,
//           ),
//           _progressCircle()
//         ],
//       ),
//       height: 300,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(
//           Radius.circular(24),
//         ),
//       ),
//     );
//   }
// }

// ////////////////////
// ///
// ///
// ///import 'package:flutter/material.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'profile_widget.dart';

// class BookWidget extends StatelessWidget {
//   final String? bookImgPath;
//   const BookWidget({
//     super.key,
//     this.bookImgPath,
//   });

//   @override
//   Widget build(BuildContext context) {
//     String encodedUrl = '$bookImgPath';

// // URL 디코딩
//     String decodedUrl = Uri.decodeFull(encodedUrl);
//     return Container(
//       width: MediaQuery.of(context).size.width * 0.3,
//       margin: EdgeInsets.only(top: 20),
//       height: 150,
//       child: Center(
//         child: Image.network(
//           decodedUrl,
//           height: 100,
//           width: 80,
//         ),
//       ),
//     );
//   }
// }

// class ProgressWidget extends StatelessWidget {
//   final int? bookId;
//   final int? userId;
//   final int? bookertonId;
//   final String? bookName;
//   final String? bookAuthor;
//   final String? bookPublisher;
//   final int? bookTotalPage;
//   final int? bookReadPage;
//   final String? bookImgName;
//   final String? bookImgPath;
//   final String? userNickname;
//   final String? userProfileImgPath;

//   const ProgressWidget({
//     super.key,
//     this.bookId,
//     this.userId,
//     this.bookertonId,
//     this.bookName,
//     this.bookAuthor,
//     this.bookPublisher,
//     this.bookTotalPage,
//     this.bookReadPage,
//     this.bookImgName,
//     this.bookImgPath,
//     this.userNickname,
//     this.userProfileImgPath
//   });

//   @override
//   Widget build(BuildContext context) {
//     double getPagePercent(int readPage, int totalPage) {
//       if (totalPage == 0) {
//         return 0.0;
//       }
//       return (readPage / totalPage);
//     }

//     double pagePercent = getPagePercent(bookReadPage ?? 0, bookTotalPage ?? 0);

//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 30),
//       width: MediaQuery.of(context).size.width * 0.55,
//       margin: EdgeInsets.only(top: 20),
//       height: 150,
//       child: Column(
//         children: [
//           Container(
//             child: FractionallySizedBox(
//               child: ProfileWidget(
//                 thumbPath:
//                     'https://$userProfileImgPath',
//                 size: 40,
//                 type: ProfileType.TYPE3,
//                 nickname: "$userNickname",
//               ),
//             ),
//             alignment: FractionalOffset(pagePercent, 1 - pagePercent),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           if(pagePercent>1)
//           LinearPercentIndicator(
//             percent: 1.0,
//             lineHeight: 10,
//             barRadius: Radius.circular(10),
//             progressColor: Color(0xffFFC100),
//             backgroundColor: Color(0xffBBBBBB),
//           )else LinearPercentIndicator(
//             percent: pagePercent,
//             lineHeight: 10,
//             barRadius: Radius.circular(10),
//             progressColor: Color(0xffFFC100),
//             backgroundColor: Color(0xffBBBBBB),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PercentWidget extends StatelessWidget {
//   final int? bookId;
//   final int? userId;
//   final int? bookertonId;
//   final String? bookName;
//   final String? bookAuthor;
//   final String? bookPublisher;
//   final int? bookTotalPage;
//   final int? bookReadPage;
//   final String? bookImgName;
//   final String? bookImgPath;

//   const PercentWidget({
//     super.key,
//     this.bookId,
//     this.userId,
//     this.bookertonId,
//     this.bookName,
//     this.bookAuthor,
//     this.bookPublisher,
//     this.bookTotalPage,
//     this.bookReadPage,
//     this.bookImgName,
//     this.bookImgPath,
//   });

//   @override
//   Widget build(BuildContext context) {
//     double getPagePercent(int readPage, int totalPage) {
//       return (readPage / totalPage) * 100.0;
//     }

//     double pagePercent = getPagePercent(bookReadPage ?? 0, bookTotalPage ?? 0);
//     int percenttoInt = pagePercent.toInt();
//     return Container(
//       padding: EdgeInsets.fromLTRB(10, 50, 0, 0),
//       alignment: Alignment.centerLeft,
//       width: MediaQuery.of(context).size.width * 0.15,
//       margin: EdgeInsets.only(top: 20),
//       height: 150,
//       child: Text(
//         '$percenttoInt%',
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }
// }

// class TitleWidget extends StatelessWidget {
//   final int? bookId;
//   final int? userId;
//   final int? bookertonId;
//   final String? bookName;
//   final String? bookAuthor;
//   final String? bookPublisher;
//   final int? bookTotalPage;
//   final int? bookReadPage;
//   final String? bookImgName;
//   final String? bookImgPath;
//   const TitleWidget({
//     super.key,
//     this.bookId,
//     this.userId,
//     this.bookertonId,
//     this.bookName,
//     this.bookAuthor,
//     this.bookPublisher,
//     this.bookTotalPage,
//     this.bookReadPage,
//     this.bookImgName,
//     this.bookImgPath,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 20),
//           height: 35,
//           child: Text(
//             '$bookName',
//             style: TextStyle(
//               fontSize: 14,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

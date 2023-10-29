// 북커톤 생성하기
class CreateBookertonRequest {
  final int partyId;
  final String bookertonName;
  final String bookertonStartDate;
  final String bookertonEndDate;
  final int bookertonUserMaxnum;

  CreateBookertonRequest({
    required this.partyId,
    required this.bookertonName,
    required this.bookertonStartDate,
    required this.bookertonEndDate,
    required this.bookertonUserMaxnum,
  });

  Map<String, dynamic> toJson() {
    return {
      'partyId': partyId,
      'bookertonName': bookertonName,
      'bookertonStartDate': bookertonStartDate,
      'bookertonEndDate': bookertonEndDate,
      'bookertonUserMaxnum': bookertonUserMaxnum,
    };
  }
}

// 북커톤 참여하기
class ParicipateBookathon {
  final int bookertonId;
  final String bookName;
  final String bookAuthor;
  final String bookPublisher;
  final String bookImgPath;
  final int bookTotalPage;

  ParicipateBookathon({
    required this.bookertonId,
    required this.bookName,
    required this.bookAuthor,
    required this.bookPublisher,
    required this.bookImgPath,
    required this.bookTotalPage,
  });

  Map<String, dynamic> toJson() {
    return {
      'bookertonId': bookertonId,
      'bookName': bookName,
      'bookAuthor': bookAuthor,
      'bookPublisher': bookPublisher,
      'bookImgPath': bookImgPath,
      'bookTotalPage': bookTotalPage,
    };
  }
}
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
   int? bookertonId;
   String? bookName;
   String? bookAuthor;
   String? bookPublisher;
   String? bookImgPath;
   int? bookTotalPage;

  ParicipateBookathon({
   this.bookertonId,
   this.bookName,
   this.bookAuthor,
   this.bookPublisher,
   this.bookImgPath,
   this.bookTotalPage,
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
// 해당 파티에서 진행한 모든 북커톤 가져오기 요청
class PartyBookertonRequest {
  final int partyId;
  final int page;

  PartyBookertonRequest({
    required this.partyId,
    required this.page,
  });

  Map<String, dynamic> toJson() {
    return {
      'partyId': partyId,
      'page': page,
    };
  }
}
// 해당 파티에서 진행한 모든 북커톤 가져오기 응답

class BookathonDTO {
  final int? partyId;
  final int? userId;
  final String? bookertonName;
  final String? bookertonStartDate;
  final String? bookertonEndDate;
  final int? bookertonUserNum;
  final int? bookertonUserMaxnum;
  final String? bookertonStatus;
  final String? bookertonCreationTime;

  BookathonDTO({
     this.partyId,
     this.userId,
     this.bookertonName,
     this.bookertonStartDate,
     this.bookertonEndDate,
     this.bookertonUserNum,
     this.bookertonUserMaxnum,
     this.bookertonStatus,
     this.bookertonCreationTime,
  });

  factory BookathonDTO.fromJson(Map<String, dynamic> json) {
    return BookathonDTO(
      partyId: json['partyId'],
      userId: json['userId'],
      bookertonName: json['bookertonName'],
      bookertonStartDate: json['bookertonStartDate'],
      bookertonEndDate: json['bookertonEndDate'],
      bookertonUserNum: json['bookertonUserNum'],
      bookertonUserMaxnum: json['bookertonUserMaxnum'],
      bookertonStatus: json['bookertonStatus'],
      bookertonCreationTime: json['bookertonCreationTime'],
    );
  }
}

// ----

// 북커톤 참여자 리스트 요청
class BookertonDetailRequest {
  final int bookertonId;

  BookertonDetailRequest({
    required this.bookertonId,
  });

  Map<String, dynamic> toJson() {
    return {
      'bookertonId': bookertonId,
    };
  }
}

// 북커톤 참여자 리스트 응답

// class UserDto {
//   final int userId;
//   final String userEmail;
//   final String userKakaoEmail;
//   final String userNickname;
//   final String userProfileImgName;
//   final String userProfileImgPath;

//   UserDto({
//     required this.userId,
//     required this.userEmail,
//     required this.userKakaoEmail,
//     required this.userNickname,
//     required this.userProfileImgName,
//     required this.userProfileImgPath,
//   });
// }

class MybookDto {
  final int bookId;
  final int userId;
  final int bookertonId;
  final String bookName;
  final String bookAuthor;
  final String bookPublisher;
  final int bookTotalPage;
  final int bookReadPage;
  final String bookImgName;
  final String bookImgPath;

  MybookDto({
    required this.bookId,
    required this.userId,
    required this.bookertonId,
    required this.bookName,
    required this.bookAuthor,
    required this.bookPublisher,
    required this.bookTotalPage,
    required this.bookReadPage,
    required this.bookImgName,
    required this.bookImgPath,
  });
}

// 북커톤 책 페이지 수 업데이트하기

class UpdateBookReadPageRequest {
  final int bookId;
  final int bookReadPage;

  UpdateBookReadPageRequest({
    required this.bookId,
    required this.bookReadPage,
  });

  Map<String, dynamic> toJson() {
    return {
      'bookId': bookId,
      'bookReadPage': bookReadPage,
    };
  }
}
class Book {
  final String? title;
  final String? author;
  final String? pubDate;
  final String? cover;
  final int? categoryId;
  final String? categoryName;
  final String? publisher;

  Book({
     this.title,
     this.author,
     this.pubDate,
     this.cover,
     this.categoryId,
     this.categoryName,
     this.publisher,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] ?? '',
      author: json['author'] ?? '',
      pubDate: json['pubDate'] ?? '',
      cover: json['cover'] ?? '',
      categoryId: json['categoryId'] ?? 0,
      categoryName: json['categoryName'] ?? '',
      publisher: json['publisher'] ?? '',
    );
  }
}
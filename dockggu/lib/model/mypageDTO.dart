// 내가 가진 파티 목록 가져오기, 요청은 null
class PartyInfoResponseDto {
  final List<PartyInfoItem> partyInfoList;

  PartyInfoResponseDto({required this.partyInfoList});

  factory PartyInfoResponseDto.fromJson(List<dynamic> json) {
    List<PartyInfoItem> partyInfoList = json.map((item) => PartyInfoItem.fromJson(item)).toList();
    return PartyInfoResponseDto(partyInfoList: partyInfoList);
  }
}

class PartyInfoItem {
  final int partyId;
  final String partyName;
  final String partyIntro;
  final int partyMaster;
  final String partyCategory;
  final String partyUserNum;
  final String partyUserMaxnum;
  final String partyCreationDate;
  final String partyLink;
  final String partyProfileImgName;
  final String partyProfileImgPath;

  PartyInfoItem({
    required this.partyId,
    required this.partyName,
    required this.partyIntro,
    required this.partyMaster,
    required this.partyCategory,
    required this.partyUserNum,
    required this.partyUserMaxnum,
    required this.partyCreationDate,
    required this.partyLink,
    required this.partyProfileImgName,
    required this.partyProfileImgPath,
  });

  factory PartyInfoItem.fromJson(Map<String, dynamic> json) {
    return PartyInfoItem(
      partyId: json['partyId'],
      partyName: json['partyName'],
      partyIntro: json['partyIntro'],
      partyMaster: json['partyMaster'],
      partyCategory: json['partyCategory'],
      partyUserNum: json['partyUserNum'],
      partyUserMaxnum: json['partyUserMaxnum'],
      partyCreationDate: json['partyCreationDate'],
      partyLink: json['partyLink'],
      partyProfileImgName: json['partyProfileImgName'],
      partyProfileImgPath: json['partyProfileImgPath'],
    );
  }
}

// 마이페이지 정보 조회, 요청은 null

class UserProfileResponseDto {
  final UserDto userDto;
  final List<MybookDto> mybookDtoList;

  UserProfileResponseDto({required this.userDto, required this.mybookDtoList});

  factory UserProfileResponseDto.fromJson(Map<String, dynamic> json) {
    final userDto = UserDto.fromJson(json['userDto']);
    final mybookDtoList = (json['mybookDtoList'] as List)
        .map((item) => MybookDto.fromJson(item))
        .toList();
    return UserProfileResponseDto(userDto: userDto, mybookDtoList: mybookDtoList);
  }
}

class UserDto {
  final int userId;
  final String userEmail;
  final String userKakaoEmail;
  final String userNickname;
  final String userAward;
  final String userProfileImgName;
  final String userProfileImgPath;

  UserDto({
    required this.userId,
    required this.userEmail,
    required this.userKakaoEmail,
    required this.userNickname,
    required this.userAward,
    required this.userProfileImgName,
    required this.userProfileImgPath,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      userId: json['userId'],
      userEmail: json['userEmail'],
      userKakaoEmail: json['userKakaoEmail'],
      userNickname: json['userNickname'],
      userAward: json['userAward'],
      userProfileImgName: json['userProfileImgName'],
      userProfileImgPath: json['userProfileImgPath'],
    );
  }
}

class MybookDto {
  final int bookId;
  final int userId;
  final String bookName;
  final String bookAuthor;
  final String bookPublisher;
  final String bookImgPath;

  MybookDto({
    required this.bookId,
    required this.userId,
    required this.bookName,
    required this.bookAuthor,
    required this.bookPublisher,
    required this.bookImgPath,
  });

  factory MybookDto.fromJson(Map<String, dynamic> json) {
    return MybookDto(
      bookId: json['bookId'],
      userId: json['userId'],
      bookName: json['bookName'],
      bookAuthor: json['bookAuthor'],
      bookPublisher: json['bookPublisher'],
      bookImgPath: json['bookImgPath'],
    );
  }
}

// 메달 증가 요청
class UptoMedal {
  final List<String> userIdList;

  UptoMedal({required this.userIdList});

  Map<String, dynamic> toJson() {
    return {
      'userIdList': userIdList,
    };
  }
}

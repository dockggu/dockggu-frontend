// 파티 가입 신청
class PartyUserRequest {
  final int partyId;
  final int userId;

  PartyUserRequest({required this.partyId, required this.userId});

  Map<String, dynamic> toJson() {
    return {
      'partyId': partyId,
      'userId': userId,
    };
  }
}


// 파티 정보 요청
class PartyIdRequest {
  final int partyId;

  PartyIdRequest({required this.partyId});

  Map<String, dynamic> toJson() {
    return {
      'partyId': partyId,
    };
  }
}


// 검색 

class QueryData {
  final List<String> categories;
  final String partyName;
  final String page;

  QueryData({
    required this.categories,
    required this.partyName,
    required this.page,
  });

  factory QueryData.fromJson(Map<String, dynamic> json) {
    final List<String> categories = List<String>.from(json['categories']);
    final String partyName = json['partyName'];
    final String page = json['page'];

    return QueryData(
      categories: categories,
      partyName: partyName,
      page: page,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'categories': categories,
      'partyName': partyName,
      'page': page,
    };
  }
}
final Map<String, String>? categoryMap = {
    'bc0000': '📚 전체',
    'bc0001': '🕵🏻‍♂️ 소설',
    'bc0002': '📕 에세이',
    'bc0003': '🗺 여행',
    'bc0004': '👤 인문학',
    'bc0005': '🎨 디자인',
    'bc0006': '🧐 철학',
    'bc0007': '🗿 역사',
    'bc0008': '🎫 예술/문화',
    'bc0009': '📈 경제/경영',
    'bc0010': '👩🏻‍⚖️ 사회/정치',
    'bc0011': '✍🏻 시',
    'bc0012': '🛍 라이프스타일',
    'bc0013': '🏗 건축',
    'bc0014': '🧬 과학',
    'bc0015': '🖥 컴퓨터/IT',
    'bc0016': '💪 건강/운동',
    'bc0017': '👨🏻‍💻 자기계발',
    'bc0018': '💵 재테크',
    'bc0019': '📱 마케팅'
  };

//파티 정보 요청 응답 끝까지
class PartyResponseDto {
  final int? partyId;
  final String? partyName;
  final String? partyIntro;
  final int? partyMaster;
  final String? partyCategory;
  final int? partyUserNum;
  final int? partyUserMaxnum;
  final String? partyCreationDate;
  final String? partyLink;
  final String? partyProfileImgName;
  final String? partyProfileImgPath;

  PartyResponseDto({
     this.partyId,
     this.partyName,
     this.partyIntro,
     this.partyMaster,
     this.partyCategory,
     this.partyUserNum,
     this.partyUserMaxnum,
     this.partyCreationDate,
     this.partyLink,
     this.partyProfileImgName,
     this.partyProfileImgPath,
  });

  factory PartyResponseDto.fromJson(Map<String, dynamic> json) {
    return PartyResponseDto(
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

class BookertonResponseDto {
  final int partyId;
  final int userId;
  final String bookertonName;
  final String bookertonStartDate;
  final String bookertonEndDate;
  final int bookertonUserNum;
  final int bookertonUserMaxnum;
  final String bookertonStatus;
  final String bookertonCreationTime;

  BookertonResponseDto({
    required this.partyId,
    required this.userId,
    required this.bookertonName,
    required this.bookertonStartDate,
    required this.bookertonEndDate,
    required this.bookertonUserNum,
    required this.bookertonUserMaxnum,
    required this.bookertonStatus,
    required this.bookertonCreationTime,
  });

  factory BookertonResponseDto.fromJson(Map<String, dynamic> json) {
    return BookertonResponseDto(
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

class PartyMembersDTO {
  final int? userId;
  final String? userNickname;
  final String? fileName;
  final String? fileUrl;

  PartyMembersDTO({
     this.userId,
     this.userNickname,
     this.fileName,
     this.fileUrl,
  });

  factory PartyMembersDTO.fromJson(Map<String, dynamic> json) {
    return PartyMembersDTO(
      userId: json['userId'],
      userNickname: json['userNickname'],
      fileName: json['fileName'],
      fileUrl: json['fileUrl'],
    );
  }
}

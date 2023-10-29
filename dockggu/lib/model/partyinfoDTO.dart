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

//파티 정보 요청 응답 끝까지
class PartyResponseDto {
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

  PartyResponseDto({
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

class PartyUserListResponseDto {
  final int userId;
  final String userNickname;
  final String fileName;
  final String fileUrl;

  PartyUserListResponseDto({
    required this.userId,
    required this.userNickname,
    required this.fileName,
    required this.fileUrl,
  });

  factory PartyUserListResponseDto.fromJson(Map<String, dynamic> json) {
    return PartyUserListResponseDto(
      userId: json['userId'],
      userNickname: json['userNickname'],
      fileName: json['fileName'],
      fileUrl: json['fileUrl'],
    );
  }
}

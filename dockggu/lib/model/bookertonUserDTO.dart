class UserListResponseDto {
  final int? userId;
  final String? userEmail;
  final String? userSocialEmail;
  final String? userNickname;
  final String? userAward;
  final String? userProfileImgName;
  final String? userProfileImgPath;

  UserListResponseDto({
    this.userId,
    this.userEmail,
    this.userSocialEmail,
    this.userNickname,
    this.userAward,
    this.userProfileImgName,
    this.userProfileImgPath,
  });

  factory UserListResponseDto.fromJson(Map<String, dynamic> json) {
    return UserListResponseDto(
      userId: json['userId'],
      userEmail: json['userEmail'],
      userSocialEmail: json['userSocialEmail'],
      userNickname: json['userNickname'],
      userAward: json['userAward'],
      userProfileImgName: json['userProfileImgName'],
      userProfileImgPath: json['userProfileImgPath'],
    );
  }
}

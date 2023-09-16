import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum ProfileType { TYPE1, TYPE2 }

class ProfileWidget extends StatelessWidget {
  bool? hasStory;
  String thumbPath;
  double? size;
  ProfileType type;
  String? nickname;

  ProfileWidget({
    super.key,
    this.size = 65,
    this.nickname,
    required this.thumbPath,
    required this.type,
  });
  @override
  Widget _profileType1() {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size!),
        child: SizedBox(
            width: size,
            height: size,
            child: CachedNetworkImage(
              imageUrl: thumbPath,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  Widget _profileType2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(size!),
            child: SizedBox(
                width: size,
                height: size,
                child: CachedNetworkImage(
                  imageUrl: thumbPath,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        SizedBox(height: 5,),
        Text(nickname!,style: TextStyle(fontSize: 12,color: Colors.black),)
      ],
    );
  }

  Widget build(BuildContext context) {
    switch (type) {
      case ProfileType.TYPE1:
        return _profileType1();
      case ProfileType.TYPE2:
        return _profileType2();
    }
  }
}

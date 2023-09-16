import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
bool? hasStory;
  String thumbPath;
  double? size;

  ProfileWidget(
      {super.key,
      this.size = 65,
      required this.thumbPath,
      });
  @override
Widget _profileImage() {
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

  Widget build(BuildContext context) {
    return _profileImage();
  }
}
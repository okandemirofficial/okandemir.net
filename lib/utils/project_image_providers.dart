import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';

class ProjectsImageProvider extends EasyImageProvider {
  @override
  final int initialIndex;
  final int count;
  final String imageFolder;

  final String Function(int index) pictureName;

  ProjectsImageProvider({
    this.initialIndex = 0,
    required this.count,
    required this.imageFolder,
    required this.pictureName,
  });

  @override
  ImageProvider<Object> imageBuilder(BuildContext context, int index) {
    ImageProvider imageProvider =
        AssetImage("assets/images/$imageFolder/${pictureName.call(index)}");

    return imageProvider;
  }

  @override
  int get imageCount => count;
}

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class AppImage extends StatelessWidget {
  final String path;
  final double? height, width;
  final BoxFit fit;

  const AppImage(this.path,
      {super.key, this.height, this.width, this.fit = BoxFit.scaleDown});

  @override
  Widget build(BuildContext context) {
    if (path.endsWith('svg')) {
      return SvgPicture.asset(
        path,
        height: height,
        width: width,
        fit: fit,
      );
    } else if (path.endsWith('png')) {
      return Image.asset(
        path,
        height: height,
        width: width,
        fit: fit,
      );
    } else if(path.startsWith('http')) {
      return Image.network(
        path,
        height: height,
        width: width,
        fit: fit,
      );
    }else {
      return Image.file(
        File(path),
        height: height,
        width: width,
        fit: fit,
      );
    }
  }
}

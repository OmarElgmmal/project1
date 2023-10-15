import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImage extends StatelessWidget {
  final String path;
  final double? height, width;
  final BoxFit fit;

  const AppImage(this.path,
      {super.key, this.height, this.width, this.fit = BoxFit.scaleDown});

  @override
  Widget build(BuildContext context) {
    if (path.endsWith("svg")) {
      return SvgPicture.asset(
        path,
        fit: fit,
        height: height,
        width: width,
      );
    } else if (path.startsWith("http")) {
      return Image.network(
        path,
        fit: fit,
        height: height,
        width: width,
      );
    } else if(path.contains("assets")) {
      return Image.asset(
        path,
        fit: fit,
        height: height,
        width: width,
      );
    } else {
      return Image.file(
        File(path),
        fit: fit,
        height: height,
        width: width,
      );
    }
  }
}

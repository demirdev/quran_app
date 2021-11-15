import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTitle extends StatelessWidget {
  final String title;
  final double? fontSize;
  final String tag;
  const AppTitle({Key? key, this.fontSize, String? title, String? tag})
      : this.title = title ?? 'Quran App',
        this.tag = tag ?? 'title',
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: tag,
        child: Text(
          title,
          style: Get.textTheme.headline4?.copyWith(fontSize: fontSize),
        ));
  }
}

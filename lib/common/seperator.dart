import 'package:flutter/material.dart';
import 'package:quran_app/theme/colors.dart';

class Seperator extends StatelessWidget {
  const Seperator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      height: 1,
      color: surahListSeperatedLineColor,
    );
  }
}

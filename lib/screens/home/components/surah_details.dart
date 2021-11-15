import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_app/theme/colors.dart';

class SurahDetails extends StatelessWidget {
  final int surahNumber;
  final TextStyle? textStyle;
  final bool isCentered;
  final bool isReciteScreen;
  const SurahDetails({
    Key? key,
    required this.surahNumber,
    this.textStyle,
    this.isCentered = false,
    this.isReciteScreen = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${quran.getPlaceOfRevelation(surahNumber).toUpperCase()}',
          style: textStyle,
        ),
        Text(
          ' \u2022 ',
          style: TextStyle(
            color: isReciteScreen ? Colors.white54 : surahDetailsDotColor,
            // fontSize: 20.sp,
          ),
        ),
        Text(
          '${quran.getVerseCount(surahNumber)} VERSES',
          style: textStyle,
        ),
      ],
    );
  }
}

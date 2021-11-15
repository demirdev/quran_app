import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_app/theme/colors.dart';

class ParaDetails extends StatelessWidget {
  final int juzNumber;
  final TextStyle? textStyle;
  final bool isCentered;
  final bool isReciteScreen;
  const ParaDetails({
    Key? key,
    required this.juzNumber,
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
        Flexible(
          child: Text(
            '${getSurahAndVersesFromJuz().toUpperCase()}',
            style: textStyle,
          ),
        ),
      ],
    );
  }

  String getSurahAndVersesFromJuz() {
    String jusDetail = '';
    final _map = quran.getSurahAndVersesFromJuz(juzNumber);
    _map.forEach((surahNumber, verses) {
      jusDetail += quran.getSurahNameEnglish(surahNumber) +
          '(${verses.first.toString() + '-' + verses.last.toString()}), ';
    });
    return jusDetail;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran/quran_translation.dart' as translation;
import 'package:quran_app/common/app_title.dart';
import 'package:quran_app/common/search.dart';
import 'package:quran_app/common/seperator.dart';
import 'package:quran_app/extensions/extensions_spacing.dart';
import 'package:quran_app/screens/home/components/surah_details.dart';
import 'package:quran_app/screens/home/home_screen.dart';
import 'package:quran_app/theme/colors.dart';

class ReciteScreen extends StatelessWidget {
  final int surahNumber;
  late final String surahName;
  final int verseCount;

  ReciteScreen({Key? key, required this.surahNumber})
      : surahName = quran.getSurahName(surahNumber),
        verseCount = quran.getVerseCount(surahNumber),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final verseActionButtonsPadding = 10.ww;
    return Scaffold(
      appBar: AppBar(
        // titleSpacing: 0,
        actions: [SearchWidget()],
        leading: IconButton(
          icon: SvgPicture.asset('assets/svg/back.svg'),
          onPressed: () => Get.back(),
        ),
        centerTitle: false,
        title: Row(
          children: [
            AppTitle(
              title: surahName,
              fontSize: Get.textTheme.headline6?.fontSize,
              tag: 'recite',
            ),
            // nextSurah(),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    if (index == 0) return reciteSurahInfo();
                    return Column(
                      children: [
                        VerseActionBar(
                            verseNumber: index,
                            verseActionButtonsPadding:
                                verseActionButtonsPadding),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: Text(
                                quran.getVerse(surahNumber, index),
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  height: 1.7,
                                ),
                              ),
                              alignment: Alignment.topRight,
                            ),
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    translation.getVerseTranslation(
                                        surahNumber, index),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                            if (index == verseCount) nextSurah(),
                          ],
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    if (index == 0) return Container(height: 5.h);
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: Seperator(),
                    );
                  },
                  itemCount: quran.getVerseCount(surahNumber) + 1),
            )
          ],
        ),
      ),
    );
  }

  Container reciteSurahInfo() {
    return Container(
      height: 0.35.sh,
      child: MainCardContainer(
          child: Container(
        // margin: EdgeInsets.only(top: 10.h),
        child: Stack(
          children: [
            Positioned(
              bottom: -10.h,
              right: 0,
              child: Hero(
                tag: 'quran',
                child: Opacity(
                  opacity: 0.07,
                  child: Container(
                    color: Colors.transparent,
                    height: 173.r,
                    width: 283.r,
                    child: SvgPicture.asset('assets/svg/quran.svg'),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.h),
              padding: EdgeInsets.all(14.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      surahName,
                      style: Get.textTheme.headline6
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  Spacer(flex: 1),
                  Center(
                    child: Text(
                      quran.getSurahName(surahNumber),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Spacer(flex: 2),
                  Container(
                    color: Colors.white54.withOpacity(0.3),
                    height: 1,
                    margin: EdgeInsets.symmetric(horizontal: 40.w),
                  ),
                  Spacer(flex: 2),
                  Center(
                    child: SurahDetails(
                      surahNumber: surahNumber,
                      textStyle: TextStyle(color: Colors.white),
                      isCentered: true,
                      isReciteScreen: true,
                    ),
                  ),
                  Spacer(flex: 3),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: SvgPicture.asset('assets/svg/basmala.svg'),
                  ),
                ],
              ),
            ),
            Positioned.fill(
                child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  print('clicked');
                },
              ),
            )),
          ],
        ),
      )),
    );
  }

  Widget nextSurah() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.r),
      child: ElevatedButton(
          onPressed: () {
            Get.back();
            Get.to(() => ReciteScreen(surahNumber: surahNumber + 1));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(quran.getSurahName(surahNumber + 1)),
              Icon(Icons.navigate_next_rounded)
            ],
          )),
    );
  }
}

class VerseActionBar extends StatelessWidget {
  final int verseNumber;
  final Widget verseActionButtonsPadding;
  const VerseActionBar(
      {Key? key,
      required this.verseNumber,
      required this.verseActionButtonsPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(8.r),
              child: Text(
                verseNumber.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: verseActionsColor,
            ),
          ),
          Spacer(),
          VerseAction(assetFile: 'assets/svg/share.svg', onTap: () {}),
          verseActionButtonsPadding,
          VerseAction(assetFile: 'assets/svg/play.svg', onTap: () {}),
          verseActionButtonsPadding,
          VerseAction(
            assetFile: 'assets/svg/bookmark.svg',
            onTap: () {},
          ),
          // verseActionButtonsPadding,
        ],
      ),
      decoration: BoxDecoration(
        color: verseActionsBackgroundColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
    );
  }
}

class VerseAction extends StatelessWidget {
  final String assetFile;
  final Function onTap;
  const VerseAction({
    Key? key,
    required this.assetFile,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(6.r),
        child: SvgPicture.asset(assetFile, color: verseActionsColor),
      ),
      onTap: () => onTap(),
    );
  }
}

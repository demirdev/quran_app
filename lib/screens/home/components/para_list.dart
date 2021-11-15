import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_app/common/seperator.dart';
import 'package:quran_app/screens/home/components/surah_details.dart';
import 'package:quran_app/screens/recite/recite_screen.dart';
import 'package:quran_app/theme/colors.dart';

import 'para_details.dart';

class ParaList extends StatelessWidget {
  const ParaList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Seperator();
      },
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () => Get.to(() => ReciteScreen(surahNumber: index + 1)),
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset('assets/svg/surah_index_background.svg'),
                  Container(child: Text('${index + 1}')),
                ],
              ),
            ],
          ),
          title: Text('Juz'),
          subtitle: ParaDetails(
            juzNumber: index + 1,
          ),
          trailing: Text('ٱللَّه'
              // textDirection: TextDirection.rtl,
              ),
        );
      },
      itemCount: quran.getTotalJuzCount(),
    );
  }
}

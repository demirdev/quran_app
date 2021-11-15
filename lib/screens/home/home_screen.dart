import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quran_app/common/app_title.dart';
import 'package:quran_app/common/search.dart';
import 'package:quran_app/extensions/extensions_spacing.dart';
import 'package:quran_app/screens/home/components/page_list.dart';
import 'package:quran_app/screens/home/components/para_list.dart';
import 'package:quran_app/screens/recite/recite_screen.dart';
import 'package:quran_app/theme/colors.dart';

import 'components/surah_list.dart';

enum MainTabs { holy_tab_quran, home_tab_quran, medina_sherif }

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _categoryTabController;

  MainTabs mainSelectedTab = MainTabs.home_tab_quran;

  @override
  void initState() {
    _categoryTabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // titleSpacing: 0,
        actions: [SearchWidget()],
        leading: IconButton(
          icon: SvgPicture.asset('assets/svg/menu.svg'),
          onPressed: () {},
        ),
        centerTitle: false,
        title: AppTitle(fontSize: Get.textTheme.headline6?.fontSize),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Asslamualaikum', style: Get.textTheme.headline6),
            Text('Tanvir Ahassan', style: Get.textTheme.headline5),
            lastReadCard(),
            categoryTabs(),
            Container(
              height: 0.08.sh,
              margin: EdgeInsets.symmetric(horizontal: 0.r, vertical: 20.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  mainTabItem(
                      assetName: 'assets/svg/first_tab_quran.svg',
                      index: MainTabs.holy_tab_quran,
                      onTap: () {}),
                  mainTabItem(
                      assetName: 'assets/svg/home_tab_quran.svg',
                      index: MainTabs.home_tab_quran,
                      onTap: () {}),
                  mainTabItem(
                      assetName: 'assets/svg/medina_sherif.svg',
                      index: MainTabs.medina_sherif,
                      onTap: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget mainTabItem(
      {required String assetName,
      required MainTabs index,
      required Function onTap}) {
    final _isTabSelected = isTabSelected(index);
    return InkWell(
      onTap: () {
        setState(() {
          mainSelectedTab = index;
        });
      },
      customBorder: CircleBorder(),
      child: Container(
        width: _isTabSelected ? 44.r : 40.r,
        height: _isTabSelected ? 44.r : 40.r,
        child: SvgPicture.asset(
          assetName,
          color: _isTabSelected ? mainTabsSelectedsIconColor : mainColor,
        ),
        decoration: BoxDecoration(
          color: _isTabSelected ? mainColor : mainTabsUnselectedBackgroundColor,
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(10.r),
      ),
    );
  }

  bool isTabSelected(MainTabs index) => mainSelectedTab == index;

  Expanded categoryTabs() {
    return Expanded(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  width: 2.h,
                  color: tabbarUnselectedIndicatorColor,
                ))),
              ),
              TabBar(
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
                labelColor: mainColor,
                indicatorColor: mainColor,
                unselectedLabelColor: tabbarUnselectedLabelColor,
                indicatorWeight: 2.h,
                labelPadding: EdgeInsets.all(7.r),
                controller: _categoryTabController,
                tabs: [
                  Text('Surah'),
                  Text('Para'),
                  Text('Page'),
                  Text('Hijb'),
                ],
              ),
            ],
            fit: StackFit.passthrough,
            alignment: Alignment.bottomCenter,
          ),
          Expanded(
            child: TabBarView(
              controller: _categoryTabController,
              children: [
                SurahList(),
                ParaList(),
                PageList(),
                Center(child: Text('Not implemented yet.')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget lastReadCard() {
    return MainCardContainer(
        child: Stack(
      children: [
        Positioned(
          bottom: 0,
          right: 0,
          child: Hero(
              tag: 'quran', child: SvgPicture.asset('assets/svg/quran.svg')),
        ),
        Padding(
          padding: EdgeInsets.all(14.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/svg/readme.svg'),
                  8.ww,
                  Text(
                    'Last Read',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Spacer(flex: 3),
              Text(
                'Al-Fatiah',
                style: Get.textTheme.headline6?.copyWith(color: Colors.white),
              ),
              Spacer(),
              Text(
                'Ayah No: 1',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
            child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Get.to(() => ReciteScreen(surahNumber: 1));
            },
          ),
        )),
      ],
    ));
  }
}

class MainCardContainer extends StatelessWidget {
  final Widget child;
  final cardBorderRadius = BorderRadius.circular(10.r);
  MainCardContainer({
    Key? key,
    required this.child,
    // this.cardBorderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.r),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: cardBorderRadius),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFDF98FA),
                Color(0xFF9055FF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: cardBorderRadius,
          ),
          width: double.infinity,
          height: 0.16.sh,
          child: ClipRRect(
            borderRadius: cardBorderRadius,
            child: child,
          ),
        ),
      ),
    );
  }
}

//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

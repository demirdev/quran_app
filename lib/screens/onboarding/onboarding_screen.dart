import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quran_app/common/app_title.dart';
import 'package:quran_app/theme/colors.dart';

import 'widgets/onboarding_quran_card.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  late final Animation<double> _quranAnimationPositionBottom;

  late final AnimationController _animationController;

  final starsAnimationTop = 500 / 0.8.sh;

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  void initAnimation() {
    _animationController =
        AnimationController(vsync: this, duration: 1.7.seconds);
    _quranAnimationPositionBottom = Tween<double>(begin: 0.07.sh, end: 0.075.sh)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeIn));
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var bodyTextStyle = Theme.of(context).textTheme.bodyText2?.copyWith(
          color: mainTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
        );
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 3),
            AppTitle(),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Text(
                'Learn Quran and Recite once everyday',
                textAlign: TextAlign.center,
                style: bodyTextStyle,
              ),
            ),
            Spacer(flex: 1),
            OnboardingQuranCard(
              cardBorderRadius: cardBorderRadius,
              quranAnimationPositionBottom: _quranAnimationPositionBottom,
              starsAnimationTop: starsAnimationTop,
            ),
            Spacer(flex: 5),
          ],
        ),
      ),
    );
  }

  final cardBorderRadius = BorderRadius.circular(20.r);
}

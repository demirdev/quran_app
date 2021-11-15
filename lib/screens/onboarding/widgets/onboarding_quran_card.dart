import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quran_app/screens/home/home_screen.dart';
import 'package:quran_app/theme/colors.dart';

class OnboardingQuranCard extends StatelessWidget {
  const OnboardingQuranCard({
    Key? key,
    required this.cardBorderRadius,
    required Animation<double> quranAnimationPositionBottom,
    required this.starsAnimationTop,
  })  : _quranAnimationPositionBottom = quranAnimationPositionBottom,
        super(key: key);

  final BorderRadius cardBorderRadius;
  final Animation<double> _quranAnimationPositionBottom;
  final double starsAnimationTop;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: ClipRRect(
        borderRadius: cardBorderRadius,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: cardBorderRadius,
              ),
              height: 0.5.sh,
              margin: EdgeInsets.only(bottom: 20.r),
            ),
            AnimatedBuilder(
              animation: _quranAnimationPositionBottom,
              builder: (context, child) {
                return Positioned(
                    top:
                        _quranAnimationPositionBottom.value * starsAnimationTop,
                    left: 0,
                    right: 0,
                    child: child!);
              },
              child: Hero(
                tag: 'quran',
                child: SvgPicture.asset(
                  'assets/svg/onboarding_stars.svg',
                  height: 0.24.sh,
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _quranAnimationPositionBottom,
              builder: (context, child) {
                return Positioned(
                    bottom: _quranAnimationPositionBottom.value, child: child!);
              },
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(20.r),
                  // child: Image.asset('assets/svg/onboarding_quran.png'),
                  child: SvgPicture.asset('assets/svg/onboarding_quran.svg'),
                ),
              ),
            ),
            Positioned(
                top: 0.03.sh,
                child: SvgPicture.asset(
                  'assets/svg/onboarding_2_clouds.svg',
                )),
            Positioned(
                right: 0,
                top: 0.07.sh,
                child: SvgPicture.asset(
                  'assets/svg/onboarding_1_cloud.svg',
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: mainButtonTextColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () => Get.off(() => HomeScreen()),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.r, vertical: 10.r),
                      child: Text(
                        'Get Started',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension MySpacingExtension on int {
  SizedBox get hh {
    return SizedBox(
      height: this.h,
    );
  }

  Widget get ww {
    return SizedBox(
      width: this.w,
    );
  }
}

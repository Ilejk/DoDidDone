import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidthSpacer extends StatelessWidget {
  const WidthSpacer({
    super.key,
    required this.wi,
  });

  final double wi;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: wi.w,
    );
  }
}

class HeightSpacer extends StatelessWidget {
  const HeightSpacer({
    super.key,
    required this.he,
  });
  final double he;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: he.h,
    );
  }
}

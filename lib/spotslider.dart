import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotapp/constant.dart';
import 'package:spotapp/resourses.dart';

class SpotSlider extends StatelessWidget {
  const SpotSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimarycolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "SPOT-Me",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 23.r,
            color: kDefaultWhite,
          ),
        ),
        centerTitle: true,
        leading: Image.asset(
          'assets/images/back.png',
          width: 5.r,
          height: 13.r,
        ),
        actions: [],
      ),
    );
  }
}

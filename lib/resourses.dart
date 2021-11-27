import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotapp/constant.dart';

class Resources extends StatelessWidget {
  const Resources({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Resourses",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 23.r,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: Image.asset(
          'assets/images/back.png',
          width: 5.r,
          height: 13.r,
          color: Colors.black,
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 2.r, right: 2.r),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            Boxin(
              img: 'assets/images/8.png',
              text1: 'SPOT-Me',
              text2: 'By StephREDD ',
            ),
            Boxin(
              img: 'assets/images/7.png',
              text1: 'SPOT-Me',
              text2: 'By StephREDD ',
            ),
            Boxin(
              img: 'assets/images/6.png',
              text1: 'SPOT-Me',
              text2: 'By StephREDD ',
            ),
            Boxin(
              img: 'assets/images/5.png',
              text1: 'SPOT-Me',
              text2: 'By StephREDD ',
            ),
            Boxin(
              img: 'assets/images/4.png',
              text1: 'SPOT-Me',
              text2: 'By StephREDD ',
            ),
            Boxin(
              img: 'assets/images/3.png',
              text1: 'SPOT-Me',
              text2: 'By StephREDD ',
            ),
            Boxin(
              img: 'assets/images/2.png',
              text1: 'SPOT-Me',
              text2: 'By StephREDD ',
            ),
            Boxin(
              img: 'assets/images/1.png',
              text1: 'SPOT-Me',
              text2: 'By StephREDD ',
            ),
            Boxin(
              img: 'assets/images/8.png',
              text1: 'SPOT-Me',
              text2: 'By StephREDD ',
            ),
          ],
        ),
      ),
    );
  }
}

class Boxin extends StatelessWidget {
  Boxin({
    Key? key,
    required this.img,
    required this.text1,
    required this.text2,
  }) : super(key: key);
  String img;
  String text1;
  String text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Image.asset(
            img,
            width: 100.r,
            height: 160.r,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          height: 5.r,
        ),
        Container(
          child: Text(
            text1,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 10.0.r,
              height: 13 / 10.0,
              color: Colors.black,
            ),
          ),
        ),
        Container(
          child: Text(
            text2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 8.0.r,
              height: 13 / 7.0,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

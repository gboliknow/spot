import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotapp/constant.dart';

import 'package:spotapp/spot.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 99.r,
          ),
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: RichText(
                text: TextSpan(
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 25.0.r,
                      height: 32 / 24.0,
                      color: kDefaultWhite,
                    ),
                    children: [
                  TextSpan(text: "Genius"),
                  TextSpan(
                    text: "PARK",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0.r,
                      height: 32 / 24.0,
                      color: kDefaultWhite,
                    ),
                  ),
                ])),
          ),
          SizedBox(
            height: 9.r,
          ),
          Padding(
            padding: EdgeInsets.only(left: 51.r, right: 51.r),
            child: Text(
              "Meditation is an approach to training the mind, similar to the way that fitness is an approach to training the body. . ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14.0.r,
                  height: 23 / 12.0,
                  color: kDefaultWhite,
                  letterSpacing: -0.3),
            ),
          ),
          Spacer(),
          PrimaryButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardView()),
                );
              },
              color: kDefaultWhite,
              color1: Colors.black,
              text: "Get started"),
          SizedBox(
            height: 14.4,
          ),
        ],
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.color,
    this.color1,
  }) : super(key: key);
  Function? onPressed;
  Color? color;
  Color? color1;
  String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => onPressed?.call(),
        child: Container(
            width: 300.r,
            height: 45.r,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                color: color ?? Colors.black),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.r,
                  color: color1 ?? kDefaultWhite,
                ),
              ),
            )));
  }
}

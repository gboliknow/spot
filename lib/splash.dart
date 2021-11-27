import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotapp/complex.dart';
import 'package:spotapp/constant.dart';
import 'package:spotapp/resourses.dart';

import 'package:spotapp/start.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Start()),
                );
              },
              child: Image.asset(
                'assets/images/logo.png',
                width: 124.r,
                height: 125.r,
              ),
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
          ],
        ),
      ),
    );
  }
}

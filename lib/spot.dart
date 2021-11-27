import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotapp/constant.dart';
import 'package:spotapp/resourses.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  _OnboardViewState createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  Position? currentPosition;
  String? positionText;

  void getPositionText(Position currentPosition) {
    switch (currentPosition) {
      case Position.first:
        positionText =
            'Podcasts helps to train the mind, similar to the way that'
            ' fitness is an approach to training the body.';
        break;
      case Position.second:
        positionText =
            'Meditation is an approach to training the mind, similar to'
            ' the way that fitness is an approach to training the body.';
        break;
      case Position.third:
        positionText =
            'SPOT Me is an approach to training the mind, similar to '
            'the way that fitness is an approach to training the body.';
        break;
    }
  }

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectViews(
              onChanged: (value) {
                setState(() {
                  currentPosition = value;
                  getPositionText(currentPosition!);
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                selectedChangeContainer(
                  isSelected: currentPosition == Position.first ? true : false,
                ),
                SizedBox(
                  width: 10,
                ),
                selectedChangeContainer(
                  isSelected: currentPosition == Position.second ? true : false,
                ),
                SizedBox(
                  width: 10,
                ),
                selectedChangeContainer(
                  isSelected: currentPosition == Position.third ? true : false,
                ),
              ],
            ),
            SizedBox(
              height: 99.r,
            ),
            Text(
              "SPOT-Me",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25.0.r,
                height: 32 / 24.0,
                color: kDefaultWhite,
              ),
            ),
            SizedBox(
              height: 9.r,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                '$positionText',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              height: 4.4,
            ),
            PrimaryButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Resources()),
                  );
                },
                text: "G started"),
            SizedBox(
              height: 14.4,
            ),
          ],
        ),
      ),
    );
  }

  Widget selectedChangeContainer({isSelected = false}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: 15,
      width: 30,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.black26,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

Widget showContainer({bool isSelected = false, Color? color}) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    height: isSelected ? 400 : 300,
    width: isSelected ? 250 : 150,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );
}

enum Position { first, second, third }

class SelectViews extends StatefulWidget {
  const SelectViews({Key? key, required this.onChanged}) : super(key: key);
  final ValueChanged<Position> onChanged;

  @override
  _SelectViewsState createState() => _SelectViewsState();
}

class _SelectViewsState extends State<SelectViews> {
  late ScrollController _scrollController;
  bool first = false;
  bool second = false;
  bool third = false;
  late Position currentPosition;

  List<Color> _colors =
      List.of([Colors.red, Colors.pink, Colors.greenAccent], growable: false);

  void switchColors(Position position) {
    switch (position) {
      case Position.first:
        _colors = [Colors.greenAccent, Colors.red, Colors.pink];
        break;
      case Position.second:
        _colors = [Colors.red, Colors.pink, Colors.greenAccent];
        break;
      case Position.third:
        _colors = [Colors.pink, Colors.greenAccent, Colors.red];
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    currentPosition = Position.second;
    _scrollController.addListener(() {
      setState(() {
        first = false;
        second = true;
        third = false;
      });
    });

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _scrollController.animateTo(
        (_scrollController.position.maxScrollExtent / 2) + 45.0,
        duration: Duration(microseconds: 100),
        curve: Curves.easeIn,
      );
      widget.onChanged(Position.second);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 420,
      width: double.infinity,
      child: GestureDetector(
        onHorizontalDragUpdate: (details) {
          print('position on x-axis: ${details.delta.dx}');
          var swipePosition;
          if (details.delta.dx <= -30 || details.delta.dx >= 30) {
            swipePosition = details.delta.dx;
          }

          if (swipePosition <= -13 && currentPosition == Position.second) {
            widget.onChanged(Position.third);
            currentPosition = Position.third;
          } else if (swipePosition <= -13 &&
              currentPosition == Position.first) {
            currentPosition = Position.second;
            widget.onChanged(Position.second);
          } else if (swipePosition >= 13 && currentPosition == Position.third) {
            widget.onChanged(Position.second);
            currentPosition = Position.second;
          } else if (swipePosition >= 13 &&
              currentPosition == Position.second) {
            widget.onChanged(Position.first);
            currentPosition = Position.first;
          }

          switchColors(currentPosition);

          // print(details.localPosition.dx);
          // print(details.localPosition.direction);
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: 30,
              ),
              showContainer(isSelected: first, color: _colors.first),
              SizedBox(
                width: 30,
              ),
              showContainer(isSelected: second, color: _colors.elementAt(1)),
              SizedBox(
                width: 30,
              ),
              showContainer(isSelected: third, color: _colors.last),
              SizedBox(
                width: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  PrimaryButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);
  Function? onPressed;
  String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => onPressed?.call(),
        child: Container(
            width: 212.r,
            height: 45.r,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18), color: Colors.black),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.r,
                  color: kDefaultWhite,
                ),
              ),
            )));
  }
}

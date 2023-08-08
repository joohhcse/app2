import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PlayScreen1 extends StatefulWidget {
  const PlayScreen1({Key? key}) : super(key: key);

  @override
  State<PlayScreen1> createState() => _PlayScreen1State();
}

class _PlayScreen1State extends State<PlayScreen1> {
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState(); // ➌ 부모 initState() 실행

    Timer.periodic(
      // ➍ Timer.periodic() 등록
      Duration(seconds: 5),
          (timer) {
        print('실행!');
        int? nextPage = pageController.page?.toInt();

        // ➋
        if (nextPage == null) {
          return;
        }
        // ➌
        if (nextPage == 4) {
          nextPage = 0;
        } else {
          nextPage++;
        }
        pageController.animateToPage(
          // ➍ 페이지 변경
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      // body: PageView(
      //   controller: pageController,
      //   children: [1, 2, 3] // ➋ 샘플 리스트 생성
      //       .map(
      //       // ➌ 위젯으로 매핑
      //         (number) => Image.asset(
      //       'asset/img/bgimg1/image_$number.jpg',
      //       fit: BoxFit.cover,
      //     ),
      //   ).toList(),
      // ),

        body: Stack(
          children: [
            PageView(
              controller: pageController,
              children: [1, 2, 3] // ➋ 샘플 리스트 생성
                  .map(
                // ➌ 위젯으로 매핑
                    (number) => Image.asset(
                  'asset/img/bgimg1/image_$number.jpg',
                  fit: BoxFit.cover,
                ),
              ).toList(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.black.withOpacity(0.5),
                child: DigitalClock(),
                  // Text(
                  //   'Swipe to navigate',
                  //   style: TextStyle(color: Colors.white),
                  // ),
              ),
            ),
          ],
        )
    );
  }
}

class DigitalClock extends StatefulWidget {
  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  late Timer _timer;
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _updateTime();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) => _updateTime());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateTime() {
    setState(() {
      _currentTime = DateFormat('HH:mm:ss').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
        Align(
            alignment: Alignment.bottomCenter,
            child: Container(
            padding: EdgeInsets.all(16),
            color: Colors.black.withOpacity(0.5),
            child: Text(
              _currentTime,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        )
      ],
    );
  }
}
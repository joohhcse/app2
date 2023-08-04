import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
      Duration(seconds: 15),
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

    return WillPopScope(
      onWillPop: () {
        setState(() {
        });
        return Future(() => false);
      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('PlayScreen_AppBar'),
        // ),
        body: PageView(
          controller: pageController,
          // ➊ PageView 추가
          children: [1, 2, 3] // ➋ 샘플 리스트 생성
              .map(
            // ➌ 위젯으로 매핑
                (number) => Image.asset(
              'asset/img/bgimg1/image_$number.jpg',
              fit: BoxFit.cover,
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}

class DigitalClock extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
      DateTime now = DateTime.now();
      String formattedTime = DateFormat.Hms().format(now);
      return Text(
        formattedTime,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      );
    });
  }
}

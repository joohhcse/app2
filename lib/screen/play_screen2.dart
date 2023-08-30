import 'dart:async';
import 'package:app2/screen/play_screen1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PlayScreen2 extends StatefulWidget {
  const PlayScreen2({Key? key}) : super(key: key);

  @override
  State<PlayScreen2> createState() => _PlayScreen2State();
}

class _PlayScreen2State extends State<PlayScreen2> {
  final PageController pageController = PageController();

  int ratio = 1;

  @override
  void initState() {
    super.initState(); // ➌ 부모 initState() 실행

    Timer.periodic(
      // ➍ Timer.periodic() 등록
      Duration(seconds: 1),
          (timer) {
        print('실행!');
        int? nextPage = pageController.page?.toInt();
        if (nextPage == null) {
          return;
        }

        if (nextPage == 2) {
          ratio = -1;
          nextPage += ratio;
        }
        else if (nextPage == 0) {
          ratio = 1;
          nextPage += ratio;
        }
        else {
          nextPage += ratio;
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

    //   return Scaffold(
    //     body: PageView(
    //       controller: pageController,
    //       // ➊ PageView 추가
    //       children: [1, 2, 3] // ➋ 샘플 리스트 생성
    //           .map(
    //         // ➌ 위젯으로 매핑
    //             (number) => Image.asset(
    //           'asset/img/bgimg2/image_$number.jpg',
    //           fit: BoxFit.cover,
    //         ),
    //       )
    //           .toList(),
    //     ),
    //   );
    // }

    return Scaffold(
        appBar: AppBar(
          title: Text('Model 2'),
        ),
        body: Stack(
          children: [
            PageView(
              controller: pageController,
              children: [1, 2, 3] // ➋ 샘플 리스트 생성
                  .map(
                // ➌ 위젯으로 매핑
                    (number) =>
                    Image.asset(
                      'asset/img/bgimg2/image_$number.jpg',
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
              ),
            ),
          ],
        )
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

}

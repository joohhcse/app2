import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class PlayScreen2 extends StatefulWidget {
  const PlayScreen2({Key? key}) : super(key: key);

  @override
  State<PlayScreen2> createState() => _PlayScreen2State();
}

class _PlayScreen2State extends State<PlayScreen2> {
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
              'asset/img/bgimg2/image_$number.jpg',
              fit: BoxFit.cover,
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}

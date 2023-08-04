import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _msg = 'Welcome to WillPopScope World';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        setState(() {
          _msg = "You cannot get out of here! lol";
        });
        return Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('AppBar'),
        ),
        body: SafeArea(
          top: true,
          bottom: false,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                icons(),
              ]
            ),
          ),
        ),
      ),
    );
  }
}

class CharacterButton extends StatelessWidget {
  final String character;
  final VoidCallback onPressed;

  CharacterButton({required this.character, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(character),
    );
  }
}

class icons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16.0),
        InkWell(
          onTap: () {
            // 모델 1 클릭 시 동작
            // _onModel1Clicked(context);
          },
          child: CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('asset/img/1.png'), // 모델 1 이미지 파일 경로
          ),
        ),
        const SizedBox(height: 16.0),
        InkWell(
          onTap: () {
            // 모델 1 클릭 시 동작
            // _onModel1Clicked(context);
          },
          child: CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('asset/img/2.png'), // 모델 1 이미지 파일 경로
          ),
        ),
        const SizedBox(height: 16.0),
        InkWell(
          onTap: () {
            // 모델 1 클릭 시 동작
            // _onModel1Clicked(context);
          },
          child: CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('asset/img/3.png'), // 모델 1 이미지 파일 경로
          ),
        ),
      ],
    );
  }


  // }  @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       const SizedBox(height: 16.0),
  //       Text('model 1'),
  //       const SizedBox(height: 16.0),
  //       Text('model 2'),
  //       const SizedBox(height: 16.0),
  //       Text('model 3'),
  //     ],
  //   );
  // }
}


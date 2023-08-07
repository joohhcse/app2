import 'package:app2/screen/play_screen1.dart';
import 'package:app2/screen/play_screen2.dart';
import 'package:app2/screen/play_screen3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Icons(),
              ]
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

class Icons extends StatelessWidget {
  const Icons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '- 선택해주세요 - ',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16.0),
        const SizedBox(height: 16.0),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlayScreen1(),
              ),
            );
          },
          child: CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('asset/img/1.png'), // 모델 1 이미지 파일 경로
          ),
        ),
        Text('model 1'),
        const SizedBox(height: 16.0),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlayScreen2(),
              ),
            );
          },
          child: CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('asset/img/2.png'), // 모델 1 이미지 파일 경로
          ),
        ),
        Text('model 2'),
        const SizedBox(height: 16.0),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlayScreen3(),
              ),
            );          },
          child: CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('asset/img/3.png'), // 모델 1 이미지 파일 경로
          ),
        ),
        Text('model 3'),
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


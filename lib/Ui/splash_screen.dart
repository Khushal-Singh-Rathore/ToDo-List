import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo/Ui/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'To',
            style: TextStyle(fontSize: 200, color: Colors.lime),
          ),
          Text('Dooo', style: TextStyle(fontSize: 100, color: Colors.blueGrey))
        ],
      )),
    );
  }
}

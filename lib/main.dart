import 'package:flutter/material.dart';
import 'package:sepedaan/screens/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sepedaan',
      theme: ThemeData(primarySwatch: Colors.orange, fontFamily: 'Biennale'),
      home: const OnBoardingScreen(),
    );
  }
}

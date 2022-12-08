import 'package:flutter/material.dart';
import 'package:http_started/src/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Http/Navigation Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF0D47A1),
        fontFamily: 'Pretendard',
      ),
      home: HomeScreen(),
    );
  }
}

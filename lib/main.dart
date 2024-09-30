import 'package:first/view/mainScreen.dart';
import 'package:first/view/spalshScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSplash = true;

  @override
  void initState() {
    super.initState();
    showSplashScreen();
  }

  void showSplashScreen() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UnSadApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isSplash ? splashScreen() : mainScreen(),
    );
  }
}

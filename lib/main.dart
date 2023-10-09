import 'package:app/screens/colorpage.dart';
import 'package:app/screens/splashscreen.dart';
import 'package:flutter/material.dart';

const   SAVE_KEY = 'User Logged in';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primary,
      ),
      home: SplashScreen(),
    );
  }
}
import 'package:app/main.dart';
import 'package:app/screens/homepage.dart';
import 'package:app/screens/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: 
      Image.asset('assets/images/Swiggy-logo.png'),
      ),
    );
  }

Future<void> GoToLogin() async{
  await Future.delayed(Duration(seconds: 3));
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => LoginPage()),);
}

Future<void> checkLoggedIn() async{
  final _sharedpref = await SharedPreferences.getInstance();
  final _userloggedin = _sharedpref.getBool(SAVE_KEY);

  if(_userloggedin == null || _userloggedin == false){
    GoToLogin();
  }
  else{
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => HomePage()));
  }
}
}
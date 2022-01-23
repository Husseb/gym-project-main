import 'package:flutter/material.dart';
import 'package:flutter_gym_app/ui/homePage.dart';
import 'package:splashscreen/splashscreen.dart';

class  SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 6,
      navigateAfterSeconds: HomePage(),
      title: Text(
        'Gym Excersise Progress',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.white),
      ),
      image: Image.asset('assets/images/logo2.png'),
      photoSize: 80,
      loadingText: Text(
        'welcome',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.white),
      ),
      imageBackground: AssetImage('assets/images/spash.jpg'),
      backgroundColor: Colors.white,
      loaderColor: Colors.red,
    );
  }
}

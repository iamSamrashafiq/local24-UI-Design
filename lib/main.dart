import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local24/Constant/App_Constant.dart';
import 'Routes/App_Routes.dart';
import 'Routes/Route_Constant.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local 24',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteConstant.initialRoute,
      onGenerateRoute: RouteGenerator.generateRoute,
      // home:CreateAccount(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, RouteConstant.introScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      body:Center(
        child: Container(
          // width: 300,
          child: Image.asset('assets/images/loca24_logo.png'),
        ),
      )
    );
  }
}


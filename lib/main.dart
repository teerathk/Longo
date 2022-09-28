import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'dart:developer' as developer;

import 'package:longo/pages/home_page.dart';
import 'package:longo/pages/login.dart';
  void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/" : (context) => LoginPage(),
        "/login" : (context) => LoginPage(),
        "/home" :(context) => HomePageD()
      },
    );
  }
}

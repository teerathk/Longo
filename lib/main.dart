import 'package:flutter/material.dart';
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
        "/" : (context) => loginPage(),
        "/login" : (context) => loginPage(),
        "/home" :(context) => HomePage()
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'package:longo/pages/Drawer.dart';

class HomePageD extends StatelessWidget {
  const HomePageD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 30;
    String name = "Codepur";

    return Scaffold(
      appBar: AppBar(
        title: Text("My First App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome  today $days  days in $name "),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}


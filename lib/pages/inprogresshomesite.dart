import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:longo/pages/dashboard.dart';
import 'package:longo/pages/forgot.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class inprogresshomesite extends StatelessWidget {
  const inprogresshomesite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userPhoto = "";
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Material(
        child: Scaffold(
          backgroundColor: const Color(0xffffffff),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            bottomOpacity: 0.0,
            elevation: 0.0,
            actions: [
              Container(
                margin: EdgeInsets.only(top: 10),
                width: screenWidth,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.only(left: 6),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(userPhoto == "" ? "assets/images/logo.png" : userPhoto),
                                )
                            ),
                          ),
                        ),
                      ),
                      // Flexible(
                      //   child: Padding(
                      //     padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      //     child:
                      //     Image.asset('assets/images/logo.png',width: 100,height: 100,),
                      //   ),
                      // ),
                      Flexible(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: IconButton(
                              icon: const Icon(Icons.menu_rounded),
                              padding: EdgeInsets.only(left: 0),
                              iconSize: 50,
                              color: Color(0xff0D529A),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(

          child: Padding(
          padding: EdgeInsets.all(30),

          child: Table(
          border:
          TableBorder(horizontalInside: BorderSide(color: Color(0xffF2F3F5)),),
          columnWidths: {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(7),
          2: FlexColumnWidth(2),
          },
          children: [
            TableRow(
              children: [
                const Text(
                  "In Pogress Homesite",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff0D529A),
                  ),
                ),
              //Container(Icon(Icons.check, color: Colors.grey)),
              ]
            ),
             TableRow(
                children: [
                  Container(
                    width: screenWidth,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 00),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff0D529A),
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                        onPressed: () {
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Align(
                                child: Text(
                                    "Site",
                                    style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xffffffff),
                                        fontFamily: 'RalewayLight')
                                ),
                                alignment: Alignment.center,
                              ),
                              Align(
                                child: Text(
                                    "Last Updated",
                                    style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xffffffff),
                                        fontFamily: 'RalewayLight')
                                ),
                                alignment: Alignment.center,
                              ),

                            ]
                        ),

                      ),
                    ),
                  ),
                ]
            ),
            TableRow(
                children: [
                  Container(
                    width: screenWidth,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 00),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffffffff),
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                        onPressed: () {
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Align(
                                child: Text(
                                    "342o",
                                    style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xff0D529A),
                                        fontFamily: 'RalewayLight')
                                ),
                                alignment: Alignment.center,
                              ),
                              Align(
                                child: Text(
                                    "02/09/2022",
                                    style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xff0D529A),
                                        fontFamily: 'RalewayLight')
                                ),
                                alignment: Alignment.center,
                              ),

                            ]
                        ),

                      ),
                    ),
                  ),
                ]
            ),
            TableRow(
                children: [
                  Container(
                    width: screenWidth,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 00),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffffffff),
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                        onPressed: () {
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Align(
                                child: Text(
                                    "342o",
                                    style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xff0D529A),
                                        fontFamily: 'RalewayLight')
                                ),
                                alignment: Alignment.center,
                              ),
                              Align(
                                child: Text(
                                    "02/09/2022",
                                    style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xff0D529A),
                                        fontFamily: 'RalewayLight')
                                ),
                                alignment: Alignment.center,
                              ),

                            ]
                        ),

                      ),
                    ),
                  ),
                ]
            ),
            TableRow(
                children: [
                  Container(
                    width: screenWidth,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 00),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffffffff),
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                        onPressed: () {
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Align(
                                child: Text(
                                    "342o",
                                    style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xff0D529A),
                                        fontFamily: 'RalewayLight')
                                ),
                                alignment: Alignment.center,
                              ),
                              Align(
                                child: Text(
                                    "02/09/2022",
                                    style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xff0D529A),
                                        fontFamily: 'RalewayLight')
                                ),
                                alignment: Alignment.center,
                              ),

                            ]
                        ),

                      ),
                    ),
                  ),
                ]
            ),
            TableRow(
                children: [
                  Container(
                    width: screenWidth,
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 00),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffffffff),
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                        onPressed: () {
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Align(
                                child: Text(
                                    "342o",
                                    style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xff0D529A),
                                        fontFamily: 'RalewayLight')
                                ),
                                alignment: Alignment.center,
                              ),
                              Align(
                                child: Text(
                                    "02/09/2022",
                                    style: TextStyle(
                                      //fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xff0D529A),
                                        fontFamily: 'RalewayLight')
                                ),
                                alignment: Alignment.center,
                              ),

                            ]
                        ),

                      ),
                    ),
                  ),
                ]
            ),


          ]
      ),
    ),
    ),

        ),
    );
  }
}




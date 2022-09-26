import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:longo/pages/dashboard.dart';
import 'package:longo/pages/forgot.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class resetpassword extends StatelessWidget {
  const resetpassword ({Key? key}) : super(key: key);

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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                  ),
                  const Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 40,
                      color: Color(0xff0D529A),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    //apply padding to all four sides
                    child: Text(
                      "New Password:",
                      style: TextStyle(
                        fontSize: 16,
                        height: 0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  TextFormField(
                    //autofocus: true,
                    style: TextStyle(
                      color: Color(0xff0D529A),
                    ),
                    decoration: const InputDecoration(
                      hintText: "******",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.all(20),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelText: "",
                      suffixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 12.0),
                        child: Icon(Icons.remove_red_eye, color: Colors.grey),
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    //apply padding to all four sides
                    child: Text(
                      "Confirm New Password:",
                      style: TextStyle(
                        fontSize: 16,
                        height: 0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  TextFormField(
                    //autofocus: true,
                    style: TextStyle(
                      color: Color(0xff0D529A),
                    ),
                    decoration: const InputDecoration(
                      hintText: "******",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.all(20),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      labelText: "",
                      suffixIcon: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 12.0),
                        child: Icon(Icons.remove_red_eye, color: Colors.grey),
                      ),
                    ),
                  ),

                  Container(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    width: screenWidth,
                    color: Colors.white,
                    //width: MediaQuery.of(context).size.width * 0.5, // Will take 50% of screen space
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff0D529A),
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                      onPressed: () {
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ]
            ),
          ),
        ),

      ),
    );
  }
}




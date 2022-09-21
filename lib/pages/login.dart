import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:longo/pages/forgot.dart';

class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var inputLabelStyle = const TextStyle(fontSize: 10,height: 0,color: const Color(0xff202020),);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final TextEditingController emailController = new TextEditingController();
    final TextEditingController passwordController = new TextEditingController();

    return Material(

      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome to \nLongo Corporation!",
                style: TextStyle(
                  fontSize: 40,
                  color: Color(0xff0D529A),
                ),


              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20), //apply padding to all four sides
                child: Text(
                  "Sign in to your account.",
                  style: TextStyle(
                    fontSize: 15,
                    height: 2.5,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 15), //apply padding to all four sides
                child: Text(
                  "Email Address",
                  style: TextStyle(
                    fontSize: 10,
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
                  hintText: "user@example.com",
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
                  filled: true,
                  fillColor: Color(0xffF2F3F5),
                  floatingLabelBehavior:FloatingLabelBehavior.always,
                  labelText: "",
                  suffixIcon: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 12.0),
                    child: Icon(Icons.check, color: Colors.grey),
                  ),
                ),
              ),
              Container(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5), //apply padding to all four sides
                      child: Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 11,
                          height: 0,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.grey,
                          textStyle: const TextStyle(
                              fontSize: 11,
                              height: 0,
                              color: Colors.red
                          ),
                        ),
                        onPressed: (){
                          Navigator .push(
                              context, MaterialPageRoute(
                              builder: (context) => forgotPage()
                          )); },
                        child: const Text('Forgot Password?'),
                      ),
                    ),
                  ]
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "******",
                  filled: true,
                  fillColor: Color(0xffF2F3F5),
                  hintStyle: const TextStyle(
                      fontSize: 17.0,
                      color: Colors.grey
                  ),
                  contentPadding: const EdgeInsets.all(20),
                  labelStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 17,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 5.0),
                    child: IconButton(
                        icon: Icon(
                            Icons.remove_red_eye_outlined,
                        color: Colors.grey,),
                        onPressed: () {

                        }),
                  ),

                ),

              ),
              Container(
                height: 20,
              ),

              Center(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: screenHeight/3,
                  //height: MediaQuery.of(context).size.height * 0.4,
                  width: screenWidth,
                  color: Colors.white,
                  //width: MediaQuery.of(context).size.width * 0.5, // Will take 50% of screen space
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff0D529A),
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}

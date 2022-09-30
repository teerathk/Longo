import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:longo/pages/dashboard.dart';
import 'package:longo/pages/forgot.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String loginstatus = '';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // final prefs = SharedPreferences.getInstance();

  bool _isLoading = false;
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      // _isLoading = true;
      _passwordVisible = false;

    });

    checkLogin();

    // var loginstatus = _prefs.then((SharedPreferences prefs) {
    //   return prefs.getBool('Login') ?? false;
    // });
    //
    // if(loginstatus=="true" || loginstatus=="1"){
    //   Fluttertoast.showToast(
    //       msg: "Already LoggedIn",
    //       toastLength: Toast.LENGTH_LONG,
    //       gravity: ToastGravity.TOP,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.green,
    //       textColor: Colors.white,
    //       fontSize: 16.0
    //   );
    //
    // } else {
    //   Fluttertoast.showToast(
    //       msg: "No Not logged In",
    //       toastLength: Toast.LENGTH_LONG,
    //       gravity: ToastGravity.TOP,
    //       timeInSecForIosWeb: 1,
    //       backgroundColor: Colors.yellow,
    //       textColor: Colors.white,
    //       fontSize: 16.0
    //   );
    //
    // }
  }

  bool _passwordVisible = false;
  bool validemail = false;

  bool emailClicked = false;
  Future<bool> validatePass(String text) async {
    setState(() {
      if(!text.isEmpty){
        emailClicked = true;
      } else {
        emailClicked = false;
      }
    });
    return true;
  }
  Future<bool> validateEmail(String text) async {

    setState(() {
      validemail = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(text);
    });
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(text);
  }

  checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("Login") == true) {
      Fluttertoast.showToast(
          msg: "Already LoggedIn",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      setState(() {
        _isLoading = false;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  signIn(String email, pass) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoading = true;
    });
    var jsonResponse = null;
    final queryParameters = {'action': 'login', 'user': email, 'pass': pass};
    // var url = Uri.http('longonew.plego.pro', '/api.php', queryParameters);
    // var url = Uri.http('127.0.0.1', '/Plego/Longo/jobs/api.php', queryParameters);
    var url =
        Uri.https('www.longocorporation.com', '/jobs/api.php', queryParameters);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        var message = jsonResponse['message'];
        if (jsonResponse['success'] == true) {
          var message = jsonResponse['message'];

          prefs.setBool("Login", true);
          prefs.setString("UserId", message['employeeId']);
          var FullName = message['firstName'] + " " + message["lastName"];
          prefs.setString("Name", FullName);
          prefs.setString("Email", message['emailAddress']);

          Fluttertoast.showToast(
              msg: email + "\nLogged In Successfully",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);

          Navigator.pushNamedAndRemoveUntil(context, "/dashboard", (route) => false);
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => Dashboard()));

        } else {
          Fluttertoast.showToast(
              msg: "Sorry, try again\n$message",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        // print(response.body);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      Fluttertoast.showToast(
          msg: "Message2: " + response.body,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    var inputLabelStyle = const TextStyle(
      fontSize: 10,
      height: 0,
      color: const Color(0xff202020),
    );
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 30,
              ),
              const Text(
                "Welcome to \nLongo Corporation!",
                style: TextStyle(
                  fontSize: 36,
                  color: Color(0xff0D529A),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20,),
                //apply padding to all four sides
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
                padding: EdgeInsets.only(bottom: 15),
                //apply padding to all four sides
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
                controller: emailController,
                //autofocus: true,
                style: TextStyle(
                  color: Color(0xff0D529A),
                ),
                onChanged: (text){ validateEmail(text); },
                decoration: InputDecoration(
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
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: "",
                  suffixIcon: Padding(
                    padding: EdgeInsetsDirectional.only(end: 12.0),
                    child: Icon(Icons.check_circle, color: validemail==true ? Theme.of(context).primaryColorDark : Colors.black12),

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
                      padding: EdgeInsets.only(bottom: 0),
                      //apply padding to all four sides
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
                      padding: EdgeInsets.only(bottom: 0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.grey,
                          textStyle: const TextStyle(
                              fontSize: 11, height: 0, color: Colors.red),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPage()));
                        },
                        child: const Text('Forgot Password?'),
                      ),
                    ),
                  ]),
              TextFormField(
                controller: passwordController,
                //autofocus: true,
                obscureText: !_passwordVisible,
                onChanged: (text){ validatePass(text); },
                style: TextStyle(
                  color: Color(0xff0D529A),
                ),
                decoration: InputDecoration(
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
                  filled: true,
                  fillColor: Color(0xffF2F3F5),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: "",
                    suffixIcon: IconButton(
                      padding: EdgeInsetsDirectional.only(end: 12.0),
                      icon: Icon(
                        // Based on passwordVisible state choose the icon

                        _passwordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: emailClicked ==true ? Theme.of(context).primaryColorDark : Colors.black12,
                      ),
                      onPressed: () {
                        // Update the state i.e. toogle the state of passwordVisible variable
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),



                ),
              ),
              Container(
                height: 10,
              ),
              Center(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  height: screenHeight / 3,
                  //height: MediaQuery.of(context).size.height * 0.4,
                  width: screenWidth,
                  color: Colors.white,
                  //width: MediaQuery.of(context).size.width * 0.5, // Will take 50% of screen space
                  child: _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff0D529A),
                            minimumSize: const Size.fromHeight(50), // NEW
                          ),
                          onPressed: () {
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Please enter Email and Password",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else if (RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(emailController.text) ==
                                false) {
                              Fluttertoast.showToast(
                                  msg: "Please enter a valid email",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.TOP,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              signIn(emailController.text,
                                  passwordController.text);
                            }
                            // Fluttertoast.showToast(
                            //     msg: "Congratulations, (" +
                            //         (emailController.text) +
                            //         ") Logged In Successfully",
                            //     toastLength: Toast.LENGTH_LONG,
                            //     gravity: ToastGravity.CENTER,
                            //     timeInSecForIosWeb: 1,
                            //     backgroundColor: Colors.green,
                            //     textColor: Colors.white,
                            //     fontSize: 16.0);
                            // Navigator .push(
                            //     context, MaterialPageRoute(
                            //     builder: (context) => dashboardPage()
                            // ));
                          },
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

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

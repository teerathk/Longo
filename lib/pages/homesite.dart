import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:longo/pages/homechecklist.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Drawer.dart';

class HomeSite extends StatefulWidget {
  const HomeSite({Key? key}) : super(key: key);

  @override
  HomeSitePage createState() => HomeSitePage();
}

class HomeSitePage extends State<HomeSite> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController homesitetitle = new TextEditingController();
  var FullName = "";
  @override
  void initState() {
    super.initState();
    setState(() {
      // _isLoading = true;
    });

    checkLogin(); //call it over here
  }
  checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Debug: "+prefs.getBool("Login").toString());
    print("Debug: "+prefs.getString("Name").toString());
    // Fluttertoast.showToast(
    //     msg: "Lets See $prefs",
    //     toastLength: Toast.LENGTH_LONG,
    //     gravity: ToastGravity.TOP,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.green,
    //     textColor: Colors.white,
    //     fontSize: 16.0);

    if (prefs.getBool("Login") == true) {
      // FullName = prefs.getString("Name").toString();

      setState(() {
        // _isLoading = false;
        FullName = "Hi " +
            (prefs.getString("Name").toString()) +
            " \nEnter Homesite Address below";
      });
    } else {
      setState(() {
        // _isLoading = false;
        FullName = "Hi,\nEnter Homesite Address below";
      });
    }
  }

  addHomesite(String homesitetext) async {
    final SharedPreferences prefs = await _prefs;
    var jsonResponse = null;

    final queryParameters = {
      'action': 'addCategory',
      'category': 'homesite',
      'title': homesitetext
    };
    var url =
        Uri.https('www.longocorporation.com', '/jobs/api.php', queryParameters);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          // _isLoading = false;
        });
        var message = jsonResponse['message'];
        if (jsonResponse['success'] == true) {
          var message = jsonResponse['message'];
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("homesiteid", message);
          if(prefs.containsKey("skirtingid")){
            prefs.setString("skirtingid","0");
          }
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomeCheckList()));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    String userPhoto = "";
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final globalKey = GlobalKey<ScaffoldState>();

    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: new MyDrawer(),
        backgroundColor: const Color(0xffffffff),
        resizeToAvoidBottomInset: false,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
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
                                image: AssetImage ('assets/images/logo.png'),
                              )),
                        ),
                      ),
                    ),
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
                            onPressed: () =>
                                _scaffoldKey.currentState?.openDrawer(),
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
            child: SizedBox(
                height: screenHeight / 1.2,
                child: Column(
                  children: [
                    Expanded(
                        flex: 14,
                        child: Container(
                          width: screenWidth,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                FullName,
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Color(0xff0D529A),
                                ),
                                textAlign: TextAlign.left,
                              ),
                              // const Text(
                              //   FullName.isEmpty ? FullName.toString() : "",
                              //   style: TextStyle(
                              //     fontSize: 40,
                              //     color: Color(0xff0D529A),
                              //   ),
                              //   textAlign: TextAlign.left,
                              //
                              // ),
                              // const Padding(
                              //   padding: EdgeInsets.only(bottom: 20), //apply padding to all four sides
                              //   child: Text(
                              //     "Enter your email address and we’ll send you instructions to reset your password.",
                              //     style: TextStyle(
                              //       fontSize: 15,
                              //       height: 1.5,
                              //       color: Color(0x70202020),
                              //     ),
                              //     textAlign: TextAlign.left,
                              //   ),
                              //
                              // ),
                              Container(
                                height: 30,
                              ),
                              Container(height: 20),
                              // const Padding(
                              //   padding: EdgeInsets.only(bottom: 10), //apply padding to all four sides
                              //   child: Text(
                              //     "Home Site",
                              //     style: TextStyle(
                              //       fontSize: 14,
                              //       height: 0,
                              //       color: Color(0x60202020),
                              //     ),
                              //     textAlign: TextAlign.left,
                              //   ),
                              //
                              // ),
                              TextFormField(
                                controller: homesitetitle,
                                // focusNode: f1,
                                // controller: txtEmail,
                                style: TextStyle(
                                  color: Color(0xff0D529A),
                                ),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(20),
                                  labelStyle: TextStyle(
                                    color: Color(0xff051C48),
                                    fontSize: 11,
                                    fontFamily: 'AvenirLight',
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xffF2F3F5),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  labelText: "",
                                  hintText: "",
                                  hintStyle: TextStyle(
                                      fontSize: 16.0, color: Color(0xff051C48)),
                                  // suffixIcon: Padding(
                                  //   padding: const EdgeInsetsDirectional.only(end: 12.0),
                                  //   child: Icon(Icons.place, color: Color(0xff051C48),), // myIcon is a 48px-wide widget.
                                  // ),
                                ),
                              ),
                              Container(
                                height: 30,
                              ),
                              Container(
                                alignment: Alignment.bottomCenter,
                                //height: screenHeight/3,
                                //height: MediaQuery.of(context).size.height * 0.4,
                                width: screenWidth,
                                color: Colors.white,
                                //width: MediaQuery.of(context).size.width * 0.5, // Will take 50% of screen space
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xff0D529A),
                                    minimumSize:
                                        const Size.fromHeight(50), // NEW
                                  ),
                                  onPressed: () {
                                    addHomesite(homesitetitle.text);
                                  },
                                  child: const Text(
                                    'Next',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

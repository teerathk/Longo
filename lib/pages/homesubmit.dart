import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:longo/pages/dashboard.dart';
import 'package:longo/pages/forgot.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeSubmit extends StatefulWidget {
  @override
  HomeSubmitPage createState() => HomeSubmitPage();
}

class HomeSubmitPage extends State<HomeSubmit> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController CrewLeaderController =
      new TextEditingController();
  final TextEditingController DateSubmissionController =
      new TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });

    getCompleteStatus(); //call it over here
  }

  submit(String crewleader, String submissiondate) async {
    var jsonResponse = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var homesiteid = "0";
    if (prefs.containsKey("homesiteid") &&
        prefs.containsKey("homesiteid") != "0") {
      homesiteid = prefs.getString("homesiteid").toString();
    } else if (prefs.containsKey("skirtingid")) {
      homesiteid = prefs.getString("skirtingid").toString();
    }

    final queryParameters = {
      'action': 'submitsite',
      'category_id': homesiteid,
      'crew_leader': crewleader,
      'submission': submissiondate
    };
    //submission="+submission+"&crew_leader="+crew_leader+"&home_site="+home_site+"&name="+site_name+"&category="+category
    var url =
        Uri.https('www.longocorporation.com', '/jobs/api.php', queryParameters);
    var response = await http.get(url);
    // var jsonStr = response.body.toString();
    print("Message: -"+(response.statusCode.toString())+" - "+response.body.toString());
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        if (jsonResponse['success'] == true) {
          Fluttertoast.showToast(
              msg: "Submitted Successfully",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => dashboardPage()));
          setState(() {
            // _isLoading = false;
          });
        }
      }
    }
  }

  bool IsCompleted = false;

  getCompleteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("IsComplete") == true) {
      IsCompleted = true;
      // Fluttertoast.showToast(
      //     msg: "Completed",
      //     toastLength: Toast.LENGTH_LONG,
      //     gravity: ToastGravity.TOP,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.green,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    } else {
      // Fluttertoast.showToast(
      //     msg: "Not Complete",
      //     toastLength: Toast.LENGTH_LONG,
      //     gravity: ToastGravity.TOP,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }

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
                                image: NetworkImage(userPhoto == ""
                                    ? "assets/images/logo.png"
                                    : userPhoto),
                              )),
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 15),
                //apply padding to all four sides
                child: Text(
                  "Crew leader:",
                  style: TextStyle(
                    fontSize: 16,
                    height: 0,
                    color: Colors.grey,
                  ),
                ),
              ),
              TextFormField(
                controller: CrewLeaderController,
                //autofocus: true,
                style: TextStyle(
                  color: Color(0xff0D529A),
                ),
                decoration: const InputDecoration(
                  // hintText: "user@example.com",
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
                  // suffixIcon: Padding(
                  //   padding: const EdgeInsetsDirectional.only(end: 12.0),
                  //   child: Icon(Icons.check, color: Colors.grey),
                  // ),
                ),
              ),
              Container(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 15),
                //apply padding to all four sides
                child: Text(
                  "Date:",
                  style: TextStyle(
                    fontSize: 16,
                    height: 0,
                    color: Colors.grey,
                  ),
                ),
              ),
              TextFormField(
                controller: DateSubmissionController,
                //autofocus: true,
                style: TextStyle(
                  color: Color(0xff0D529A),
                ),
                decoration: const InputDecoration(
                  hintText: "mm/dd/yyyy",
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
                    child: Icon(Icons.check, color: Colors.grey),
                  ),
                ),
              ),
              Container(
                height: 30,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                //height: screenHeight / 3,
                //height: MediaQuery.of(context).size.height * 0.4,
                width: screenWidth,
                color: Colors.white,
                //width: MediaQuery.of(context).size.width * 0.5, // Will take 50% of screen space
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff0D529A),
                    minimumSize: const Size.fromHeight(50), // NEW
                  ),
                  onPressed: () {
                    if (IsCompleted) {
                      submit(CrewLeaderController.text,
                          DateSubmissionController.text);
                    } else {
                      Fluttertoast.showToast(
                          msg:
                              "Please check all the checkboxes before you save the report.",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 22.0);
                    }
                  },
                  child: const Text(
                    'Submit',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

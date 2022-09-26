import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:longo/pages/homecomments.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeCheckList extends StatefulWidget {
  @override
  HomeCheckListPage createState() => HomeCheckListPage();
}

class Model {
  final String id;
  final String name;

  Model(this.id, this.name);
}

class HomeCheckListPage extends State<HomeCheckList> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    super.initState();
    getHomesiteOptions(); //call it over here
  }

  List<Model> myAllData = [];
  var ArrayList = null;
  var commentWidgets = <Widget>[];

  submitCheckbox(String id, bool check) async {
    var jsonResponse = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String checkstatus="0";
    if(check){
      checkstatus="1";
    }
    if(prefs.containsKey("homesiteid")){
      var homesiteid = prefs.getString("homesiteid");
      final queryParameters = {'action': 'setchecks', 'cat_id': homesiteid,'checkid':id, 'check':checkstatus};
      var url =
      Uri.https('www.longocorporation.com', '/jobs/api.php', queryParameters);
      var response = await http.get(url);
      var jsonStr = response.body.toString();
      if (response.statusCode == 200) {
        jsonResponse = json.decode(response.body);

        if (jsonResponse != null) {
          setState(() {
            // _isLoading = false;
          });
          if (jsonResponse['success'] == true) {
            Fluttertoast.showToast(
                msg: "Saved",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.TOP,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);

          }
        }
      }
    } else {
      Fluttertoast.showToast(
          msg: "Unable to save",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

    }


  }
  getHomesiteOptions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("homesiteid")) {
      var homesiteid = prefs.getString("homesiteid");
    }
      var jsonResponse = null;
    final queryParameters = {'action': 'getchecks', 'category': 'homesite', 'category_id':'0'};
    var url =
        Uri.https('www.longocorporation.com', '/jobs/api.php', queryParameters);
    // var url = Uri.https('127.0.0.1', '/jobs/api.php', queryParameters);
    // var url = Uri.http('longonew.plego.pro', '/api.php', queryParameters);
    var response = await http.get(url);
    var jsonStr = response.body.toString();
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        setState(() {
          // _isLoading = false;
        });
        var message = jsonResponse['message'];

        if (jsonResponse['success'] == true) {
          var message = jsonResponse['message'];
          debugPrint('message: $message');
          // var jsonBody = json.decode(message);
          for (var data in message) {
            bool checked = data['checked']==1 ? true : false;
            commentWidgets
                .add(checkItemBuilder(context, data['check_text'], data['id'], checked));
            // myAllData.add(Model(
            //     data['id'], data['check_text']));
          }
          // debugPrint('list: $myAllData');
          Fluttertoast.showToast(
              msg: "Received Checks",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          // Navigator .push(
          //     context, MaterialPageRoute(
          //     builder: (context) => dashboardPage()
          // ));

        } else {
          Fluttertoast.showToast(
              msg: "Sorry, try again\n$message",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        // print(response.body);
      }
    } else {
      setState(() {
        // _isLoading = false;
      });
      Fluttertoast.showToast(
          msg: "Message2: $jsonStr",
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
    String userPhoto = "";
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final globalKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        backgroundColor: const Color(0xfffafafa),
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
        body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 20,
                  ),
                  const Text(
                    "* Data is Autosaved",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0D529A),
                    ),
                    //textAlign: TextAlign.right
                  ),
                  Container(
                    height: 10,
                  ),
                  Text(
                    "*Upon submission, the data would not be displayed under the In Progress tab",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    //textAlign: TextAlign.left
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    // child: FractionallySizedBox(
                    //     widthFactor: 1.0,
                    //     child: Container(
                    //         height: 1,
                    //       color: Color(0xff0D529A),
                    //     )
                    // )
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              //height: screenHeight/1,
                              decoration: BoxDecoration(
                                color: const Color(0xfffafafa),
                                border: Border.all(
                                  width: 2,
                                  color: Color(0xff0D529A),
                                ),
                                borderRadius: BorderRadius.circular(8),
                                //border: Border.all(color: Theme.of(context).dividerColor, width: 1)
                              ),
                              child: Column(children: commentWidgets)))),
                  Container(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff0D529A),
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeComments()));
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ])));
  }

  Widget checkItemBuilder(@required BuildContext context, @required String text,
      @required String id,bool checked,
      {bool bottomBorder = true}) {

    return Container(
        decoration: bottomBorder
            ? BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Theme.of(context).dividerColor)))
            : null,
        child: Row(children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(8),
              child: StatefulBuilder(builder: (context, setState) {
                return Checkbox(
                    activeColor: Color(0xff0D529A),
                    value: checked,
                    onChanged: (newVal) {
                      setState(() {
                        checked = !checked;
                        submitCheckbox(id, checked);
                        Fluttertoast.showToast(

                            msg: "$id Checkbox: $checked",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    });
              })),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 10, 8),
                  child: Text(text)))
        ]));
  }
}

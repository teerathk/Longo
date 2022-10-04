import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:longo/pages/drawer.dart';
import 'package:longo/pages/forgot.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:longo/pages/skirtingchecklist.dart';
import 'package:longo/pages/skirtingsite.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homechecklist.dart';

class InprogressSkirting extends StatefulWidget {
  @override
  InprogressSkirtingPage createState() => InprogressSkirtingPage();
}

class Model {
  final String id;
  final String Site;
  final String datetime;

  Model(this.id, this.Site, this.datetime);
}
class InprogressSkirtingPage extends State<InprogressSkirting> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });

    getInprogressHomesite(); //call it over here
  }

  OpenInprogressPage(String id) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString("skirtingid", id);
    if(prefs.containsKey("homesiteid")){
      prefs.setString("homesiteid","0");
    }
    // Fluttertoast.showToast(
    //     msg: "Received Checks $id",
    //     toastLength: Toast.LENGTH_LONG,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.green,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
    //
    setState(() {
      _isLoading = false;
    });

    Navigator .push(
        context, MaterialPageRoute(
        builder: (context) => SkirtingCheckList()
    ));

  }
  var ArrayList = null;
  var commentWidgets = <Widget>[];
  var tablerowcustom = <TableRow>[];
  List<Model> myAllData = [];
  getInprogressHomesite() async {
    var jsonResponse = null;
    final queryParameters = {'action': 'getinprogress', 'cat_type': 'skirting'};
    //
    // tablerowcustom.add(getTableRowHeader());
    // tablerowcustom.add(addTableTitlesRow());
    // tablerowcustom.add(addTableRow("siteText", "dateText"));

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
          _isLoading = false;
        });
        var message = jsonResponse['message'];

        if (jsonResponse['success'] == true) {
          var message = jsonResponse['message'];
          debugPrint('message: $message');
          // var jsonBody = json.decode(message);
          for (var data in message) {

            // commentWidgets.add(checkItemBuilder(
            //     context, data['check_text'], data['id'], checked));
            myAllData.add(Model(
                data['id'], data['homesite'], data['submission']));
          }
          debugPrint('list: $myAllData');
          // Fluttertoast.showToast(
          //     msg: "Received Checks",
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
        _isLoading = false;
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

  TableRow getTableRowHeader() {
    return TableRow(children: [
      const Text(
        "In Pogress Homesite",
        style: TextStyle(
          fontSize: 20,
          color: Color(0xff0D529A),
        ),
      ),
      //Container(Icon(Icons.check, color: Colors.grey)),
    ]);
  }

  TableRow addTableTitlesRow() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return TableRow(children: [
      Container(
        width: screenWidth,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 00),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xff0D529A),
              minimumSize: const Size.fromHeight(50), // NEW
            ),
            onPressed: () {},
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    child: Text("Site",
                        style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xffffffff),
                            fontFamily: 'RalewayLight')),
                    alignment: Alignment.center,
                  ),
                  Align(
                    child: Text("Last Updated",
                        style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xffffffff),
                            fontFamily: 'RalewayLight')),
                    alignment: Alignment.center,
                  ),
                ]),
          ),
        ),
      ),
    ]);
  }

  TableRow addTableRow(String id, String siteText, String dateText) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return TableRow(children: [
      Container(
        width: screenWidth,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 00),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xffffffff),
              minimumSize: const Size.fromHeight(50), // NEW
            ),
            onPressed: () {
              OpenInprogressPage(id);

            },
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    child: Text(siteText,
                        style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xff0D529A),
                            fontFamily: 'RalewayLight')),
                    alignment: Alignment.center,
                  ),
                  Align(
                    child: Text(dateText,
                        style: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xff0D529A),
                            fontFamily: 'RalewayLight')),
                    alignment: Alignment.center,
                  ),
                ]),
          ),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    String userPhoto = "";
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Material(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: new MyDrawer(),
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
        body: _isLoading ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Table(
              border: TableBorder(
                horizontalInside: BorderSide(color: Color(0xffF2F3F5)),
              ),
              columnWidths: {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(7),
                2: FlexColumnWidth(2),
              },
              children: [
                TableRow(children: [
                  const Text(
                    "In Progress Skirting",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff0D529A),
                    ),
                  ),
                  //Container(Icon(Icons.check, color: Colors.grey)),
                ]),
                TableRow(children: [
                  Container(
                    width: screenWidth,
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 00),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff0D529A),
                          minimumSize: const Size.fromHeight(50), // NEW
                        ),
                        onPressed: () {},
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Align(
                                child: Text("Site",

                                    style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xffffffff),
                                        fontFamily: 'RalewayLight')),
                                alignment: Alignment.center,
                              ),
                              Align(
                                child: Text("Last Updated",
                                    style: TextStyle(
                                        //fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color(0xffffffff),
                                        fontFamily: 'RalewayLight')),
                                alignment: Alignment.center,
                              ),
                            ]),
                      ),
                    ),
                  ),
                ]),
                for(var item in myAllData )
                  addTableRow(item.id, item.Site, item.datetime)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

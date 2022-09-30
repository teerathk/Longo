import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:longo/pages/Drawer.dart';
import 'package:longo/pages/homesite.dart';
import 'package:longo/pages/inprogresshomesite.dart';
import 'package:longo/pages/inprogressskirting.dart';
import 'package:longo/pages/login.dart';
import 'package:longo/pages/skirtingsite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  // const Dashboard({Key? key}) : super(key: key);

  @override
  DashboardPage createState() => DashboardPage();
}

class DashboardPage extends State<Dashboard> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    Fluttertoast.showToast(
        msg: "Logout Successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  var _title = "Hi";

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to logout'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
              TextButton(
                onPressed: () => {
                  // Navigator.of(context).pop(true)
                  Logout()
                },
                child: new Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    String userPhoto = "";
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // final globalKey = GlobalKey<ScaffoldState>();
    return new WillPopScope(
        onWillPop: _onWillPop,
        child: MaterialApp(
          title: _title,
          home: Scaffold(
            key: _scaffoldKey,
            drawer: new MyDrawer(),
            // Drawer(
            //   child: ListView(
            //     padding: EdgeInsets.zero,
            //     children: [
            //       const DrawerHeader(
            //         decoration: BoxDecoration(
            //           color: Colors.black12,
            //         ),
            //         child: Text('Drawer Header'),
            //       ),
            //       ListTile(
            //         title: const Text('Item 1'),
            //         onTap: () {
            //
            //           _scaffoldKey.currentState?.openEndDrawer();
            //         },
            //       ),
            //       ListTile(
            //         title: const Text('Item 2'),
            //         onTap: () {
            //           // Update the state of the app
            //           // ...
            //           // Then close the drawer
            //           // Navigator.pop(context);
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            // appBar: AppBar(title: Text(_title)),
            backgroundColor: const Color(0xffffffff),
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: Text(_title),
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
                                    image: AssetImage('assets/images/logo.png'),
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
                        Container(
                          width: screenWidth,
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 00),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffF2F3F5),
                                minimumSize: const Size.fromHeight(50), // NEW
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeSite()));
                                //
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => HomeSite()));
                              },
                              child: Column(children: <Widget>[
                                Container(
                                  height: 30,
                                ),
                                Align(
                                  child: Text("Homesite",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Color(0xff0D529A),
                                          fontFamily: 'RalewayLight')),
                                  alignment: Alignment.center,
                                ),
                                Container(
                                  height: 30,
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          width: screenWidth,
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffffffff),
                                minimumSize: const Size.fromHeight(50), // NEW
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InprogressHomeSite()));
                              },
                              child: Column(children: <Widget>[
                                Container(
                                  height: 20,
                                ),
                                Align(
                                  child: Text("In Progress Homesite",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff0D529A),
                                          fontFamily: 'RalewayLight')),
                                  alignment: Alignment.center,
                                ),
                                Container(
                                  height: 20,
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          width: screenWidth,
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 00),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffF2F3F5),
                                minimumSize: const Size.fromHeight(50), // NEW
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SkirtingSite()));
                              },
                              child: Column(children: <Widget>[
                                Container(
                                  height: 30,
                                ),
                                Align(
                                  child: Text("Skirting",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Color(0xff0D529A),
                                          fontFamily: 'RalewayLight')),
                                  alignment: Alignment.center,
                                ),
                                Container(
                                  height: 30,
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ]),
                      TableRow(children: [
                        Container(
                          width: screenWidth,
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 30),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffffffff),
                                minimumSize: const Size.fromHeight(50), // NEW
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            InprogressSkirting()));
                              },
                              child: Column(children: <Widget>[
                                Container(
                                  height: 20,
                                ),
                                Align(
                                  child: Text("In Progress Skirting",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xff0D529A),
                                          fontFamily: 'RalewayLight')),
                                  alignment: Alignment.center,
                                ),
                                Container(
                                  height: 20,
                                ),
                              ]),
                            ),
                          ),
                        ),
                      ]),
                    ]),
              ),
            ),
          ),
        ));
  }
}

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
  @override
  void initState() {
    super.initState();
    setState(() {
      // _isLoading = true;
    });

    initSession(); //call it over here
  }
  var _title = "Hi";

  String name="";
  String email="";
  initSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("Login") == true) {
      // FullName = prefs.getString("Name").toString();

      setState(() {
        // _isLoading = false;
        name = prefs.getString("Name").toString();
        email = prefs.getString("Email").toString();
      });
    }

  }

  Future<bool> _onWillPop() async {
    // if (Navigator.of(context).userGestureInProgress)
    //   return false;
    // else
    //   return true;

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
                  Navigator.of(context).pop(true)
                  // Logout()
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
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: _title,
          home: Scaffold(
            key: _scaffoldKey,
            drawer: Drawer(
              child: ListView(
                children: [
                  // DrawerHeader(
                  //     child: Text("I am Habib",
                  //         style: TextStyle(color: Colors.white),),
                  //         decoration: BoxDecoration(color: Colors.indigo),
                  // ),
                  UserAccountsDrawerHeader(
                    accountName: Text(name), accountEmail: Text(email),
                    currentAccountPicture: CircleAvatar(
                      radius: 110,

                      backgroundImage: AssetImage('assets/images/logo.png'),
                      //backgroundImage: NetworkImage("https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.add_box_sharp),
                    title: Text("Dashboard"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Dashboard()));
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    //subtitle: Text("In Progress Homesite"),
                    //trailing: Icon(Icons.edit),
                  ),
                  ListTile(
                    leading: Icon(Icons.add_box_sharp),
                    title: Text("Homesite"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeSite()));
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    //subtitle: Text("In Progress Homesite"),
                    //trailing: Icon(Icons.edit),
                  ),
                  ListTile(
                    leading: Icon(Icons.add_box_sharp),
                    title: Text("Skirting"),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SkirtingSite()));
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    //subtitle: Text("In Progress Homesite"),
                    //trailing: Icon(Icons.edit),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text("Logout"),
                    //subtitle: Text("habib@plego.com"),
                    onTap: () {
                      Logout();
                    },
                  ),
                ],
              ),
            ),

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
        );
  }
}

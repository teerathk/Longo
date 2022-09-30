import 'package:flutter/material.dart';
import 'package:longo/pages/homesite.dart';
import 'package:longo/pages/dashboard.dart';
import 'package:longo/pages/skirtingsite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {

  @override
  MyDrawerPage createState() => MyDrawerPage();
}

class MyDrawerPage extends State<MyDrawer> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    super.initState();
    setState(() {
      // _isLoading = true;
    });

    initSession(); //call it over here
  }

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

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              //_scaffoldKey.currentState?.openEndDrawer();
            },
            //subtitle: Text("In Progress Homesite"),
            //trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Homesite"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomeSite()));
            },
            //subtitle: Text("In Progress Homesite"),
            //trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.place),
            title: Text("Skirting"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SkirtingSite()));
            },
            //subtitle: Text("In Progress Homesite"),
            //trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.email,color: Colors.white,),
            title: Text("Sign out"),
            //subtitle: Text("habib@plego.com"),
            trailing: Icon(Icons.logout),
    onTap: () {
             Navigator.pop(context);
             },
          ),
        ],
      ),
    );

    // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

  }
}

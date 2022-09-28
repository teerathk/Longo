import 'package:flutter/material.dart';

class  MyDrawer extends StatelessWidget {
  //const ({Key? key}) : super(key: key);

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
            accountName: Text("Habib Khaskhely"), accountEmail: Text("habib@plego.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80"),
            ),
          ),

          ListTile(
            leading: Icon(Icons.person),
            title: Text("Account"),
            subtitle: Text("Personal"),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("Email"),
            subtitle: Text("habib@plego.com"),
            trailing: Icon(Icons.send),
          ),
        ],
      ),
    );

    // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

  }
}

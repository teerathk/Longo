import 'package:flutter/material.dart';
import 'dart:math' as math;


class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffF2F3F5),
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                    child: Text(
                      "WHIZCRIBS",
                      style: TextStyle(
                        //color: DefThemeColor.defColor,
                        fontSize: 20,
                        letterSpacing: 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                  IconButton(
                    icon: Image.asset('assets/images/cross.png'),
                    iconSize: 25,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              title: Row(
                children: const [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                   // child: Icon(CupertinoIcons.home),
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                      color: Color(0x80051C48),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, '/dashboard');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              title: Row(
                children: const [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    //child: Icon(CupertinoIcons.gift),
                  ),
                  Text(
                    "Planned gifts",
                    style: TextStyle(
                      color: Color(0x80051C48),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, 'giftcard/giftcard-main');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              title: Row(
                children: const [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    //child: Icon(CupertinoIcons.share_up),
                  ),
                  Text(
                    "Refer",
                    style: TextStyle(
                      color: Color(0x80051C48),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushReplacementNamed(context, '/dashboard');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              title: Row(
                children: const [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    //child: Icon(CupertinoIcons.profile_circled),
                  ),
                  Text(
                    "Membership",
                    style: TextStyle(
                      color: Color(0x80051C48),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, 'membership/become-member'
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              title: Row(
                children: const [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    //child: Icon(CupertinoIcons.circle),
                  ),
                  Text(
                    "About us",
                    style: TextStyle(
                      color: Color(0x80051C48),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushReplacementNamed(context, '');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              title: Row(
                children: const [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    //child: Icon(CupertinoIcons.question_circle),
                  ),
                  Text(
                    "Support",
                    style: TextStyle(
                      color: Color(0x80051C48),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushReplacementNamed(context, '');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              title: Row(
                children: const [
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    //child: Icon(CupertinoIcons.settings),
                  ),
                  Text(
                    "Settings",
                    style: TextStyle(
                      color: Color(0x80051C48),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushReplacementNamed(context, '/setting');
              },
            ),
          ),
        ],
      ),
    );
  }
}

class GravityCompat {}

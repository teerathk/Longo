import 'package:flutter/material.dart';
import 'package:longo/pages/Drawer.dart';
import 'package:longo/pages/homesite.dart';
import 'package:longo/pages/skirtingsite.dart';

class dashboardPage extends StatelessWidget {
  const dashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userPhoto = "";
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final globalKey = GlobalKey<ScaffoldState>();

    return Material(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        resizeToAvoidBottomInset : false,
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
                padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 15),
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
                                image: NetworkImage(userPhoto == "" ? "assets/images/logo.png" : userPhoto),
                              )
                          ),
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
                            onPressed: () {
                              globalKey.currentState?.openEndDrawer();
                            },
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
        endDrawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Table(
              border:
              TableBorder(horizontalInside: BorderSide(color: Color(0xffF2F3F5)),),
              columnWidths: {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(7),
                2: FlexColumnWidth(2),
              },
                children: [
                  // TableRow(
                  //     children: [
                  //       Container(
                  //         width: screenWidth,
                  //         margin: EdgeInsets.fromLTRB(20, 10, 20, 00),
                  //         child: Padding(
                  //           padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  //           child: ElevatedButton(
                  //             style: ElevatedButton.styleFrom(
                  //               primary: Color(0xff0D529A),
                  //               minimumSize: const Size.fromHeight(50), // NEW
                  //             ),
                  //             onPressed: () {},
                  //             child: Column(
                  //                 children: <Widget>[
                  //                   Container(
                  //                     height: 30,
                  //                   ),
                  //                   Align(
                  //                     child: Text(
                  //                         "Looking to \nsend a giftcard?",
                  //                         style: TextStyle(
                  //                             fontWeight: FontWeight.bold,
                  //                             fontSize: 16,
                  //                             color: Color(0xffffffff),
                  //                             fontFamily: 'RalewayLight')
                  //                     ),
                  //                     alignment: Alignment.center,
                  //                   ),
                  //                   Container(
                  //                     height: 30,
                  //                   ),
                  //
                  //
                  //                 ]
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ]
                  // ),
                  TableRow(
                      children: [
                        Container(
                          width: screenWidth,
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 00),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffF2F3F5),
                                minimumSize: const Size.fromHeight(50), // NEW
                              ),
                              onPressed: () {
                                Navigator .push(
                                    context, MaterialPageRoute(
                                    builder: (context) => homesitePage()
                                ));
                              },
                              child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 30,
                                    ),
                                    Align(
                                      child: Text(
                                          "Homesite",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color(0xff0D529A),
                                              fontFamily: 'RalewayLight')
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                    Container(
                                      height: 30,
                                    ),
                                ]
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        Container(
                          width: screenWidth,
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 30),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffffffff),
                                minimumSize: const Size.fromHeight(50), // NEW
                              ),
                              onPressed: () {},
                              child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 20,
                                    ),
                                    Align(

                                      child: Text(
                                          "In Progress Homesite",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff0D529A),
                                              fontFamily: 'RalewayLight')
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                    Container(
                                      height: 20,
                                    ),
                                  ]
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),

                  TableRow(
                      children: [
                        Container(
                          width: screenWidth,
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 00),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffF2F3F5),
                                minimumSize: const Size.fromHeight(50), // NEW
                              ),
                              onPressed: () {
                                Navigator .push(
                                    context, MaterialPageRoute(
                                    builder: (context) => skirtingsitePage()
                                ));
                              },
                              child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 30,
                                    ),
                                    Align(
                                      child: Text(
                                          "Skirting",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color(0xff0D529A),
                                              fontFamily: 'RalewayLight')
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                    Container(
                                      height: 30,
                                    ),
                                  ]
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                  TableRow(
                      children: [
                        Container(
                          width: screenWidth,
                          margin: EdgeInsets.fromLTRB(20, 10, 20, 30),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffffffff),
                                minimumSize: const Size.fromHeight(50), // NEW
                              ),
                              onPressed: () {},
                              child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 20,
                                    ),
                                    Align(

                                      child: Text(
                                          "In Progress Skirting",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff0D529A),
                                              fontFamily: 'RalewayLight')
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                    Container(
                                      height: 20,
                                    ),
                                  ]
                              ),
                            ),
                          ),
                        ),
                      ]
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}

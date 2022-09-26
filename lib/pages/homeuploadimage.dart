import 'package:flutter/material.dart';


class homeuploadimgPage extends StatelessWidget {
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
        body: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 20,
                  ),
                  const Text(
                    "Images",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff0D529A),
                    ),
                    //textAlign: TextAlign.right
                  ),
                  Container(
                    height: 20,
                  ),
            Container(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(left: 6,bottom: 6),
                        decoration: BoxDecoration(
                          //shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(userPhoto == "" ? "assets/images/bg1.jpg" : userPhoto),
                            )
                        ),
                      ),
                      Positioned( //<-- SEE HERE
                        right: 0,
                        top: 0,
                        child: Container(
                          child: Positioned(
                              right: -1,
                              top: -10,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.highlight_remove_outlined,
                                    color: Color(0xff0D529A).withOpacity(0.5),
                                    size: 30,
                                  ),
                                  onPressed: ()  {
                                    // images.removeAt(index);
                                  })),
                        ),
                      ),
                    ],
                  ),

                  Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(left: 6,bottom: 6),
                        decoration: BoxDecoration(
                          //shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(userPhoto == "" ? "assets/images/bg1.jpg" : userPhoto),
                            )
                        ),
                      ),
                      Positioned( //<-- SEE HERE
                        right: 0,
                        top: 0,
                        child: Container(
                          child: Positioned(
                              right: -1,
                              top: -10,
                              child: IconButton(
                                  icon: Icon(
                                    Icons.highlight_remove_outlined,
                                    color: Color(0xff0D529A).withOpacity(0.5),
                                    size: 30,
                                  ),
                                  onPressed: ()  {
                                    // images.removeAt(index);
                                  })),
                        ),
                      ),
                    ],
                  ),
                  ]
            ),
            ),

                  const Text(
                    "Upload Images",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0x60202020),
                    ),
                    //textAlign: TextAlign.right
                  ),
                  Container(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child:
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
                                      "Click here to upload images",
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
                  ),
                  Container(
                    height: 10,
                  ),
                  const Text(
                    "File(s) Selected",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0x60202020),
                    ),
                    //textAlign: TextAlign.right
                  ),
                  Container(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff0D529A),
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {
                      // Navigator .push(
                      //     context, MaterialPageRoute(
                      //     builder: (context) => homechecklistPage()
                      // ));
                    },
                    child: const Text(
                      'Upload Images',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffF2F3F5),
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {
                      // Navigator .push(
                      //     context, MaterialPageRoute(
                      //     builder: (context) => homechecklistPage()
                      // ));
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 16,color: Color(0xff0D529A)),
                    ),
                  ),
                ]
            )
        )
    );
  }
}

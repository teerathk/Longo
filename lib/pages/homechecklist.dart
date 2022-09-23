import 'package:flutter/material.dart';
import 'package:longo/pages/homecomments.dart';

class homechecklistPage extends StatelessWidget {
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
                              child: Column(
                                  children: <Widget>[
                                    checkItemBuilder(context, " Foundation meets minimum HUD and manufacturer installation manual criteria"),
                                    checkItemBuilder(context, " Material in home removed & skirting is laid down"),
                                    checkItemBuilder(context, " Home is positioned properly on pad"),
                                    checkItemBuilder(context, " Piers laid out per manual and correct loading info, no broken blocks"),
                                    checkItemBuilder(context, " Cribbing Setup Properly"),
                                    checkItemBuilder(context, " Leveled to less than 1/4 of variance across all piers"),
                                    checkItemBuilder(context, " Floor, roof and wall fastening complete per installation manual instructions"),
                                    checkItemBuilder(context, " Roof has been inspected / repaired from shipping holes and any damage"),
                                    checkItemBuilder(context, " Furnace cap has been installed"),
                                    checkItemBuilder(context, " PVC drain lines have been connected to sewer with 1/4 / ft slope and cleanout"),
                                    checkItemBuilder(context, " Furnace condensation drain line run to exterior of skirting w/screen"),
                                    checkItemBuilder(context, " Dryer vent has been vented outside of skirt and supported"),
                                    checkItemBuilder(context, " Ground anchor system has been completed and properly tensioned per installation manual"),
                                    checkItemBuilder(context, " Marriage line piers installed as needed (openings 4ft or greater)"),
                                    checkItemBuilder(context, " Skirting, siding soffit and fascia compete on ends if applicable"),
                                    checkItemBuilder(context, " Exterior coach lights installed with bulb", bottomBorder: false)
                                  ]
                              )
                          )
                      )
                  ),
                  Container(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff0D529A),
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {
                      Navigator .push(
                          context, MaterialPageRoute(
                          builder: (context) => homecommentsPage()
                      ));
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ]
            )
        )
    );
  }

  Widget checkItemBuilder(@required BuildContext context, @required String text, {bool bottomBorder = true}) {
    bool checked = false;

    return Container(
        decoration: bottomBorder ? BoxDecoration(
            border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor))
        ) : null,
        child: Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8),
                  child: StatefulBuilder(
                      builder: (context, setState) {
                        return Checkbox(
                          activeColor: Color(0xff0D529A),
                            value: checked,
                            onChanged: (newVal) {
                              setState(() {
                                checked = !checked;
                              });
                            }
                        );
                      }
                  )
              ),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 10, 8),
                      child: Text(
                          text
                      )
                  )
              )
            ]
        )
    );
  }
}

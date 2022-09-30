import 'package:flutter/material.dart';
import 'package:longo/pages/homesite.dart';
import 'package:longo/pages/skirtingsite.dart';

class  LongoAppbar extends StatelessWidget {
  //const ({Key? key}) : super(key: key);
  var _title = "Hi";
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    double screenWidth = MediaQuery.of(context).size.width;
    return AppBar(
      key: _scaffoldKey,
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
    );

    // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

  }
}

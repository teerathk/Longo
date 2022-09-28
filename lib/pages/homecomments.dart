import 'package:flutter/material.dart';
import 'package:longo/pages/homeuploadimage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeComments extends StatefulWidget {
  @override
  HomeCommentsPage createState() => HomeCommentsPage();
}

class HomeCommentsPage extends State<HomeComments> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController CommentsController = new TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });
    getDBPosts(); //call it over here
  }

  var ArrayList = null;
  var commentWidgets = <Widget>[];

  submitComment(String comment) async {
    setState(() {
      _isLoading = true;
    });
    var jsonResponse = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var homesiteid = "0";
    if (prefs.containsKey("homesiteid") &&
        prefs.containsKey("homesiteid") != "0") {
      homesiteid = prefs.getString("homesiteid").toString();
    } else if (prefs.containsKey("skirtingid")) {
      homesiteid = prefs.getString("skirtingid").toString();
    }

    final queryParameters = {
      'action': 'setposts',
      'category_id': homesiteid,
      'post': comment
    };
    var url =
        Uri.https('www.longocorporation.com', '/jobs/api.php', queryParameters);
    var response = await http.get(url);
    var jsonStr = response.body.toString();
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);

      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        commentWidgets.add(getPosts(comment, "0"));
        if (jsonResponse['success'] == true) {
          CommentsController.clear();
          Fluttertoast.showToast(
              msg: "Posted Successfully",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    } else {
      setState(() {
        _isLoading = false;
      });

      Fluttertoast.showToast(
          msg: "Unable to post",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getDBPosts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String homesiteid = "0";
    if (prefs.containsKey("homesiteid")) {
      homesiteid = prefs.getString("homesiteid").toString();
    }

    var jsonResponse = null;
    final queryParameters = {'action': 'getposts', 'category_id': homesiteid};
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
            commentWidgets.add(getPosts(data['comment'], data['created_at']));
          }
        }
        // else {
        //   Fluttertoast.showToast(
        //       msg: "",
        //       toastLength: Toast.LENGTH_LONG,
        //       gravity: ToastGravity.CENTER,
        //       timeInSecForIosWeb: 1,
        //       backgroundColor: Colors.red,
        //       textColor: Colors.white,
        //       fontSize: 16.0);
        // }
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

  Widget getPosts(String comment, String datetime) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xffF2F3F5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            child: Text(datetime != "0" ? datetime : "Just posted...",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Color(0xff0D529A),
                    fontFamily: 'RalewayLight')),
            alignment: Alignment.centerLeft,
          ),
          Container(
            height: 10,
          ),
          Text(
            comment,
            style: TextStyle(
              fontSize: 14,
            ),
            //textAlign: TextAlign.left
          ),
        ],
      ),
    );
  }

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
                                image: NetworkImage(userPhoto == ""
                                    ? "assets/images/logo.png"
                                    : userPhoto),
                              )),
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
                            onPressed: () {},
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
                    "Comments",
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
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: _isLoading
                          ? <Widget>[Center(child: CircularProgressIndicator())]
                          : commentWidgets),
                  Container(
                    height: 30,
                  ),
                  const Text(
                    "Write your comments",
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
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: TextFormField(
                      controller: CommentsController,
                      minLines: 2,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          hintText: "Add a Comment!",
                          hintStyle: TextStyle(
                            color: Color(0x60202020),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          )),
                    ),
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
                      submitComment(CommentsController.text);
                      // Navigator .push(
                      //     context, MaterialPageRoute(
                      //     builder: (context) => homechecklistPage()
                      // ));
                    },
                    child: const Text(
                      'Post',
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeUploadImage()));
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 16, color: Color(0xff0D529A)),
                    ),
                  ),
                ])));
  }
}

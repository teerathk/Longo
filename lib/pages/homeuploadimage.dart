import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:ui';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:longo/pages/dashboard.dart';
import 'package:longo/pages/forgot.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:longo/pages/homesubmit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeUploadImage extends StatefulWidget {
  @override
  HomeUploadImagePage createState() => HomeUploadImagePage();
}

class HomeUploadImagePage extends State<HomeUploadImage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  File? selectedImage;
  var ImageWidgets = <Widget>[];

  @override
  void initState() {
    super.initState();
    setState(() {
      _isLoading = true;
    });

    getCategoryImage(); //call it over here
  }

  bool _isLoading=false;
  getCategoryImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var homesiteid;
    if (prefs.containsKey("homesiteid") && prefs.containsKey("homesiteid")!="0") {
      homesiteid = prefs.getString("homesiteid");
    } else if (prefs.containsKey("skirtingid")) {
      homesiteid = prefs.getString("skirtingid");
    }
    var jsonResponse = null;
    final queryParameters = {
      'action': 'getimages',
      'cat_id': homesiteid
    };
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
          print('message: $message');
          // var jsonBody = json.decode(message);
          for (var data in message) {

            ImageWidgets.add(addImageString(data));
          }
          // debugPrint('list: $myAllData');
          // Fluttertoast.showToast(
          //     msg: "Received Checks",
          //     toastLength: Toast.LENGTH_LONG,
          //     gravity: ToastGravity.CENTER,
          //     timeInSecForIosWeb: 1,
          //     backgroundColor: Colors.green,
          //     textColor: Colors.white,
          //     fontSize: 16.0);
          // Navigator .push(
          //     context, MaterialPageRoute(
          //     builder: (context) => dashboardPage()
          // ));

        }
        // else {
        //   Fluttertoast.showToast(
        //       msg: "Sorry, try again\n$message",
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

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    setState(() {

      selectedImage = imageTemp;
      ImageWidgets.add(addImageFile(selectedImage!));
      uploadImages(selectedImage!);
    });
    //return image;
  }

  uploadImages(File path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    var homesiteid;
    if (prefs.containsKey("homesiteid")) {
      homesiteid = prefs.getString("homesiteid");
    } else if (prefs.containsKey("skirtingid")) {
      homesiteid = prefs.getString("skirtingid");
    }
    var postUri = Uri.parse("https://www.longocorporation.com/jobs/api.php");
    var request = new http.MultipartRequest("POST", postUri);
    request.fields['action'] = 'uploadimage';
    request.fields['cat_id'] = homesiteid;
    request.files.add(
        http.MultipartFile.fromBytes(
            'image',
            File(path.path).readAsBytesSync(),
            filename: path.path.split("/").last
        )
    );
    //https://longocorporation.com/images/uploads/1664310058image_picker7304483645174969105.jpg
    // request.files.add(new http.MultipartFile.fromBytes(
    //     'image', await File(path).readAsBytes(),
    //     contentType: new MediaType('image', 'jpeg')));

    var jsonResponse = null;
    request.send().then((response) {
      if (response.statusCode == 200) {
        // final respStr = response.stream.bytesToString();
        // jsonResponse = json.decode(respStr.toString());
        print("Uploaded!");
        // print("Uploaded!: "+jsonResponse.toString());
        Fluttertoast.showToast(
            msg: "Uploaded Successfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

      }
    });
  }

  //resize the image
  Future<void> _getImage(BuildContext context) async {
    if (selectedImage != null) {
      var imageFile = selectedImage;
      /*var image = imageLib.decodeImage(imageFile.readAsBytesSync());
      fileName = basename(imageFile.path);
      image = imageLib.copyResize(image,
          width: (MediaQuery.of(context).size.width * 0.8).toInt(),
          height: (MediaQuery.of(context).size.height * 0.7).toInt());
      _image = image;*/
    }
  }
  Stack addImageString(String image) {
    return Stack(
      children: [
        SizedBox(
          height: 30,
        ),
        Padding( padding:
        const EdgeInsets.only(right: 5),
          child: Image.network(
            "https://longocorporation.com/images/uploads/"+image!,
            width: 70,
            height: 70,
            fit: BoxFit.fill,
          ),
    ),

        SizedBox(
          height: 20,
        ),
      ],
    );
  }
  Stack addImageFile(File image) {
    return Stack(
      children: [
        SizedBox(
          height: 30,
        ),
    Padding( padding:
    const EdgeInsets.only(right: 5),
        child: image != null
            ? Image.file(
                image!,
                width: 70,
                height: 70,
                fit: BoxFit.fill,
              )
            : Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/0/0a/No-image-available.png"),
    ),
      ],
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
                                image: AssetImage ('assets/images/logo.png'),
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
                    width: screenWidth,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: ImageWidgets),
                      ),

                  ),
                  SizedBox(
                    height: 10,
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
                  // Padding(
                  //   padding: const EdgeInsets.all(0.0),
                  //   child: Container(
                  //     width: screenWidth,
                  //     margin: EdgeInsets.fromLTRB(20, 10, 20, 30),
                  //     child: Padding(
                  //       padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  //       child: ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           primary: Color(0xffffffff),
                  //           minimumSize: const Size.fromHeight(50), // NEW
                  //         ),
                  //         onPressed: () {
                  //           getImage();
                  //         },
                  //         child: Column(children: <Widget>[
                  //           Container(
                  //             height: 20,
                  //           ),
                  //           Align(
                  //             child: Text("Click here to upload images",
                  //                 style: TextStyle(
                  //                     fontSize: 14,
                  //                     color: Color(0xff0D529A),
                  //                     fontFamily: 'RalewayLight')),
                  //             alignment: Alignment.center,
                  //           ),
                  //           Container(
                  //             height: 20,
                  //           ),
                  //         ]),
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
                      getImage();
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
                      Navigator .push(
                          context, MaterialPageRoute(
                          builder: (context) => HomeSubmit()
                      ));
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 16, color: Color(0xff0D529A)),
                    ),
                  ),
                ])));
  }
}

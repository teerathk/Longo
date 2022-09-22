import 'package:flutter/material.dart';

class forgotPage extends StatelessWidget {
  const forgotPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Material(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        resizeToAvoidBottomInset : false,
        appBar: AppBar(
          backgroundColor: const Color(0xffffffff),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: const Color(0xff0D529A)),
            onPressed: () => Navigator.pushReplacementNamed(context,'/login'),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Stack(
            children: [
              Container(
                width: screenWidth,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 00),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff0D529A),
                      minimumSize: const Size.fromHeight(50), // NEW
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Send instructions',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              Container(
                width: screenWidth,
                margin: EdgeInsets.fromLTRB(20, 60, 20, 0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: const Color(0x80000000),
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 35),
                    backgroundColor: const Color(0xffffffff),
                    textStyle: const TextStyle(fontSize: 16),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  onPressed: () {},
                  child: const Text("Cancel"),
                ),
              ),
            ],
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: SizedBox(
                height: screenHeight/1.2,
                child: Column(
                  children: [
                    Expanded(
                        flex: 14,
                        child: Container(
                          width: screenWidth,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Reset your \nPassword",
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Color(0xff0D529A),
                                ),
                                textAlign: TextAlign.left,

                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 20), //apply padding to all four sides
                                child: Text(
                                  "Enter your email address and we’ll send you instructions to reset your password.",
                                  style: TextStyle(
                                    fontSize: 15,
                                    height: 1.5,
                                    color: Color(0x70202020),
                                  ),
                                  textAlign: TextAlign.left,
                                ),

                              ),
                              Container(
                                height: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 10), //apply padding to all four sides
                                child: Text(
                                  "Email Address",
                                  style: TextStyle(
                                    fontSize: 10,
                                    height: 0,
                                    color: Color(0x60202020),
                                  ),
                                  textAlign: TextAlign.left,
                                ),

                              ),
                              TextFormField(
                                // focusNode: f1,
                                // controller: txtEmail,
                                style: TextStyle(
                                  color: Color(0xff0D529A),
                                ),
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.all(20),
                                  labelStyle: TextStyle(
                                    color: Color(0xff051C48),
                                    fontSize: 11,
                                    fontFamily: 'AvenirLight',

                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xffF2F3F5),
                                  floatingLabelBehavior:FloatingLabelBehavior.always,
                                  labelText: "",
                                  hintText: "tedpickus@example.com",
                                  hintStyle: TextStyle(fontSize: 16.0, color: Color(0xff051C48)),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsetsDirectional.only(end: 12.0),
                                    child: Icon(Icons.check, color: Color(0xff051C48),), // myIcon is a 48px-wide widget.
                                  ),
                                ),
                              ),
                              Container(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                    ),
                  ],
                )
            ),

          ),

        ),


      ),
    );
  }
}

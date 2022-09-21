import 'package:flutter/material.dart';

class loginPage extends StatelessWidget {
const loginPageD({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return Material(
color: Colors.grey,
child: Column(
children: [
Image.asset("assets/login.jpg",
fit: BoxFit.cover,
),
SizedBox(height: 20.0,),
Text("Welcome",style: TextStyle(
fontWeight:FontWeight.bold
),),
SizedBox(height: 20.0,),
TextFormField(
decoration: InputDecoration(
hintText:"User Name",
labelText: "",
)
),
TextFormField(
decoration: InputDecoration(
hintText:"User Name",
labelText: "",
)
),
],
),
);
}
}

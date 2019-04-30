import 'package:flutter/material.dart';
import 'login-and-register/portal.dart';
import 'tomato-agency/agency.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miles Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      // home: PortalPage(),
      home: Agency(),
      // home: ConfirmSoloPage(),

    );
  }
}
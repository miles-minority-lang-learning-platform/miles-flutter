import 'package:flutter/material.dart';
import 'route.dart';
import 'login-and-register/login.dart';
import 'login-and-register/portal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miles Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      routes: routes(context),
      home: PortalPage(),
    );
  }
}
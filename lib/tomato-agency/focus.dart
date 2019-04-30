import 'package:flutter/material.dart';
import 'dart:async';
import '../config.dart';

class KeepFocusPage extends StatefulWidget {
  @override
  createState() => KeepFocusState();
}

class KeepFocusState extends State<KeepFocusPage> {
  Timer _timer;
  
  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, "/tomato/solo/period");
    });
  }

   @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  build(BuildContext context) => Scaffold(
        body: Container(
          color: agencyBgColor,
          child: Center(
            child: Text(
              "保持专注 !",
              style: TextStyle(
                color: Colors.white,
                fontSize: 60,
              ),
            ),
          ),
        ),
      );
}
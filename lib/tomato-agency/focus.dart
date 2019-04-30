import 'package:flutter/material.dart';
import 'dart:async';
import '../config.dart';
import 'period.dart';

class Focus extends StatefulWidget {
  @override
  createState() => FocusState();
}

class FocusState extends State<Focus> {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => Peroid()));
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

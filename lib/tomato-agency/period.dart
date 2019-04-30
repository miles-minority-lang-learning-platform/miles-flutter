import 'dart:async';
import 'package:flutter/material.dart';
import '../config.dart';

class TomatoPeriodSoloPage extends StatefulWidget {
  @override
  createState() => TomatoPeriodSoloState();
}

class TomatoPeriodSoloState extends State<TomatoPeriodSoloPage> {
  Color _bgColor;
  Timer _timer;
  Duration _currentTime;

  timeFlows() => Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) => setState(() {
            if (_currentTime > Duration(seconds: 0)) {
              _currentTime -= Duration(seconds: 1);
            } else {
              dispose();
              Navigator.pushNamed(context, "/tomato/succeeded");
            }
          }));

  @override
  void initState() {
    super.initState();
    _bgColor = agencyBgColor;
    // _currentTime = Duration(minutes: 25);
    _currentTime = Duration(seconds: 5);
    _timer = timeFlows();
  }

  @override
  void deactivate() {
    if (_timer.isActive) {
      _timer.cancel();
    } else {
      _timer = timeFlows();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  build(BuildContext context) => Scaffold(
        body: Container(
          color: _bgColor,
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _currentTime.toString().substring(2, 7),
                      style: TextStyle(color: Colors.white, fontSize: 60),
                    ),
                    Text(
                      "不要切出当前页面",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  width: 120,
                  margin: EdgeInsets.only(bottom: 50),
                  child: RaisedButton(
                    onPressed: () =>
                        {Navigator.pushNamed(context, "/tomato/gived_up")},
                    color: Colors.red[200],
                    textColor: Colors.white,
                    child: Text(
                      "放弃",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}

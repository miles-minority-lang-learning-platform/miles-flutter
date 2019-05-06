import 'dart:async';
import 'package:flutter/material.dart';
import '../config.dart';
import 'before_result.dart';

class Peroid extends StatefulWidget {
  @override
  createState() => PeroidState();
}

class PeroidState extends State<Peroid> with WidgetsBindingObserver{
  Color _bgColor;
  Timer _timer;
  Duration _currentTime;
  String _text = "不要切出当前页面";
  int _counter;

  timeFlows() => Timer.periodic(Duration(seconds: 1), (Timer timer) {
        if (_currentTime == Duration(seconds: 1)) {
          _timer.cancel();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => BeforeResult("success")));
        }
        setState(() {
          _currentTime -= Duration(seconds: 1);
        });
      });

  @override
  void initState() {
    super.initState();
    // add observer
    WidgetsBinding.instance.addObserver(this);
    _bgColor = agencyBgColor;
    _counter = 0;
    // _currentTime = Duration(minutes: 25);
    _currentTime = Duration(seconds: 20);
    _timer = timeFlows();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed){
      switch (_counter) {
        case 1:
          _bgColor = Color.fromRGBO(193, 100, 100, 1);
          _text = """不要切出当前页面
当前已切出1次""";
          _currentTime += Duration(seconds: 1);
          _timer = timeFlows();
          break;
        case 2:
          _bgColor = Color.fromRGBO(177, 127, 127, 1);
          _text = """不要切出当前页面
当前已切出2次""";
          _currentTime += Duration(seconds: 1);
          _timer = timeFlows();
          break;
        case 3:
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    BeforeResult("failed")),
            (route) => route == null
          );
          break;
        default:
          _counter = 1;
          break;
      }
    }
    if(state == AppLifecycleState.paused){
      _timer.cancel();
      _counter += 1;
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
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
                      _text,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
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
                    onPressed: () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      BeforeResult("interrupted")))
                        },
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

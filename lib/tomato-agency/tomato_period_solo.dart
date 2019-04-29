import 'package:flutter/material.dart';

class TomatoPeriodSoloPage extends StatefulWidget {
  @override
  createState() => TomatoPeriodSoloState();
}

class TomatoPeriodSoloState extends State<TomatoPeriodSoloPage> {
  Color _bgColor = Colors.red[300];

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
                      "24:59",
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
                    onPressed: () => {},
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

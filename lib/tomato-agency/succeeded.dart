import 'package:flutter/material.dart';

class SucceededPage extends StatelessWidget {
  @override
  build(BuildContext context) => Scaffold(
        body: Container(
          color: Colors.red[300],
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/images/break.png"),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "辛苦啦，休息一会儿吧",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 120,
                      margin: EdgeInsets.only(bottom: 50),
                      child: RaisedButton(
                        onPressed: () => {},
                        color: Colors.red[200],
                        textColor: Colors.white,
                        child: Text(
                          "再来一个",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                        height: 50,
                        width: 60,
                        margin: EdgeInsets.only(bottom: 50),
                        child: Container()),
                    Container(
                      height: 50,
                      width: 120,
                      margin: EdgeInsets.only(bottom: 50),
                      child: RaisedButton(
                        onPressed: () => {},
                        color: Colors.red[200],
                        textColor: Colors.white,
                        child: Text(
                          "结束学习",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}

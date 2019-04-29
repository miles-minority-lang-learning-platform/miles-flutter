import 'package:flutter/material.dart';

class GivedUp extends StatelessWidget {
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
                    Image.asset("assets/images/stop.png"),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "你确定要放弃吗?",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          Text(
                            "这会使你丢失这个番茄钟的进度...",
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
                        onPressed: () => {
                          Navigator.pop(context)
                        },
                        color: Colors.red[200],
                        textColor: Colors.white,
                        child: Text(
                          "我后悔了",
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
                        onPressed: () => {
                          Navigator.pushNamed(context, "/tomato/result")
                        },
                        color: Colors.grey,
                        textColor: Colors.white,
                        child: Text(
                          "确定放弃",
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

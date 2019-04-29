import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  @override
  build(BuildContext context) => Scaffold(
        body: Container(
          color: Colors.red[300],
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 40,
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container()
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              "学习成果",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            resultItem(
                                "assets/images/tomato.png", "完成番茄数", "2"),
                            resultItem(
                                "assets/images/time.png", "时间", "00:50:00"),
                            resultItem(
                                "assets/images/multiply.png", "连续学习奖励", "x1.5"),
                            resultItem("assets/images/coin.png", "金币", "30"),
                            resultItem(
                                "assets/images/milestone.png", "里程", "7500"),
                            resultItem(
                                "assets/images/exclamation.png", "触发事件", "1"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 50,
                  width: 240,
                  margin: EdgeInsets.only(bottom: 50),
                  child: RaisedButton(
                    onPressed: () => {
                      Navigator.pushNamed(context, "/tomato")
                    },
                    color: Colors.red[200],
                    textColor: Colors.white,
                    child: Text(
                      "完成本次学习",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );

  resultItem(String image, String title, String trailing) => ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(image),
          backgroundColor: Colors.transparent,
        ),
        title: Text(title),
        trailing: Text(trailing),
      );
}

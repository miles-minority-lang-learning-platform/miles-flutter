import 'package:flutter/material.dart';
import '../config.dart';
import 'agency.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  _topBar() => Padding(
        padding: EdgeInsets.symmetric(
          vertical: 40,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Text(
                "学习成果",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ],
        ),
      );

  _resultItem(String image, String title, String trailing) => ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(image),
          backgroundColor: Colors.transparent,
        ),
        title: Text(title),
        trailing: Text(trailing),
      );

  _resultItems(int clocks, int events) => <Widget>[
        _resultItem(
            "assets/images/tomato.png", "完成番茄数", clocks.toString() + "个"),
        _resultItem(
            "assets/images/time.png", "时间", (25 * clocks).toString() + "分钟"),
        _resultItem("assets/images/multiply.png", "连续学习奖励",
            "x" + _getBonus(clocks).toString()),
        _resultItem("assets/images/coin.png", "金币",
            (clocks * 10 * _getBonus(clocks)).toInt().toString()),
        _resultItem("assets/images/milestone.png", "里程",
            (2500 * clocks * _getBonus(clocks)).toInt().toString()),
        _resultItem("assets/images/exclamation.png", "触发事件", events.toString()),
      ];

  _getBonus(int i) => 1 + 0.5 * (i - 1);

  _bottomButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 50,
          width: 240,
          margin: EdgeInsets.only(bottom: 50),
          child: RaisedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Agency()));
            },
            color: Colors.red[200],
            textColor: Colors.white,
            child: Text(
              "完成本次学习",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      );

  @override
  build(BuildContext context) => Scaffold(
        body: Container(
          color: agencyBgColor,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _topBar(),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Card(
                      child: Column(
                        children: _resultItems(2, 1),
                      ),
                    ),
                  )
                ],
              ),
              _bottomButton()
            ],
          ),
        ),
      );
}

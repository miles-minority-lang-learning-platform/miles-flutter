import 'package:flutter/material.dart';
import "../config.dart";

class BeforeResult extends StatefulWidget {
  final String status;

  BeforeResult(this.status);

  @override
  _BeforeResultState createState() => _BeforeResultState();
}

class _BeforeResultState extends State<BeforeResult> {
  final _showContent = {
    "success": ["assets/images/break.png", "辛苦啦，休息一会儿吧"],
    "interrupted": ["assets/images/notice.png", "你确定要放弃吗?"],
    "failed": ["assets/images/skeleton.png", " 你失败了..."]
  };
  Align _bottomButton;

  _mainContent() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage(_showContent[widget.status][0]),
              height: 200,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  Text(
                    _showContent[widget.status][1],
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  _successButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50,
              width: 120,
              margin: EdgeInsets.only(bottom: 50),
              child: RaisedButton(
                onPressed: () =>
                    {Navigator.pushNamed(context, "/tomato/focus")},
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
                onPressed: () =>
                    {Navigator.pushNamed(context, "/tomato/result")},
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
      );

  _interruptedButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50,
              width: 120,
              margin: EdgeInsets.only(bottom: 50),
              child: RaisedButton(
                onPressed: () => {Navigator.pop(context)},
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
                onPressed: () =>
                    {Navigator.pushNamed(context, "/tomato/result")},
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
      );

  _failedButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50,
              width: 120,
              margin: EdgeInsets.only(bottom: 50),
              child: RaisedButton(
                onPressed: () =>
                    {Navigator.pushNamed(context, "/tomato/result")},
                color: Colors.grey,
                textColor: Colors.white,
                child: Text(
                  "查看结果",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      );

  @override
  void initState() {
    super.initState();
    switch (widget.status) {
      case "success":
        _bottomButton = _successButton();
        break;
      case "interrupted":
        _bottomButton = _interruptedButton();
        break;
      case "failed":
        _bottomButton = _failedButton();
        break;
      default:
        _bottomButton = Align();
    }
  }

  @override
  build(BuildContext context) => Scaffold(
        body: Container(
          color: agencyBgColor,
          child: Stack(
            children: <Widget>[
              _mainContent(),
              _bottomButton,
            ],
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import '../config.dart';

class Confirm extends StatefulWidget {
  final String mode;

  Confirm(this.mode);

  @override
  _ConfirmState createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
  List<Widget> _awardContent;
  String _image;

  _topBar() => Container(
        height: 50,
        margin: EdgeInsets.only(top: 30),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Image(
                image: AssetImage("assets/images/rollback.png"),
                color: Colors.white,
                height: 30,
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "一个人的学习之旅",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  _award() => Column(
        children: _awardContent,
      );

  _awardText(String text) => Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      );

  _tomatoClock() => Expanded(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Container(
                // padding: EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  fit: StackFit.passthrough,
                  alignment: Alignment.center,
                  children: <Widget>[
                    Hero(
                      tag: widget.mode + "_circle",
                      child: Container(
                        // padding: EdgeInsets.symmetric(
                        //   vertical: 40,
                        // ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: SizedBox(
                          height: 240,
                          width: 240,
                        ),
                      ),
                    ),
                    Hero(
                      tag: widget.mode,
                      child: Image(
                        image: AssetImage(_image),
                        height: 200,
                      ),
                    ),
                  ],
                ),
                // ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                "25:00",
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      );

  _button(BuildContext context) => Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        height: 50,
        width: 120,
        child: RaisedButton(
          onPressed: () => {Navigator.pushNamed(context, "/tomato/focus")},
          color: Colors.red[200],
          textColor: Colors.white,
          child: Text(
            "出发",
            style: TextStyle(fontSize: 20),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    switch (widget.mode) {
      case "solo":
        _image = "assets/images/tomato.png";
        _awardContent = <Widget>[
          _awardText("你将获得:"),
          _awardText("金币x10"),
          _awardText("里程2500米"),
          _awardText("随缘的额外奖励"),
        ];
        break;
      case "multi":
        _image = "assets/images/group.png";
        _awardContent = <Widget>[
          _awardText("你将获得:"),
          _awardText("金币x40"),
          _awardText("里程5000米"),
          _awardText("随缘的额外奖励"),
        ];
    }

    return Scaffold(
      body: Container(
        color: agencyBgColor,
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                _topBar(),
                _award(),
                _tomatoClock(),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _button(context),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ConfirmMultiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red[300],
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
                    child: InkWell(
                      onTap: () => {Navigator.pop(context)},
                      child: Image(
                        image: AssetImage("assets/images/rollback.png"),
                        color: Colors.white,
                        height: 30,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(
                      """加入学习旅行团""",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                _awardText("你将获得:"),
                _awardText("金币x40"),
                _awardText("里程5000米"),
                _awardText("随缘的额外奖励"),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Hero(
                    tag: "group-circle",
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 40,
                      ),
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
                    tag: "group",
                    child: Image(
                      image: AssetImage("assets/images/group.png"),
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "25:00",
              style: TextStyle(
                fontSize: 60,
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              height: 50,
              width: 120,
              child: RaisedButton(
                onPressed: () => {},
                color: Colors.red[200],
                textColor: Colors.white,
                child: Text(
                  "出发",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Text _awardText(String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }
}
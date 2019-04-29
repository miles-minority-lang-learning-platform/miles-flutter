import 'package:flutter/material.dart';
import '../config.dart';
import 'confirm.dart';

class Agency extends StatelessWidget {
  _topBar() => Container(
        height: 50,
        margin: EdgeInsets.only(top: 30),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10),
              alignment: Alignment.centerLeft,
              child: Image(
                image: AssetImage("assets/images/menu.png"),
                color: Colors.white,
                height: 30,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/images/coin.png"),
                    height: 35,
                  ),
                  CoinStatus()
                ],
              ),
            )
          ],
        ),
      );

  _choice(String image, String mode) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Hero(
              tag: mode + "_circle",
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 60,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: SizedBox(
                  height: 120,
                  width: 120,
                ),
              ),
            ),
            Hero(
              tag: mode,
              child: Image(
                image: AssetImage(image),
                height: 80,
              ),
            ),
          ],
        ),
      );

  _home(BuildContext context) => Column(
        children: <Widget>[
          _topBar(),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "请选择学习模式",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      child: _choice("assets/images/tomato.png", "solo"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Confirm("solo")));
                      },
                    ),
                    InkWell(
                      child: _choice("assets/images/group.png", "multi"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    Confirm("multi")));
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      );

  @override
  build(BuildContext context) => Scaffold(
          body: Container(
        color: agencyBgColor,
        child: _home(context),
      ));
}

class CoinStatus extends StatefulWidget {
  @override
  createState() => CoinStatusState();
}

class CoinStatusState extends State<CoinStatus> {
  int _coin = 20;

  @override
  build(BuildContext a) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          _coin.toString(),
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      );
}

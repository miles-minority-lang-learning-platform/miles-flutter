import 'package:flutter/material.dart';

class AgencyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.red[300],
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 40,
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      // child: IconButton(
                      //   icon: Icon(
                      //     Icons.menu,
                      //     color: Colors.white,
                      //     size: 30,
                      //   ),
                      //   onPressed: () {},
                      // ),
                      child: Image(
                        image: AssetImage("assets/images/menu.png"),
                        color: Colors.white,
                        height: 30,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
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
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 150),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      "请选择学习模式",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 60,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red[100],
                                ),
                                child: SizedBox(
                                  height: 120,
                                  width: 120,
                                ),
                              ),
                              Image(
                                image: AssetImage("assets/images/tomato.png"),
                                height: 80,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 60,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red[100],
                                ),
                                child: SizedBox(
                                  height: 120,
                                  width: 120,
                                ),
                              ),
                              Image(
                                image: AssetImage("assets/images/group.png"),
                                height: 80,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class CoinStatus extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CoinStatusState();
  }
}

class CoinStatusState extends State<CoinStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        "20",
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }
}

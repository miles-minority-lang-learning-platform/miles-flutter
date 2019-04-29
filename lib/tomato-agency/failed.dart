import 'package:flutter/material.dart';

class FailPage extends StatelessWidget {
  @override
  build(BuildContext context) => Scaffold(
        body: Container(
          color: Colors.grey[600],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/images/skeleton.png"),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "你失败了...",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}

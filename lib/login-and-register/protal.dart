import 'package:flutter/material.dart';
import 'login.dart';

class ProtalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/images/protal.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 80.0),
              Text(
                "Miles",
                style: TextStyle(
                  fontSize: 60,
                  color:Color.fromRGBO(234, 93, 92, 1),
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 300.0),
              RaisedButton(
                onPressed: () => {
                  Navigator.push(context,
                      PageRouteBuilder(pageBuilder: (
                    BuildContext context,
                    Animation animation,
                    Animation secondaryAnimation,
                  ) {
                    return FadeTransition(
                      opacity: animation,
                      child: Scaffold(
                        body: LoginPage(),
                      ),
                    );
                  }))
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Center(
                    child: Text(
                      "登陆",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white
                      ),
                    ),
                  ),
                  width: 300,
                ),
                color: Color.fromRGBO(234, 93, 92, 1),
              )
            ],
          ),
        )
      ),
    );
  }
}




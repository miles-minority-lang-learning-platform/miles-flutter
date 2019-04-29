import 'package:flutter/material.dart';
import 'register.dart';

class RegisterLanguagePage extends StatelessWidget {
  RegisterLanguagePage({@required this.age});
  final String age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          RegisterTipBar(schedule:2),
          Registerhead(title:"请选择一种语言"),
          Registerbody(
            age: age,
            pageId: "3",
            list: [
              {"id":0,"img":'assets/images/germany.png', "msg":"德语"},
              {"id":1,"img":'assets/images/french.png', "msg":"法语"},
              {"id":2,"img":'assets/images/korea.png', "msg":"韩语"},
              {"id":3,"img":'assets/images/japan.png', "msg":"日语"},
            ]
          ),
        ],
      ) 
    );
  }
}
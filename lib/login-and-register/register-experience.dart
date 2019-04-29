import 'package:flutter/material.dart';
import 'register.dart';

class RegisterExperiencePage extends StatelessWidget {
  RegisterExperiencePage({@required this.age,@required this.language});
  final String age;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          RegisterTipBar(schedule:3),
          Registerhead(title:"请选择学习程度"),
          Registerbody(
            age: age,
            language: language,
            pageId: "4",
            list: [
              {"id":0,"img":'assets/images/ot.png', "msg":"我啥都不会"},
              {"id":1,"img":'assets/images/fm.png', "msg":"我有花时间学过"},
              {"id":2,"img":'assets/images/sd.png', "msg":"我学了一段时间"},
              {"id":3,"img":'assets/images/at.png', "msg":"我离大佬一步之遥"},
              {"id":4,"img":'assets/images/fd.png', "msg":"我是专家"}
            ]
          ),
        ],
      ) 
    );
  }
}
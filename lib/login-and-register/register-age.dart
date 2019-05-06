import 'package:flutter/material.dart';
import 'register.dart';

class RegisterAgePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          RegisterTipBar(schedule:1),
          Registerhead(title:"请选择您的年龄"),
          Registerbody(
            pageId: "2",
            list: [
              {"id":0,"img":'assets/images/treeman.png', "msg":"18岁以下"},
              {"id":1,"img":'assets/images/captain.png', "msg":"19-26岁"},
              {"id":2,"img":'assets/images/ironman.png', "msg":"27-40岁"},
              {"id":3,"img":'assets/images/doctor.png', "msg":"41-60岁"},
              {"id":4,"img":'assets/images/sanas.png', "msg":"60岁以上"}
            ]
          ),
        ],
      ) 
    );
  }
}
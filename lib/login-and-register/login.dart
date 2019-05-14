import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'register-age.dart';
import 'dart:async';
import 'dart:ui';

// 登录页（包括Login Field部分和Other Login Methods部分）
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            LoginField(),
            OtherLoginMethods(),
          ],
        ),
      ),
    );
  }
}

// 登录背景以及登录表单部分
class LoginField extends StatefulWidget {
  @override
  _LoginFieldState createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  final _formKey = GlobalKey<FormState>();
  Timer _timer;
  // 验证码计时器逻辑
  int _countdowntime = 0;
  void updateTip(){
    setState(() {
      if (_countdowntime == 0) {
        setState(() {
        _countdowntime = 60;
      });
      var callback = (timer) => {
        setState(() {
          if (_countdowntime < 1) {
            _timer.cancel();
          } else {
            _countdowntime = _countdowntime - 1;
          }
        })
      };
      _timer = Timer.periodic(Duration(seconds: 1), callback);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.0,
      child: Stack(
        overflow: Overflow.visible,
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          _backgroundImage('assets/images/background.png'),
          Positioned(
            top: 200,
            child: _loginForm(),
          ),
          Positioned(
            top: 365,
            child: _loginButton(_formKey),
          )
        ],
      ),
    );
  }

  //登录页背景图片
  Widget _backgroundImage(String imgurl) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imgurl),
        fit: BoxFit.contain
      ),
    ),
    margin: EdgeInsets.only(bottom: 150.0),
  );

  // 登陆表单
  Widget _loginForm()=> Container(
    // !!! 高宽必须给定，——TextForm 默认撑满整个容器
    height: 200.0,
    width: 400.0,
    padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
    child: Form(
      key: _formKey,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0)
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 15, 30, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _phoneSection(),
              _verificationSection()
            ],
          ),
        ),
      ),
    ),
  );

  // 登录按钮
  Widget _loginButton(_formKey) => Container(
    child: RaisedButton(
      child: Text(
        "登录",
        style: TextStyle(
          fontSize: 23.0,
          color: Colors.white,
          fontFamily: "Segoe UI",
          fontWeight: FontWeight.bold
        ),
      ),
      color: Color.fromRGBO(80, 184, 207, 1),
      shape: StadiumBorder(),
      elevation: 7.0,
      onPressed: () {
        //pass globalkey _formKey
        Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterAgePage()));
      }),
    width: 260,
    height: 55,
    margin: EdgeInsets.only(bottom: 0.0),
  );

  // 登录表单——手机号输入框
  Widget _phoneSection ()=> TextFormField(
    decoration: InputDecoration(
      hintText: "+86  请输入手机号码",
    ),
    // validator: (String value){
    //   var phoneReg = RegExp(
    //     r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$'
    //   );
    //   if (!phoneReg.hasMatch(value)) {
    //     return '请先输入正确的电话号码';
    //   }
    // },
    // onSaved: (String value) => _phoneNumber = value,
    maxLines: 1,
  );

  // 登录表单——验证码输入框
  Widget _verificationSection()=> TextFormField(
    decoration: InputDecoration(
      hintText: "请输入验证码",
      suffix: GestureDetector(
        child: Text(
           _countdowntime > 0 ? '已发送 $_countdowntime' : '获取验证码',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
            color: _countdowntime > 0
              ? Colors.grey
              : Color.fromRGBO(88, 155, 207, 1),
          )
        ),
        onTap: (){
          updateTip();
        },
      )
    ),
    // onSaved: (String value) => _code = value,
    // validator: (String value){
    //   if (value.isEmpty){
    //     return "请先填入验证码";
    //   }
    // },
    maxLines: 1,
  );
}

// 社交合作账号登录方式
class OtherLoginMethods extends StatelessWidget {
  final List _loginMethod = [
    {
      "title": "QQ",
      "icon": GroovinMaterialIcons.qqchat,
      "color":Colors.blueAccent
    },
    {
      "title": "微信",
      "icon": GroovinMaterialIcons.wechat,
      "color":Colors.green
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: window.physicalSize.height/window.devicePixelRatio - 525),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                width: 300.0,
                height: 30.0,
                child: Center(
                  child: Text(
                    "社交账号登录",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Color.fromRGBO(112, 112, 112, 1),
                    )
                  ),
                )
              ),
              Positioned(
                left: 75.0,
                top: 15,
                child: _positionedLine()
              ),
              Positioned(
                right: 75.0,
                top: 15,
                child: _positionedLine()
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: _loginMethod.map((item) => Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(
                    item['icon'],
                    color: item['color'],
                    size: 32.0,
                  ),
                  iconSize: 38.0,
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(new SnackBar(
                      content: new Text("${item['title']}登录"),
                      action: new SnackBarAction(
                        label: "取消",
                        onPressed: () {},
                      ),
                    ));
                  });
              },
            )).toList(),
          ),
          _agreementDeclaration()
        ],
      )
    );
  }

  // 社交账号左右两侧的横线
  Widget _positionedLine() => Container(
    height: 1,
    width: 20,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 1,
      )
    ),
  );

  // 用户协议和隐私政策声明部分
  Widget _agreementDeclaration ()=> Container(
    margin: EdgeInsets.only(bottom: 30.0,top: 5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        __normalText("登录注册代表同意"),
        __gestureDetectorText("用户协议", LoginPage()),
        __normalText("和"),
        __gestureDetectorText("隐私政策", LoginPage())
      ]
    )
  );

  // 灰色字体
  Widget __normalText(String text)=> Text(
    text,
    style: TextStyle(
      fontSize: 12.0,
      color: Color.fromRGBO(112, 112, 112, 1),
    ),
  );

  // 用户可以点击跳转路由的蓝色字体
  Widget __gestureDetectorText(String text, Widget widget)=> GestureDetector(
    onTap: (){},
    child: Text(
      text,
      style: TextStyle(
        fontSize: 12.0,
        color: Color.fromRGBO(88, 155, 207, 1),
      )
    ),
  );
}

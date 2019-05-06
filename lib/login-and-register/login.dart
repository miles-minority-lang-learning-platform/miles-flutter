import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';
import 'register-age.dart';
import 'dart:async';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _titleSection(),
            LoginForm(),
            OtherLoginMethods(),
            _agreementDeclaration()
          ],
        ),
      ),
    );
  }

  Widget _titleSection ()=> Container(
    child:Text(
      "登录后开启小语种学习之旅",
      style: TextStyle(
        fontSize: 23.0,
        color: Color.fromRGBO(234, 93, 92, 1),
        fontFamily: "Segoe UI",
        fontWeight: FontWeight.bold
      )
    ),
    margin: EdgeInsets.fromLTRB(0, 90, 0, 40)
  );

  Widget _agreementDeclaration ()=> Container(
    margin: EdgeInsets.symmetric(vertical: 30.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "登录注册代表同意",
          style: TextStyle(
            fontSize: 12.0,
            color: Color.fromRGBO(112, 112, 112, 1),
          )
        ),
        GestureDetector(
          onTap: (){},
          child: Text(
            "用户协议",
            style: TextStyle(
              fontSize: 12.0,
              color: Color.fromRGBO(88, 155, 207, 1),
            )
          ),
        ),
        Text(
          "和",
          style: TextStyle(
            fontSize: 12.0,
            color: Color.fromRGBO(112, 112, 112, 1),
          )
        ),
        GestureDetector(
          onTap: (){},
          child: Text(
            "隐私政策",
            style: TextStyle(
              fontSize: 12.0,
              color: Color.fromRGBO(88, 155, 207, 1),
            )
          ),
        )
      ]
    )
  );
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _phoneNumber, _code;
  final _formKey = GlobalKey<FormState>();
  Timer _timer;
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
      child: Form(
      key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: 280.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _phoneSection(),
                  SizedBox(height: 15),
                  _verificationSection(),
                  _buttonSection(),
                  _unreceivalbeCode()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  
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
    onSaved: (String value) => _phoneNumber = value,
    maxLines: 1,
  );

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
    onSaved: (String value) => _code = value,
    // validator: (String value){
    //   if (value.isEmpty){
    //     return "请先填入验证码";
    //   }
    // },
    maxLines: 1,
  );

  Widget _buttonSection ()=> Container(
    width: 275,
    height: 55,
    margin: EdgeInsets.fromLTRB(0, 50, 0, 10),
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
      color: Color.fromRGBO(234, 93, 92, 1),
      shape: StadiumBorder(),
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          // TODO : post the login or register information to api
          print(_phoneNumber+" "+_code);
          Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterAgePage()));
        }
      },
    ),
  );

  Widget _unreceivalbeCode() => Container(
    margin: EdgeInsets.only(bottom: 20.0),
    child: Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        child: Container(
          child: Text(
            '收不到验证码？',
            style: TextStyle(
              fontSize: 14.0, 
              color: Colors.grey
            ),
          ),
          padding: EdgeInsets.all(5.0),
        ),
        onTap: () {},
      ),
    ),
  );
}

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
                      fontSize: 12.0,
                      color: Color.fromRGBO(112, 112, 112, 1),
                    )
                  ),
                )
              ),
              Positioned(
                left: 80.0,
                top: 15,
                child: positionedLine()
              ),
              Positioned(
                right: 80.0,
                top: 15,
                child: positionedLine()
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
                    size: 30.0,
                  ),
                  iconSize: 38.0,
                  onPressed: () {
                    //TODO : add other login methods.
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
        ],
      )
    );
  }

  Widget positionedLine() => Container(
    height: 1,
    width: 20,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 1,
      )
    ),
  );
}

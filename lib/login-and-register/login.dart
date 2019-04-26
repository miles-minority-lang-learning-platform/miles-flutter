import 'package:flutter/material.dart';
import 'package:groovin_material_icons/groovin_material_icons.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _titleSection(),
            SizedBox(height: 70.0),
            LoginForm(),
            SizedBox(height: 80.0),
            OtherLoginMethods(),
            SizedBox(height: 80.0),
            _agreementDeclaration()
          ],
        ),
      )
    );
  }

  Widget _titleSection ()=> Text(
    "登陆后开启小语种学习之旅",
    style: TextStyle(
      fontSize: 23.0,
      color: Color.fromRGBO(234, 93, 92, 1),
      fontFamily: "Segoe UI",
      fontWeight: FontWeight.bold
    )
  );

  Widget _agreementDeclaration ()=> Container(
    margin: EdgeInsets.only(bottom: 30.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "登陆注册代表同意",
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
  // TODO : validator
  // String _phoneNumber, _code;
  // final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
      // key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 280.0,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(height: 10.0),
                  _phoneSection(),
                  SizedBox(height: 20.0),
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
    // TODO : validator
    decoration: InputDecoration(
      hintText: "+86  请输入手机号码"
    ),
  );

  Widget _verificationSection()=> TextFormField(
    // TODO : validator
    decoration: InputDecoration(
      hintText: "请输入验证码",
      suffix: GestureDetector(
        child: Text(
          "获取验证码",
          style: TextStyle(
            fontSize: 14.0,
            color: Color.fromRGBO(88, 155, 207, 1),
          )
        ),
        // TODO : get the validator code from api
        onTap: (){},
      )
    ),
  );

  Widget _buttonSection ()=> Container(
    width: 275,
    height: 55,
    margin: EdgeInsets.fromLTRB(0, 50, 0, 10),
    child: RaisedButton(
      child: Text(
        "登陆",
        style: TextStyle(
          fontSize: 23.0,
          color: Colors.white,
          fontFamily: "Segoe UI",
          fontWeight: FontWeight.bold
        ),
      ),
      color: Color.fromRGBO(234, 93, 92, 1),
      shape: StadiumBorder(),
      onPressed: (){},
    ),
  );

  Widget _unreceivalbeCode() => Container(
    child: Align(
      alignment: Alignment.centerRight,
      child: FlatButton(
        child: Text(
          '收不到验证码？',
          style: TextStyle(
            fontSize: 14.0, 
            color: Colors.grey
          ),
        ),
        onPressed: () {},
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
                    "社交账号登陆",
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

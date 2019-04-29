import 'package:flutter/material.dart';
import 'register-experience.dart';
import 'register-language.dart';

class RegisterTipBar extends StatelessWidget {
  // 进度条 widget, different schedule => different widget statement
  RegisterTipBar({@required this.schedule});
  final schedule;

  @override
  Widget build(BuildContext context) {
    if (schedule == 1){
      return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 150.0,vertical: 8.0),
              ),
              decoration: BoxDecoration(
                // color: Colors.green,
                border: Border.all(color: Colors.green,width: 2.0),
                borderRadius: BorderRadius.circular(8.0)    
              ),
            ),
          ],
        ),
        margin: EdgeInsets.only(top: 45.0),
      ); 
    }else if (schedule == 2){
      return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: IconButton(
                icon: Icon(Icons.chevron_left),
                padding: EdgeInsets.all(0.0),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              padding: EdgeInsets.only(right: 20.0),
            ),
            Container(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 10.0),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),       
              ),
            ),
            Container(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 100.0,vertical: 8.0),
              ),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(8.0),
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                border: Border.all(
                  color: Colors.green,
                  width: 2.0,
                  style: BorderStyle.solid,
                )
              ),
            ),
          ],
        ),
        margin: EdgeInsets.only(top: 30.0),
      ); 
    }else if (schedule == 3){
      return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: IconButton(
                icon: Icon(Icons.chevron_left),
                padding: EdgeInsets.all(0.0),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              padding: EdgeInsets.only(right: 20.0),
            ),
            Container(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 100.0,vertical: 10.0),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),       
              ),
            ),
            Container(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 8.0),
              ),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(8.0),
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                border: Border.all(
                  color: Colors.green,
                  width: 2.0,
                  style: BorderStyle.solid,
                )
              ),
            ),
          ],
        ),
        margin: EdgeInsets.only(top: 30.0),
      ); 
    }else{
      return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 150.0,vertical: 8.0),
              ),
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(8.0),
                borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                border: Border.all(
                  color: Colors.green,
                  width: 2.0,
                  style: BorderStyle.solid,
                )
              ),
            ),
          ],
        ),
        margin: EdgeInsets.only(top: 30.0),
      ); 
    }
  }
}

class Registerhead extends StatelessWidget {

  // title of the register page
  Registerhead({@required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black87,
          fontWeight: FontWeight.bold
        ),
      ),
      padding: EdgeInsets.all(25.0),
    );
  }
}

class Registerbody extends StatelessWidget {
  // !important keep the statement and the parmas for lang
  Registerbody({@required this.list,this.pageId,this.age,this.language,this.experience});
  final List list;
  final String pageId;
  final String age;
  final String language;
  final String experience;

  @override
  Widget build(BuildContext context) {
    // return Widget RegisterBody
    return Expanded(
      child: ListView(
        children: list.map((item) => Builder(
          builder: (context) {
            return Container(
              child: Card(
                elevation: 4.0,
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        item["img"],
                        fit: BoxFit.contain,
                        width: 80.0,
                        height: 60.0,
                      ),
                      padding: EdgeInsets.all(30.0),
                    ),
                    Expanded(
                      child: Container(
                        child: Text(
                          item['msg'],
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Segoe UI"
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.keyboard_arrow_right),
                        onPressed:() {
                          if (pageId == '2') {
                            Navigator.of(context).push(CustomRoute(RegisterLanguagePage(age: item['msg'])));
                          }else if (pageId == '3') {
                            Navigator.of(context).push(CustomRoute(RegisterExperiencePage(age: age,language: item['msg'])));
                          }else if (pageId == '4') {
                            // TODO：pass the parmas to api
                            print("我是一个"+age+"的人，我想学"+ language +"。"+item['msg']+"。");
                            // Navigator.of(context).push(CustomRoute((填入下一页的路由)));
                          }
                        },
                        padding: EdgeInsets.all(5.0),
                      ),
                      margin: EdgeInsets.all(20.0),
                    )
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(14.0),
                  ),
                ),
              ),
              margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 3.0),
            );
          },
        )).toList(),
      ),
    );
  }
}

class CustomRoute extends PageRouteBuilder{
  // difine the animation of pagerouter
  final Widget widget;
  CustomRoute(this.widget)
    :super(
      transitionDuration:const Duration(seconds:1),
      pageBuilder:(
        BuildContext context,
        Animation<double> animation1,
        Animation<double> animation2){
          return widget;
        },
     transitionsBuilder:(
      BuildContext context,
      Animation<double> animation1,
      Animation<double> animation2,
      Widget child){
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(1.0, 0.0),
            end:Offset(0.0, 0.0)
          )
          .animate(CurvedAnimation(
            parent: animation1,
            curve: Curves.fastOutSlowIn
          )),
          child: child,
        );
    }  
  );
}
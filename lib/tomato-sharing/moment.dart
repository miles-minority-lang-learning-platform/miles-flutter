import 'package:flutter/material.dart';
import 'package:miles/tomato-sharing/publisher.dart';

class Moment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "德语",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.add),
            color: Colors.black,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> Publisher()));
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          MomentSharing(
            imgUrl: "assets/images/RonYou.png",
            name: "Ron You",
            level: "高三",
            title: "德语笔记",
            hold: 15,
            sharing: 36,
            loving: 21,
          ),
          MomentSharing(
            imgUrl: "assets/images/weekbin.png",
            name: "Weekbin",
            level: "大一",
            title: "黑魔仙笔记",
            hold: 15,
            sharing: 36,
            loving: 21,
          ),
          MomentSharing(
            imgUrl: "assets/images/weekbin.png",
            name: "Weekbin",
            level: "大一",
            title: "黑魔仙笔记",
            hold: 15,
            sharing: 36,
            loving: 21,
          ),
          MomentSharing(
            imgUrl: "assets/images/weekbin.png",
            name: "Weekbin",
            level: "大一",
            title: "黑魔仙笔记",
            hold: 15,
            sharing: 36,
            loving: 21,
          ),
        ],
      )
    );
  }
}

// 单一moment框架，内容通过参数传入
class MomentSharing extends StatefulWidget {
  final String imgUrl;
  final String name;
  final String level;
  final String title;
  final String textUrl;
  final num sharing;
  final num hold;
  final num loving;
  MomentSharing({@required this.imgUrl, @required this.name, @required this.level, 
  @required this.title, this.textUrl, @required this.sharing, @required this.hold,
  @required this.loving});

  @override
  _MomentSharingState createState() => _MomentSharingState();
}

class _MomentSharingState extends State<MomentSharing> {
  bool ifsharing = false;
  bool ifhold = false;
  bool ifloving = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _userInform(widget.imgUrl,widget.name,widget.level,widget.title),
          _userMessage(widget.textUrl),
          Divider(color: Colors.black87),
          _userAttention(widget.sharing,widget.hold,widget.loving),
          Divider(color: Colors.black87),
        ],
      ),
    );
  }

  _userInform(imgUrl,name,level,title)=>Container(
    height: 75.0,
    child:Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Image.asset(imgUrl),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  "| " + level + " |   " + title,
                  style: TextStyle(
                    fontSize: 15.0,
                    // fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          )
        ],
      ),
    )
  );

  _userAttention(sharing,hold,loving)=>Container(
    height: 30.0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        GestureDetector(
          onTap: (){},
          child: Row(
            children: <Widget>[
              Icon(
                Icons.share,
                color: ifsharing?Colors.blueAccent:Colors.black54,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(sharing.toString()),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
             ifhold = !ifhold; 
            });
          },
          child: Row(
            children: <Widget>[
              Icon(
                Icons.bookmark,
                color: ifhold?Colors.blueAccent:Colors.black54,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  ifhold?(hold+1).toString():hold.toString()
                ),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            setState(() {
             ifloving = !ifloving; 
            });
          },
          child: Row(
            children: <Widget>[
              Icon(
                Icons.thumb_up,
                color: ifloving?Colors.blueAccent:Colors.black54,
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(ifloving?(loving+1).toString():loving.toString()),
              )
            ],
          ),
        ),
      ],
    ),
  );

  _userMessage(textUrl)=>Padding(
    padding: EdgeInsets.symmetric(horizontal: 50.0,vertical: 12.0),
    child: Container(
      color: Colors.black12,
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/images/word.png",
            height: 50.0,
            fit: BoxFit.fitHeight
          ),
          Container(
            width: 250.0,
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8.0),
            child: Text(
              "德语学习者必备巴拉拉能量能量超级能量，黑魔仙能量",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15.0
              )
            ),
          )
        ],
      ),
    ),
  );
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Publisher extends StatefulWidget {
  @override
  _PublisherState createState() => _PublisherState();
}

class _PublisherState extends State<Publisher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "取消",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "分享",
          style: TextStyle(
            color: Colors.black
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "发布",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black
                ),
              ),
            ),
          ),
        ),
        ],
      ),
      body: _publisherBlock(),
    );
  }
  _publisherBlock()=>ListView(
    children: <Widget>[
      Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 20.0),
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("assets/images/weekbin.png"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Weekbin",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '分享资料内容...',
                ),
              ),
              Container(
                color: Color.fromRGBO(247, 247, 247, 1),
                margin: EdgeInsets.only(top: 30.0),
                padding: EdgeInsets.all(50.0),
                child: GestureDetector(
                  onTap: (){},
                  child: Icon(
                    Icons.add
                  ),
                )
              ),
            ],
          ),
        ),
      )
    ],
  );
}
import 'package:flutter/material.dart';
import 'dart:async';
import '../config.dart';
import 'period.dart';

class Focus extends StatefulWidget {
  // 接受颜色参数，默认值为config.dart里的背景颜色
  Focus({this.bgcolor = agencyBgColor});
  final Color bgcolor;

  @override
  createState() => FocusState();
}

class FocusState extends State<Focus> {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    // 如果背景颜色是默认的背景颜色，说明是第一次进入倒计时组件，导航到倒计时组件
    // 如果不是默认的背景颜色，pop回上一层倒计时组件即可
    // ！important 写这个if条件是因为我不想写保持组件状态，好麻烦 :(
    if(widget.bgcolor != agencyBgColor){
      _timer = Timer(const Duration(seconds: 3), () {
        Navigator.of(context).pop();
      });
    }else{
      _timer = Timer(const Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => Peroid()));
      });
    }
    
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  build(BuildContext context) => Scaffold(
        body: Container(
          color: widget.bgcolor,
          child: Center(
            child: Text(
              "保持专注 !",
              style: TextStyle(
                color: Colors.white,
                fontSize: 60,
              ),
            ),
          ),
        ),
      );
}

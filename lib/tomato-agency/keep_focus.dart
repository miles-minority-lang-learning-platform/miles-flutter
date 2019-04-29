import 'package:flutter/material.dart';

class KeepFocusPage extends StatelessWidget {
  @override
  build(BuildContext context) => Scaffold(
        body: Container(
          color: Colors.red[300],
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

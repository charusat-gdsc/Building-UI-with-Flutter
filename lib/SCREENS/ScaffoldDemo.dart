import 'package:flutter/material.dart';

class ScaFFoldDemo extends StatelessWidget {
  Widget build(BuildContext context) {
    return (MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Flutter layout demo',
            ),
          ),
          body: Center(
            child: Text(
              'Flutter layout demo',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          )),
    ));
  }
}

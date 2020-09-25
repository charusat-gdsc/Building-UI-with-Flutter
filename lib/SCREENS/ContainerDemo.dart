import 'package:flutter/material.dart';

class ContainerDemo extends StatelessWidget {
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
                child: Container(
              height: 200,
              width: 200,
              color: Theme.of(context).primaryColor,
              child: (Text(
                'Hellllo from dsc',
                style: TextStyle(fontSize: 30),
              )),
            )))));
  }
}

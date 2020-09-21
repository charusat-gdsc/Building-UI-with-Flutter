import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRv6OAICet9D9DJXVEoq4D0vrz1uIpB-NpI0w&usqp=CAU'),
                        fit: BoxFit.contain)),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: new RaisedButton(
                          onPressed: () {},
                          child: new Text('Tap to continue'),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0))),
                    )))));
  }
}

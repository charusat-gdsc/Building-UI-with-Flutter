import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.blue[50],
            ),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            child: new Padding(
              padding: EdgeInsets.all(10),
              child: new Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRv6OAICet9D9DJXVEoq4D0vrz1uIpB-NpI0w&usqp=CAU'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('Aditya Pahilwani',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                            textAlign: TextAlign.right),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    width: double.infinity,
                    height: 270.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRv6OAICet9D9DJXVEoq4D0vrz1uIpB-NpI0w&usqp=CAU')),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.redAccent,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Description : ', // default text style
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        TextSpan(
                          text: 'Lorem sjdbnjkfdbnjkdfbnfjkdbnjkfdnjk ',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}

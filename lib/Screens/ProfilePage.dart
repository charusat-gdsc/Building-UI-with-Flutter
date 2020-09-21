import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: CircleAvatar(
            radius: 75,
            foregroundColor: Colors.cyan,
            backgroundImage: NetworkImage(
                'https://i.ndtvimg.com/i/2017-12/taarak-mehta_650x400_71512112548.jpg'),
          ),
        ),
        Text(
          'Jethalal',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 50,
          width: 175,
          margin: EdgeInsets.symmetric(vertical: 20),
          child: RaisedButton(
            onPressed: () {},
            color: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            splashColor: Colors.blueAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.power_settings_new,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}

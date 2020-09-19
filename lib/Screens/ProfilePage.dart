import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 75,
          width: double.infinity,
        ),
        CircleAvatar(
          radius: 75,
          foregroundColor: Colors.cyan,
        ),
        SizedBox(
          height: 40,
        ),
        Text('Binod Tharu',
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold
        ),
        ),
        SizedBox(height: 250,),
        Container(
          height: 50,
          width: 175,
          child: RaisedButton(onPressed: (){},
          color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
          ),
          splashColor: Colors.blueAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.power_settings_new, color: Colors.white,),
              SizedBox(
                width: 15,
              ),
              Text('Logout',
              style: TextStyle(
                color: Colors.white
              ),)
            ],
          ),
          ),
        )

      ],
      
    );
  }
}
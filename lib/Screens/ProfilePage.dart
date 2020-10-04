import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name;

  String photoUrl;

  bool isLoaded = false;

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  void getProfileData() async {
    try {
      User user = _auth.currentUser;

      DocumentSnapshot document =
          await _db.collection("users").doc(user.uid).get();

      setState(() {
        isLoaded = true;
        name = document.data()['displayName'];
        photoUrl = document.data()["photoUrl"];
        isLoaded = true;
      });
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    if (isLoaded) {
      return Container(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: 50,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(170),
                  child: Image(
                    image: NetworkImage(photoUrl),
                    width: 170,
                    height: 170,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 30),
            ),
            Container(
              height: 50,
              width: 175,
              margin: EdgeInsets.symmetric(vertical: 20),
              child: RaisedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  try {
                    googleSignIn.signOut();
                  } catch (e) {}
                },
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
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
        ),
      );
    } else {
      return Container(
        child: Center(
          child: Text("Loading"),
        ),
      );
    }
  }
}

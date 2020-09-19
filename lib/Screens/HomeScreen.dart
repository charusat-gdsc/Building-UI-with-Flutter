import 'package:dsc_gram/Screens/PostImage.dart';
import 'package:flutter/material.dart';

import 'FeedPage.dart';
import 'ProfilePage.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  var pages = [FeedPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('DSC Gram'),
        actions: [
          IconButton(
            icon: Icon(Icons.camera),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PostImageScreen()));
            },
          )
        ],
      ),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.image), title: Text('Feed')),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), title: Text('Profile'))
        ],
        currentIndex: pageIndex,
        onTap: (i) {
          setState(() {
            pageIndex = i;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  bool _isLoading = true;
  FirebaseFirestore _db = FirebaseFirestore.instance;

  List<DocumentSnapshot> posts;

  @override
  void initState() {
    _fetchPosts();
    super.initState();
  }

  _fetchPosts() async {
    try {
      setState(() {
        _isLoading = true;
      });
      QuerySnapshot snap =
          await _db.collection("posts").orderBy("date", descending: true).get();
      setState(() {
        posts = snap.docs;
        _isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Container(
        child: LinearProgressIndicator(),
      );
    } else {
      return Container(
        child: RefreshIndicator(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (BuildContext context, i) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 7,
                          color: Colors.grey,
                          offset: Offset(0, 3),
                        ),
                      ]),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(posts[i].data()['name'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: FadeInImage(
                          placeholder: AssetImage("assets/placeholder.png"),
                          image: NetworkImage(posts[i].data()["photoURL"]),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(posts[i].data()['caption'],
                          style: TextStyle(
                            fontSize: 22,
                          )),
                    ],
                  ),
                );
              },
            ),
            onRefresh: () {
              return _fetchPosts();
            }),
      );
    }
  }
}

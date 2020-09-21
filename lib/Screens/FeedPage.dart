import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
          child: ListView.builder(
            itemCount: 1,
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
                    Text('Kokilaben',
                        style: TextStyle(
                          fontSize: 24,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: 300,
                          color: Colors.cyan,
                          child: const Image(
                            image: NetworkImage(
                                'https://m.hindustantimes.com/rf/image_size_444x250/HT/p2/2020/08/24/Pictures/_2679ee8c-e5bd-11ea-afd3-94cd0f514a98.png'),
                            fit: BoxFit.cover,
                          ),
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Rasode mein kaun tha?',
                        style: TextStyle(
                          fontSize: 22,
                        )),
                  ],
                ),
              );
            },
          ),
          onRefresh: () {
            return null;
          }),
    );
  }
}

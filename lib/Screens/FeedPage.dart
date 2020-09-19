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
            itemCount: 3,
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
                  horizontal: 5,
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Binod'),
                    SizedBox(
                      height: 5,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          height: 300,
                          color: Colors.cyan,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Caption')
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

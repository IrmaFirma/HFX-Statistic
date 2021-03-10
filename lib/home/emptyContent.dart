import 'package:flutter/material.dart';

class EmptyContent extends StatelessWidget {
  const EmptyContent({
    Key key,
    this.title = 'Nothing here',
    this.message = 'Add a new item to get started',
    this.imageURL = 'assets/box.png',
  }) : super(key: key);
  final String title;
  final String message;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 32.0, color:  Color(0xFFC6D5E9)),
          ),
          Text(
            message,
            style: TextStyle(fontSize: 16.0, color:  Color(0xFFC6D5E9)),
          ),
          SizedBox(height:10),
          Container(
            height: 200,
            width: 200,
            child: Image.asset(imageURL),
          ),
        ],
      ),
    );
  }
}

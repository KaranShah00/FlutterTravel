import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Container(
        child: Image.network(
          "https://miro.medium.com/max/1200/1*XmJNRu6Fzn4woXyUoORydQ.png",
          height: double.infinity,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}

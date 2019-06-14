import 'package:flutter/material.dart';

class myPage extends StatefulWidget {
  @override
  _myPageState createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
        backgroundColor: Colors.red,
        centerTitle: false,
        leading: Icon(Icons.directions_bike),
      ),
      body: Container(
        color: Colors.orangeAccent,
      ),
    );
  }
}

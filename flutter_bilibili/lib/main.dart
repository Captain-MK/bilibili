import 'package:flutter/material.dart';
import 'package:flutter_bilibili/Fragment/homePage/home_Page.dart';
import 'package:flutter_bilibili/Fragment/my_Page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex = 0;
  final _body = [
    new HomePage(),
    new HomePage(),
    new HomePage(),
    new HomePage(),
    new myPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body[_currentIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
              title: Text('关注'),
              icon: Icon(Icons.print),
            ),
            BottomNavigationBarItem(
              title: Text('首页'),
              icon: Icon(Icons.print),
            ),
            BottomNavigationBarItem(
              title: Text('首页'),
              icon: Icon(Icons.print),
            ),
            BottomNavigationBarItem(
              title: Text('我的'),
              icon: Icon(Icons.monetization_on),
            ),
          ],
          //设置显示的模式
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              print(_currentIndex);
            });
          },
        ),
      ),
    );
  }
}

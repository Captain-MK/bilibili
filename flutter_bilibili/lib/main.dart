import 'package:flutter/material.dart';
import 'package:flutter_bilibili/Fragment/homePage/home_Page.dart';
import 'package:flutter_bilibili/Fragment/my_Page.dart';
import 'Fragment/animationPage.dart';
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

class _MyHomePageState extends State<MyHomePage>{
  var _currentIndex = 0;
  final _body = [
    new HomePage(),
    new HomePage(),
    new HomePage(),
    new animationPage(),
    new myPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(children: _body,index: _currentIndex,),//IndexedStack可以保持页面状态。。。。。2.不适合这个页面AutomaticKeepAliveClientMixin也可以
      bottomNavigationBar: Theme(//或者使用Scaffold的bottomSheet: ,属性
        data: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(title: Text('首页'), icon: Icon(Icons.home)),
            BottomNavigationBarItem(
              title: Text('频道'),
              icon: Icon(Icons.live_tv),
            ),
            BottomNavigationBarItem(
              title: Text('动态'),
              icon: Icon(Icons.move_to_inbox),
            ),
            BottomNavigationBarItem(
              title: Text('会员购'),
              icon: Icon(Icons.shopping_cart),
            ),
            BottomNavigationBarItem(
              title: Text('我的'),
              icon: Icon(Icons.person),
            ),
          ],
          //设置显示的模式
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

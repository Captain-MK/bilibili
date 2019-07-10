import 'package:flutter/material.dart';
import 'package:flutter_bilibili/AppModel.dart';
import 'package:flutter_bilibili/Fragment/channelPage/channelPage.dart';
import 'package:flutter_bilibili/Fragment/homePage/home_Page.dart';
import 'package:flutter_bilibili/Fragment/my_Page.dart';
import 'package:flutter_bilibili/Fragment/shoppingPage/shoppingPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'Fragment/dynamic/dynamicPage.dart';
import 'dart:ui';
//void main() => runApp(MyApp());
void main() async {
  int index = await AppModel().getSaveIndex();
  runApp(MyApp(index));
}
class MyApp extends StatelessWidget {
  int index=0;
  MyApp(this.index);
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
        model: AppModel(),
        child: ScopedModelDescendant<AppModel>(
          builder: (c,child,model){
            print('child是什么${child}、${c}、${model}');
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(primarySwatch: themeList[model.themeIndex != 0?model.themeIndex:index],),
              home: MyHomePage(title: 'Flutter Demo Home Page'),
              debugShowCheckedModeBanner: false,
            );
          })
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
    new channelPage(),
    new dynamicPage(),
    new shoppingPage(),
    new myPage(),
//    new HeroPage(url: 'http://b-ssl.duitang.com/uploads/item/201704/30/20170430194407_JtvXr.thumb.224_0.jpeg',
//      index: 0,
//    ),
  ];
  Future<String> getColor() async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String value = sp.getString('navColor');
    return value;
  }
@override
  void initState(){
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334,allowFontScaling: true)..init(context);
//
//    print(MediaQuery.of(context).size);
//    var t = MediaQuery.of(context).padding.top;
//    print('t: $t');
//
//    var s = ScreenUtil.statusBarHeight;
//    print('s: $s');
//
//    var wx = window.physicalSize;
//    print('wx: $wx');
//
//    var wp = window.padding;
//    print('wp: $wp');
//
//    var ss = window.devicePixelRatio;
//    print('ss: $ss');
//
//    var su = ScreenUtil.pixelRatio;
//    print('su: $su');
//    print(ScreenUtil.screenHeight);
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
              title: Text('圈子'),
              icon: Icon(Icons.live_tv),
            ),
            BottomNavigationBarItem(
              title: Text('逛一逛'),
              icon: Icon(Icons.move_to_inbox),
            ),
            BottomNavigationBarItem(
              title: Text('族人圈'),
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

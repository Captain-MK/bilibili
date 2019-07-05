import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PagesViewPage extends StatefulWidget {
  @override
  _PagesViewPageState createState() => _PagesViewPageState();
}

class _PagesViewPageState extends State<PagesViewPage> with SingleTickerProviderStateMixin{
  PageController _controller;
  TabController _tabController;
  int _index = 0;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0,keepPage: true,viewportFraction:1);//viewportFraction占屏幕比例

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener((){
      _controller.animateToPage(_tabController.index, duration: Duration(milliseconds: 50), curve: Curves.easeInOut);
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  Widget _rendRow(BuildContext context,int index){
    return new Padding(
        padding: EdgeInsets.symmetric(
            vertical: 30.0,
            horizontal: 20.0
        ),
        child: new GestureDetector(
          onTap: (){
            Scaffold.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.deepOrangeAccent,
              duration: Duration(milliseconds: 800),
              content: Text(
                "222",
//                descriptions[index],
                style: TextStyle(fontSize: 25.0),
              ),
            ));
          },
          child: new Material(
            elevation: 5.0,
            child: new Container(
              color: Colors.deepOrange,
              child: new Text("$index"),
            ),
          ),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 5,right: ScreenUtil.getInstance().setHeight(300)),
            height: ScreenUtil.getInstance().setHeight(80),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              controller: _tabController,
                tabs: [
                  Text('转发',style: TextStyle(color: Colors.black),),
                  Text('测试',style: TextStyle(color: Colors.black),),
                  Text('TabBar',style: TextStyle(color: Colors.black),),
                ],
            ),
          ),
          Container(
            height: ScreenUtil.getInstance().setHeight(80),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Row(
              children: <Widget>[
                SizedBox(width: ScreenUtil.getInstance().setHeight(40),),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _index = 0;
                      _controller.animateToPage(0, duration: Duration(milliseconds: 50), curve: Curves.easeInOut);
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('转发',style: TextStyle(color: _index == 0?Colors.black:Colors.black26,fontSize: 15),),
                      _index == 0?Container(color: Colors.green,width: ScreenUtil.getInstance().setWidth(60),height: 2.0,):Container(height: 3.0,),
                    ],
                  ),
                ),
                SizedBox(width: ScreenUtil.getInstance().setHeight(40),),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _index = 1;
                      _controller.animateToPage(1, duration: Duration(milliseconds: 50), curve: Curves.easeInOut);
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('滚吧',style: TextStyle(color: _index == 1?Colors.black:Colors.black26,fontSize: 15),),
                      _index == 1?Container(color: Colors.green,width: ScreenUtil.getInstance().setWidth(60),height: 2.0,):Container(height: 3.0,),
                    ],
                  ),
                ),
                SizedBox(width: 30,),
                Text('Row'),
              ],
            ),
          ),
          Expanded(
            child: PageView(
              onPageChanged: (value){
                setState(() {
                  _index = value;
                  _tabController.animateTo(value);
                });
              },
              scrollDirection: Axis.horizontal,
              controller: _controller,
              children: <Widget>[
                pageOne(),
                _rendRow(context,1),
//                pageTwo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class pageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('One'),
        ),
      ),
    );
  }
}
class pageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Two'),
        ),
      ),
    );
  }
}

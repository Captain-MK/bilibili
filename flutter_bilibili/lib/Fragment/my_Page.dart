import 'package:flutter/material.dart';
import 'package:flutter_bilibili/AppModel.dart';
import '../Fragment/animationPage.dart';
class myPage extends StatefulWidget {
  @override
  _myPageState createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  double _NavHeight = 97.0;
  var _listController;
  var _opacity = 0.0;


  var _index=0;
  var _themeColor;
  void getindex ()async{
    _index = await AppModel().getSaveIndex();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listController = ScrollController();
    getindex();
  }
  Widget itemWidget(int index) {
    if (index == 0){
      return Container(
        height: _NavHeight,
        child: Image.asset('images/bj.png',fit: BoxFit.fill,),
      );
    }else{
      return ListTile(
        title: Text('今天吃什么？${index}',style: TextStyle(color: _themeColor),),
        leading: Icon(Icons.query_builder,color: _themeColor,),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>animationPage()));
        },
      );
    }
  }
  void _onScroller(int i) {
    var aa = i/_NavHeight;
    if(aa >= 1.0){
      aa = 1.0;
    }else if (aa <=0.0){
      aa = 0.0;
    }
    setState(() {
      _opacity = aa;
    });
  }
  @override
  Widget build(BuildContext context) {
    final model = AppModel.of(context);
    _themeColor = themeList[model.themeIndex != 0?model.themeIndex:_index];
    return Scaffold(
      body: Stack(
        children: <Widget>[
          NotificationListener(
            onNotification: (ScrollNotification note) {
              print(note.metrics.pixels.toInt());// 滚动位置。
              _onScroller(note.metrics.pixels.toInt());
            },
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return itemWidget(index);
                },
              ),
            ),
          ),
          Opacity(
            opacity: _opacity,
            child: Container(
              height: _NavHeight,
              color: _themeColor,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text('我的页面',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bilibili/AppModel.dart';
import '../Fragment/animationPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class myPage extends StatefulWidget {
  @override
  _myPageState createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  double _NavHeight = 0.0;
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
    print('第一次调用');//setSatae不会重复调用initState（）、、、、build会调用
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
//    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
//    _NavHeight = ScreenUtil.statusBarHeight;
    _NavHeight = tool(context).navHeight;
    final model = AppModel.of(context);
    _themeColor = themeList[model.themeIndex != 0?model.themeIndex:_index];
    return Scaffold(
      body: Stack(
        children: <Widget>[
          NotificationListener(
            onNotification: (ScrollNotification note) {
//              print(note.metrics.pixels.toInt());// 滚动位置。
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


class tool extends ScreenUtil{
  static const String wo = 'wo';
//  final double _screenW = ScreenUtil.screenWidth;//私有属性。防止修改
//  get screenW => _screenW;
//  final double navHeight = ScreenUtil.statusBarHeight;
  get navHeight {//计算属性 不可以穿参数
    return ScreenUtil.statusBarHeight;
  }
  double screenW(){ //方法可以穿参数
    return ScreenUtil.screenWidth;
  }
  tool(BuildContext context){
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
  }


//  set userName (value){ //set方法，必须有参数，需要赋值
//    this.name= value;
//  }
//  tool.userName = "asd";

//  Person():name = "xxx",age=20{ 初始化之前默认给属性赋值
//
//  }
}
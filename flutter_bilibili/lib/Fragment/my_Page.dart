import 'package:flutter/material.dart';
import 'package:flutter_bilibili/AppModel.dart';
import '../Fragment/animationPage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class myPage extends StatefulWidget {
  @override
  _myPageState createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  final _scrollController = ScrollController();
  bool _showToTopBtn = false;
  var _opacity = 0.0;

  var _index = 0;
  var _themeColor;
  void getindex() async {
    _index = await AppModel().getSaveIndex();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener((){
      //一样
//      print(_scrollController.position.pixels);
//      print(_scrollController.offset);
      if (_scrollController.offset < 500 && _showToTopBtn) {
        setState(() {
          _showToTopBtn = false;
        });
      } else if (_scrollController.offset >= 500 && _showToTopBtn == false) {
        setState(() {
          _showToTopBtn = true;
        });
      }
    });
    getindex();
    print('第一次调用'); //setSatae不会重复调用initState（）、、、、build会调用
  }
  _items(){
    List<Widget> _list = [];
    for (int i = 0;i<5;i++){
      Widget a = PhysicalModel(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(15.0),
                              clipBehavior: Clip.antiAlias,
                              child: GestureDetector(
                                child: Image.network(
                                    'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3302790822,2591684234&fm=27&gp=0.jpg',
                                    fit: BoxFit.fill,width: 120,height: 80,),
                                onTap: () {
                                  Fluttertoast.showToast(
                                      msg: "图片",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIos: 1,
                                      backgroundColor: Colors.black38,
                                      textColor: Colors.white,
                                      fontSize: 13.0);
                                },
                              ),
                            );
      _list.add(a);
    }
    return _list;
  }
  Widget itemWidget(int index) {
    if (index == 0) {
      return Container(
          height: MediaQuery.of(context).padding.top+44,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Image.asset(
                'images/bj.png',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                bottom: 10.0,
                child: Text('我爱你😍'),
              ),
            ],
          ));
    } else {
      return GestureDetector(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>animationPage()));
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 50.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Image.asset(
                        'images/user.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '空空如也',
                            style: TextStyle(color: _themeColor),
                          ),
                          Text(
                            '昨天 18：00 来自音乐节',
                            style: TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(width: 0.5, color: Colors.pink),
                      ),
                      child: GestureDetector(
                        child: Center(
                          child: Text(
                            '关注',
                            style: TextStyle(fontSize: 11, color: _themeColor),
                          ),
                        ),
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: "关注成功",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIos: 1,
                              backgroundColor: Colors.black38,
                              textColor: Colors.white,
                              fontSize: 13.0);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.close,
                      size: 17,
                      color: Colors.black45,
                    ),
                  ],
                ),
              ),
              Text(
                index % 2 == 0
                    ? '清洗端午，纵情飞跃，呵呵哈哈上证报中国证券网讯 资本相继涌入持牌消费金融公司,这次又有一家互联网巨头入局。 继度小满日前获批入股哈银消费金融公司之后,新浪微博成为新晋玩家。...'
                    : '新浪微博成为新晋玩家。...',
                style: TextStyle(fontSize: 12, color: _themeColor),
              ),
              SizedBox(
                height: 5.0,
              ),
//              index %2 ==0 ?
//              Wrap(
//                direction: Axis.horizontal,
//                children: _items(),
//                spacing: 10,
//                runSpacing: 5,
//              ):Container(),
              index % 2 == 0
                  ? Container(
                      height: ((MediaQuery.of(context).size.width-50)/3-0.5)*3+30,
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 1),
                          physics: new NeverScrollableScrollPhysics(),
                          itemCount: 9,
                          itemBuilder: (c, imageIndex) {
                            return GestureDetector(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Hero(
                                  tag: 'image${index}${imageIndex}',
                                  transitionOnUserGestures: true,
                                  child: Image.network(
                                      imageIndex%2==0?'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3409605815,553104213&fm=26&gp=0.jpg':'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3302790822,2591684234&fm=27&gp=0.jpg',
                                      fit: BoxFit.fill),
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(builder: (content)=>HeroPage(
                                  url: imageIndex%2==0?'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3409605815,553104213&fm=26&gp=0.jpg':'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3302790822,2591684234&fm=27&gp=0.jpg',
                                  index: index,
                                  imageIndex:imageIndex,
                                )));
//                                Fluttertoast.showToast(
//                                    msg: "图片${index}",
//                                    toastLength: Toast.LENGTH_SHORT,
//                                    gravity: ToastGravity.CENTER,
//                                    timeInSecForIos: 1,
//                                    backgroundColor: Colors.black38,
//                                    textColor: Colors.white,
//                                    fontSize: 13.0);
                              },
                            );
                          }),
                    )
                  : Container(),
              Container(
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.black12),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.share,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '分享',
                            style:
                                TextStyle(fontSize: 11, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.chat,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '999',
                            style:
                                TextStyle(fontSize: 11, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.monetization_on,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '999',
                            style:
                                TextStyle(fontSize: 11, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  void _onScroller(int i) {
    var aa = i / (MediaQuery.of(context).padding.top+44);
    if (aa >= 1.0) {
      aa = 1.0;
    } else if (aa <= 0.0) {
      aa = 0.0;
    }
    setState(() {
      _opacity = aa;
    });
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final model = AppModel.of(context);
    _themeColor = themeList[model.themeIndex != 0 ? model.themeIndex : _index];
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
                controller: _scrollController,
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return itemWidget(index);
                },
              ),
            ),
          ),
          Positioned( //Place it at the top, and not use the entire screen
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Opacity(
              opacity: _opacity,
              child: AppBar(
                title: Text('我的'),
                centerTitle: true,
                brightness: Brightness.light,
                iconTheme: IconThemeData(
                  color: Colors.black, //change your color here
                ),
                elevation: 0.0,
              ),
            ),
          ),
//          Opacity(
//            opacity: _opacity,
//            child: Container(
//              padding: EdgeInsets.only(left: 0,right: 0,top: 0),
////              height: _NavHeight,
//              color: _themeColor,
//              child: AppBar(
//                title: Text('我的页面'),
//                centerTitle: true,
//                brightness: Brightness.light,
//                iconTheme: IconThemeData(
//                  color: Colors.black, //change your color here
//                ),
//              ),
//            ),
//          ),
        ],
      ),
      floatingActionButton: !_showToTopBtn ? null : FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: () {
            //返回到顶部时执行动画
            _scrollController.animateTo(.0,
                duration: Duration(milliseconds: 200),
                curve: Curves.ease
            );
          }
      ),
    );
  }
}


class HeroPage extends StatefulWidget {
  final String url;
  final int index;
final int imageIndex;
  const HeroPage({Key key, this.url, this.index, this.imageIndex}) : super(key: key);
  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HeroPage'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(tag: 'image${widget.index}${widget.imageIndex}',
              transitionOnUserGestures: true,
              child: Image.network(
                widget.url,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width*0.8,
                fit: BoxFit.fill,
              ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              height: 50.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipOval(
                    child: Image.asset(
                      'images/user.png',
                      width: 30,
                      height: 30,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '空空如也',
                          style: TextStyle(color: Colors.black),
                        ),
                        Text(
                          '昨天 18：00 来自音乐节',
                          style: TextStyle(
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(width: 0.5, color: Colors.pink),
                    ),
                    child: GestureDetector(
                      child: Center(
                        child: Text(
                          '关注',
                          style: TextStyle(fontSize: 11, color: Colors.black54),
                        ),
                      ),
                      onTap: () {
                        Fluttertoast.showToast(
                            msg: "关注成功",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.black38,
                            textColor: Colors.white,
                            fontSize: 13.0);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.close,
                    size: 17,
                    color: Colors.black45,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              widget.imageIndex % 2 == 0
                  ? '清洗端午，纵情飞跃，呵呵哈哈上证报中国证券网讯 资本相继涌入持牌消费金融公司,这次又有一家互联网巨头入局。 继度小满日前获批入股哈银消费金融公司之后,新浪微博成为新晋玩家。...'
                  : '新浪微博成为新晋玩家。...',
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}




class tool extends ScreenUtil {
  static const String wo = 'wo';

//  final double _screenW = ScreenUtil.screenWidth;//私有属性。防止修改
//  get screenW => _screenW;
//  final double navHeight = ScreenUtil.statusBarHeight;
  get navHeight {
    //计算属性 不可以穿参数
    return ScreenUtil.statusBarHeight;
  }

  double screenW() {
    //方法可以穿参数
    return ScreenUtil.screenWidth;
  }

  tool(BuildContext context) {
//    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
  }

//  set userName (value){ //set方法，必须有参数，需要赋值
//    this.name= value;
//  }
//  tool.userName = "asd";

//  Person():name = "xxx",age=20{ 初始化之前默认给属性赋值
//
//  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bilibili/Fragment/homePage/homeBody.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_bilibili/Fragment/homePage/homeAppBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var _tabbarController;
  var _textFieldController;
  List<String> getDataList() {
    List<String> list = [];
    for (int i = 0; i < 10; i++) {
      list.add(i.toString());
    }
    return list;
  }

  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
  }

  Widget getItemContainer(String item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipOval(
          child: Image.asset(
            'images/小红花.png',
            width: 35.0,
            height: 35.0,
          ),
        ),
        Text(
          '英雄联盟$item',
          style: TextStyle(fontSize: 12.0),
        ),
      ],
    );
  }

  Widget getGrideView(String item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            ClipRRect(
              child: Image.network(
                  'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3300305952,1328708913&fm=27&gp=0.jpg'),
              borderRadius: BorderRadius.circular(10.0),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '惩恶',
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      Text(
                        '8.8万',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        Text('英雄联盟$item'),
        Text(
          'desc$item',
          style: TextStyle(fontSize: 11.0, color: Colors.black26),
        ),
      ],
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textFieldController = TextEditingController();
    _tabbarController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List<String> datas = getDataList();
    return Scaffold(
      appBar: homeAppBar(),
      body: Column(
        children: <Widget>[
          homeBody(_tabbarController),
          Divider(
            height: 1.0,
            color: Colors.black12,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabbarController,
              children: [
                ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      height: 250.0,
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.network(
                              "http://pic9.nipic.com/20100824/2531170_082435310724_2.jpg",
                              fit: BoxFit.fill,
                            ),
                          );
                        },
                        itemCount: 3,
                        pagination: new SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                              color: Colors.white,
                              activeColor: Colors.blue,
                              size: 5.0,
                              activeSize: 5.0),
                        ),
//            control: new SwiperControl(),
                        scrollDirection: Axis.horizontal,
                        autoplay: true,
                        viewportFraction: 0.9,
                        scale: 0.9,
                        onTap: (index) => print('点击了第$index个'),
                      ),
                    ),
                    Container(
                      height: 155.0,
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: GridView.builder(
                          physics: new NeverScrollableScrollPhysics(),
                          //屏蔽GridView内部滚动
                          itemCount: datas.length,
//SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
//横轴元素个数
                                  crossAxisCount: 5,
//纵轴间距
                                  mainAxisSpacing: 10.0,
//横轴间距
                                  crossAxisSpacing: 10.0,
//子组件宽高长度比例
                                  childAspectRatio: 1.0),
                          itemBuilder: (BuildContext context, int index) {
//Widget Function(BuildContext context, int index)
                            return getItemContainer(datas[index]);
                          }),
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.black12,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0),
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Text(
                            '我的关注',
                            style:
                                TextStyle(fontSize: 17.0, color: Colors.black),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            '16小时前，地球大爆炸了',
                            style: TextStyle(
                                color: Colors.black38, fontSize: 13.0),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 15.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black38,
                              size: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 1.0,
                      color: Colors.black12,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15.0),
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Text(
                            '推荐直播',
                            style:
                                TextStyle(fontSize: 17.0, color: Colors.black),
                          ),
                          Expanded(
                            child: Container(),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 15.0),
                              child: Row(
                                children: <Widget>[
                                  Text('换一换'),
                                  Icon(
                                    Icons.refresh,
                                    color: Colors.black38,
                                    size: 20.0,
                                  )
                                ],
                              ))
                        ],
                      ),
                    ), //推荐直播
                    Container(
                      height: 680,
                      margin: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: GridView.builder(
                          physics: new NeverScrollableScrollPhysics(),
                          //屏蔽GridView内部滚动
                          itemCount: datas.length,
//SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
//横轴元素个数
                                  crossAxisCount: 2,
//纵轴间距
                                  mainAxisSpacing: 5.0,
//横轴间距
                                  crossAxisSpacing: 15.0,
//子组件宽高长度比例
                                  childAspectRatio: 1.3),
                          itemBuilder: (BuildContext context, int index) {
//Widget Function(BuildContext context, int index)
                            return getGrideView(datas[index]);
                          }),
                    ),

                    Divider(
                      height: 1.0,
                      color: Colors.black12,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.0),
                      child: TextField(
                        controller: _textFieldController,
                        focusNode: FocusNode(),
                        decoration: InputDecoration(
                          labelText: '请输入你的ID',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
                Center(
                  child: Icon(Icons.add,size: 100.0,color: Colors.red,),
                ),
                Center(
                  child: Icon(Icons.add,size: 100.0,color: Colors.orangeAccent,),
                ),
                Center(
                  child: Icon(Icons.add,size: 100.0,),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final isshowline = false;
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
        ClipOval(child: Image.asset('images/bj.png',width: 35.0,height: 35.0,),),
        Text('英雄联盟$item',style: TextStyle(fontSize: 12.0),),
      ],);
  }
  Widget getGrideView(String item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipRRect(child: Image.network('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=3300305952,1328708913&fm=27&gp=0.jpg'),
          borderRadius: BorderRadius.circular(10.0),
        ),

        Text('英雄联盟$item'),
        Text('desc$item',style: TextStyle(fontSize: 11.0,color: Colors.black26),),
      ],);
  }
  @override
  Widget build(BuildContext context) {
    List<String> datas = getDataList();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          children: <Widget>[
            Icon(Icons.menu),
            ClipOval(
              child: Image.asset(
                'images/user.png',
                width: 35.0,
                height: 35.0,
              ),
            ),
            Container(
              alignment: Alignment(-0.9, 0),
              margin: EdgeInsets.only(left: 20.0),
              width: 180.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Icon(Icons.search),
            ),
          ],
        ),
        actions: <Widget>[
          Icon(Icons.bug_report),
          SizedBox(
            width: 10.0,
          ),
          ClipOval(
            child: Image.asset(
              'images/user.png',
              width: 35.0,
              height: 35.0,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 40.0,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('车祸0'),
                    Container(width:30.0,height: 2.0,color: Colors.purple,margin: EdgeInsets.only(top: 10.0),),
                  ],),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('车祸0'),
                    Container(width:30.0,height: 2.0,color: Colors.transparent,margin: EdgeInsets.only(top: 10.0),),
                  ],),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('车祸0'),
                    Container(width:30.0,height: 2.0,color: Colors.transparent,margin: EdgeInsets.only(top: 10.0),),
                  ],),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('车祸0'),
                    Container(width:30.0,height: 2.0,color: Colors.transparent,margin: EdgeInsets.only(top: 10.0),),
                  ],),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('哈哈'),
                    Container(width:30.0,height: 2.0,color: Colors.transparent,margin: EdgeInsets.only(top: 10.0),),
                  ],),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15.0),
            child: ClipRRect(child: Image.asset('images/bj.png'),borderRadius: BorderRadius.circular(30.0),),
          ),
          Container(
            height: 155.0,
            margin: EdgeInsets.only(left:15.0,right: 15.0),
            child: GridView.builder(
                physics: new NeverScrollableScrollPhysics(),//屏蔽GridView内部滚动
                itemCount: datas.length,
                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
          Divider(height: 1.0,color: Colors.black12,),
          Container(
            margin: EdgeInsets.only(left: 15.0),
            height: 40,
            child: Row(
              children: <Widget>[
                Text('我的关注',style: TextStyle(fontSize: 17.0,color: Colors.black),),
                SizedBox(width: 20.0,),
                Text('16小时前，地球大爆炸了',style: TextStyle(color: Colors.black38,fontSize: 13.0),),
                Expanded(child: Container(),),
                Container(margin: EdgeInsets.only(right: 15.0),child: Icon(Icons.arrow_forward_ios,color: Colors.black38,size: 15.0,),),
              ],
            ),
          ),
          Divider(height: 1.0,color: Colors.black12,),
          Container(
            margin: EdgeInsets.only(left: 15.0),
            height: 40,
            child: Row(
              children: <Widget>[
                Text('推荐直播',style: TextStyle(fontSize: 17.0,color: Colors.black),),
                Expanded(child: Container(),),
                Container(margin: EdgeInsets.only(right: 15.0),child: Row(children: <Widget>[Text('换一换'),Icon(Icons.refresh,color: Colors.black38,size: 20.0,)],))
              ],
            ),
          ),//推荐直播

          Container(
            height: 680,
            margin: EdgeInsets.only(left:15.0,right: 15.0),
            child: GridView.builder(
                physics: new NeverScrollableScrollPhysics(),//屏蔽GridView内部滚动
                itemCount: datas.length,
                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                    crossAxisCount: 2,
                    //纵轴间距
                    mainAxisSpacing: 5.0,
                    //横轴间距
                    crossAxisSpacing: 15.0,
                    //子组件宽高长度比例
                    childAspectRatio:1.3
                ),
                itemBuilder: (BuildContext context, int index) {
                  //Widget Function(BuildContext context, int index)
                  return getGrideView(datas[index]);
                }),
          ),
        ],
      ),
    );
  }
}

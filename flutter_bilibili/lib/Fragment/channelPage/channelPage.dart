import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bilibili/Fragment/channelPage/news_entity.dart';
import 'package:flutter_bilibili/HttpTool/httpTool.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class channelPage extends StatefulWidget {
  @override
  _channelPageState createState() => _channelPageState();
}

class _channelPageState extends State<channelPage> with SingleTickerProviderStateMixin{
  TabController _tabbarController;
  NewsEntity _newsModel = NewsEntity(datas: []);
  int _p = 0;
  RefreshController _refreshController;
  getHttp() {
    FormData formData = FormData.from({'cid': 60});
    HttpTool.getInstance().get(
      'http://www.wanandroid.com/article/list/${_p}/json',
          (data) {
        setState(() {
          _newsModel = NewsEntity.fromJson(data['data']);
        });
        _refreshController.refreshCompleted(resetFooterState: true);
      },
      params: formData,
    );
  }
  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh:true);
//    getHttp();
    _tabbarController = TabController(length: 2, vsync: this);
  }
  void _onRefresh(){
    _p = 0;
    getHttp();
  }

  void _onLoading(){
    _p++;
    getHttp();
  }
  void dispose(){
    _refreshController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 44,
          width: 150,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [Text('关注',style: TextStyle(fontSize: 20),),Text('推荐',style: TextStyle(fontSize: 20),)],
            controller: _tabbarController,
          ),
        ),
        centerTitle: true,
      ),
      body: TabBarView(
          controller: _tabbarController,
          children: [
            SmartRefresher(
              enablePullDown: true,
              enablePullUp: true,
              header: WaterDropHeader(),//defaultTargetPlatform == TargetPlatform.iOS?WaterDropHeader():WaterDropMaterialHeader(),
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child:_newsModel.datas.length > 0 ? ListView.builder(
                  itemCount: _newsModel.datas.length,
                  itemBuilder:(c,i){
                    NewsData model = _newsModel.datas[i];
                    return InkWell(
                      child: Container(
                        height: 100.0,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.black12,width: 1.0),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(width: 10.0,),
                            Image.asset('images/user.png',width: 40,height: 40,),
                            Container(width: 10.0,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(model.author+'${i}',style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                                  SizedBox(height: 10.0,),
                                  Text(model.title,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: (){
                        Fluttertoast.showToast(
                            msg: "This is Center Short Toast",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIos: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      },
                    );
                  }
              ):Center(child: Text('暂无数据'),),
            ),
            hotCircle(),
          ]),
    );
  }
}
class hotCircle extends StatefulWidget {
  @override
  _hotCircleState createState() => _hotCircleState();
}

class _hotCircleState extends State<hotCircle> with AutomaticKeepAliveClientMixin{
  Widget itemWidget(BuildContext context,int index) {
    return GestureDetector(
      onTap: (){
//          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>animationPage()));
      },
      child: Container(
        color: Colors.white,
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
                            style: TextStyle(fontSize: 11, color: Colors.black),
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
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              SizedBox(
                height: 5.0,
              ),
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
                    itemBuilder: (c, index) {
                      return PhysicalModel(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15.0),
                        clipBehavior: Clip.antiAlias,
                        child: GestureDetector(
                          child: Image.network(
                              index%2==0?'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=3409605815,553104213&fm=26&gp=0.jpg':'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3302790822,2591684234&fm=27&gp=0.jpg',
                              fit: BoxFit.fill),
                          onTap: () {
                            Fluttertoast.showToast(
                                msg: "图片${index}",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIos: 1,
                                backgroundColor: Colors.black38,
                                textColor: Colors.white,
                                fontSize: 13.0);
                          },
                        ),
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
      ),
    );
  }
  _getWidgets (BuildContext context){
    List<Widget> _items = [];
    for(int i = 0;i<500;i++){
      _items.add(itemWidget(context,i));
    }
    return _items;
  }
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
          itemCount: 20,
          itemBuilder: (c,i){
            if(i==0){
              return Container(
                height: 110,
                width: ScreenUtil.screenWidth,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 9,top: 4),
                      child: Text('热门圈主',style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          width: 60,
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('images/user.png',width: 39,height: 39,),
                              ),
                              Text('雨中渔童'),
                              Text('钢琴大咖',style: TextStyle(color: Colors.black26),),
                            ],
                          ),
                        ),
                        Container(
                          width: 60,
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('images/user.png',width: 39,height: 39,),
                              ),
                              Text('雨中渔童'),
                              Text('钢琴大咖',style: TextStyle(color: Colors.black26),),
                            ],
                          ),
                        ),
                        Container(
                          width: 60,
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('images/user.png',width: 39,height: 39,),
                              ),
                              Text('雨中渔童'),
                              Text('钢琴大咖',style: TextStyle(color: Colors.black26),),
                            ],
                          ),
                        ),
                        Container(
                          width: 60,
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('images/user.png',width: 39,height: 39,),
                              ),
                              Text('雨中渔童'),
                              Text('钢琴大咖',style: TextStyle(color: Colors.black26),),
                            ],
                          ),
                        ),
                        Container(
                          width: 60,
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('images/user.png',width: 39,height: 39,),
                              ),
                              Text('雨中渔童'),
                              Text('钢琴大咖',style: TextStyle(color: Colors.black26),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }else if (i==1){
              return Divider(height: 3,color: Colors.black12,);
            }else if (i==2){
              return Container(
                height: 137,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 6,),
                    Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(width: 9,),
                            Text('大家关注的圈子'),
                            SizedBox(width: 9,),
                            Text('每30分钟更新一次',style: TextStyle(color: Colors.black26),),
                          ],
                        ),
                        Expanded(child: Container(),),
                        Text('更多圈子',style: TextStyle(color: Colors.blue),),
                      ],
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left:9.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                RichText(text: TextSpan(children: [
                                  TextSpan(text: '北京同城圈',style: TextStyle(color: Colors.black)),
                                  TextSpan(text: '  哈哈',style: TextStyle(color: Colors.red)),
                                ])),
                                SizedBox(height: 10,),
                                Row(children: <Widget>[
                                  Text('魔法乐理圈'),
                                  SizedBox(width: 9,),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: GestureDetector(child: Text('热',style: TextStyle(color: Colors.white),),onTap: (){
                                      Fluttertoast.showToast(
                                          msg: "热",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIos: 1,
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          fontSize: 16.0
                                      );
                                    },),
                                  ),
                                ],),
                                SizedBox(height: 10,),
                                Text('爱音乐一起长'),
                              ],
                            ),
                          ),),
                          Container(
                            height: 90,
                            color: Colors.black12,
                            width: 2.0,
                          ),
                          Expanded(child: Padding(
                            padding: const EdgeInsets.only(left:9.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(children: <Widget>[
                                  Text('钢琴素养圈圈'),
                                  SizedBox(width: 9,),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text('新',style: TextStyle(color: Colors.white),),
                                  ),
                                ],),
                                SizedBox(height: 10,),
                                Text('21天家庭音乐课'),
                                SizedBox(height: 10,),
                                Text('更好的一门情商课'),
                              ],
                            ),
                          ),),
                        ],
                      ),
                    ),
                    Divider(height: 3,color: Colors.black12,),
                  ],
                ),
              );
            }else{
              return itemWidget(context,i-3);
            }
          }
      ),
    );//Scrollbar显示滚动条
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: 108,
              width: ScreenUtil.screenWidth,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 9,top: 4),
                    child: Text('热门圈主',style: TextStyle(fontSize: 12,color: Colors.black),),
                  ),
                  SizedBox(height: 6,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        width: 80,
                        child: Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('images/user.png',width: 39,height: 39,),
                            ),
                            Text('雨中渔童'),
                            Text('钢琴大咖',style: TextStyle(color: Colors.black26),),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        child: Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('images/user.png',width: 39,height: 39,),
                            ),
                            Text('雨中渔童'),
                            Text('钢琴大咖',style: TextStyle(color: Colors.black26),),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        child: Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('images/user.png',width: 39,height: 39,),
                            ),
                            Text('雨中渔童'),
                            Text('钢琴大咖',style: TextStyle(color: Colors.black26),),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        child: Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('images/user.png',width: 39,height: 39,),
                            ),
                            Text('雨中渔童'),
                            Text('钢琴大咖',style: TextStyle(color: Colors.black26),),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        child: Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset('images/user.png',width: 39,height: 39,),
                            ),
                            Text('雨中渔童'),
                            Text('钢琴大咖',style: TextStyle(color: Colors.black26),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(height: 3,color: Colors.black12,),
            Container(
              height: 137,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 6,),
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(width: 9,),
                          Text('大家关注的圈子'),
                          SizedBox(width: 9,),
                          Text('每30分钟更新一次',style: TextStyle(color: Colors.black26),),
                        ],
                      ),
                      Expanded(child: Container(),),
                      Text('更多圈子',style: TextStyle(color: Colors.blue),),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(child: Padding(
                          padding: const EdgeInsets.only(left:9.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('北京同城圈'),
                              SizedBox(height: 10,),
                              Text('北京同城圈'),
                              SizedBox(height: 10,),
                              Text('北京同城圈'),
                            ],
                          ),
                        ),),
                        Container(
                          height: 90,
                          color: Colors.black12,
                          width: 2.0,
                        ),
                        Expanded(child: Padding(
                          padding: const EdgeInsets.only(left:9.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('北京同城圈'),
                              SizedBox(height: 10,),
                              Text('北京同城圈'),
                              SizedBox(height: 10,),
                              Text('北京同城圈'),
                            ],
                          ),
                        ),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: _getWidgets(context),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
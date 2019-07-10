import 'package:flutter/material.dart';
import 'package:flutter_bilibili/Fragment/dynamic/topTeacherDetailPage.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_bilibili/Fragment/dynamic/model/dynamic_model_entity.dart';
import 'package:flutter_bilibili/Fragment/dynamic/widget/local_nav.dart';
import 'package:flutter_bilibili/Fragment/dynamic/widget/middle_card.dart';
import 'package:flutter_bilibili/Fragment/dynamic/widget/sales_box.dart';
import 'package:flutter_bilibili/Fragment/dynamic/widget/sub_nav.dart';
import 'package:flutter_bilibili/Fragment/dynamic/widget/web_view.dart';
import 'package:flutter_bilibili/HttpTool/httpTool.dart';
import 'package:flutter_bilibili/entity_factory.dart';
import 'package:fluttertoast/fluttertoast.dart';
class dynamicPage extends StatefulWidget {
  @override
  _dynamicPageState createState() => _dynamicPageState();
}

class _dynamicPageState extends State<dynamicPage> {
  DynamicModelEntity _dynamicModelEntity;

  void getHttp(){
    HttpTool.getInstance().get(
      'http://www.devio.org/io/flutter_app/json/home_page.json',
          (data) {
        setState(() {
          _dynamicModelEntity = EntityFactory.generateOBJ(data);
        });
      },
    );
  }
  @override
  void initState() {
    super.initState();
    getHttp();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(title: Text('动态'),),
      body: _dynamicModelEntity !=null?MediaQuery.removePadding(context: context, child: ListView(
        children: <Widget>[
          Container(
            height: 150.0,
            child: Swiper(
              itemCount: _dynamicModelEntity.bannerList.length,
              scrollDirection: Axis.horizontal,
              autoplay: true,
              pagination: new SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                    color: Colors.white,
                    activeColor: Colors.blue,
                    size: 5.0,
                    activeSize: 5.0),
              ),
              itemBuilder: (c,index){
                return Image.network(_dynamicModelEntity.bannerList[index].icon,height: 110.0,fit: BoxFit.fill,);
              },
            ),
          ),
          LocalNav(localNavList: _dynamicModelEntity.localNavList,callback: (model){
            print(model.url);
//            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WebView(model:model,)));
            Navigator.push(context,
                MaterialPageRoute(builder: (content)=>WebView(statusBarColor:model.statusBarColor,
                  icon: model.icon,
                  title: model.title,
                  url: model.url,
                  hideAppBar: model.hideAppBar,
                ))
            );
          },),
          MiddleCard(gridNavModel: _dynamicModelEntity.gridNav,),
          SubNav(subNavList: _dynamicModelEntity.subNavList,),
          SalesBox(salesBox: _dynamicModelEntity.salesBox,),
          circleWidget(),
          Divider(height: 8.0,color: Colors.transparent,),
          topTeacher(),
        ],
      ),removeTop: true,):Container(child: Center(child: CircularProgressIndicator(),),),
    );
  }
}

class circleWidget extends StatelessWidget {
  _items(){
    List<Widget> _arr = [];
    for(int i = 0;i<15;i++){
      _arr.add(item(i));
    }
    return _arr;
  }
  item (int index){
    return GestureDetector(
      onTap: (){
        Fluttertoast.showToast(
            msg: "items---${index}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 13.0);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 130.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [BoxShadow(color: Colors.black54,blurRadius: 5.0),],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 60,
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      child: Image.asset('images/bj.png',fit: BoxFit.fill,width: 130,)
                      ,borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                      ),
                    Positioned(
                      top: 5.0,
                      left: 5.0,
                      child: Text('Top${index}',style: TextStyle(fontSize: 11,color: Colors.white),),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text('魔法乐理会员服务',style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: Colors.black),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text('会员服务',style: TextStyle(fontSize: 11,color: Colors.black38),),
              ),
              SizedBox(height: 8.0,),
              Divider(height: 1.0,color: Colors.black12,),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text('打造家长的孩子',style: TextStyle(fontSize: 11,color: Colors.black54),),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _items(),
      ),
    );
  }
}
class topTeacher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Container(
            height: 40,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 15,),
                Text('Top 星级教师'),
                Expanded(child: Container()),
                Text('全部',style: TextStyle(color: Colors.blueAccent),),
                SizedBox(width: 15,),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (content)=>teacherDetailPage()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.only(top: 8,left: 8,right: 8,bottom: 5),
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [BoxShadow(color: Colors.black54,blurRadius: 5.0)],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Hero(tag: 'hashiqi',
                          transitionOnUserGestures: true,
                          child: ClipRRect(child: Image.network('https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=557042106,3557535940&fm=11&gp=0.jpg',
                          width: 110,height: 110,fit: BoxFit.fill,),borderRadius: BorderRadius.circular(8.0),),),

                        SizedBox(width: 10.0,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text('汤子酱',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                  SizedBox(width: 10.0,),
                                  Icon(Icons.star,size: 15,color: Colors.red,),
                                  Icon(Icons.star,size: 15,color: Colors.red,),
                                  Icon(Icons.star,size: 15,color: Colors.red,),
                                  Icon(Icons.star,size: 15,color: Colors.red,),
                                  Icon(Icons.star,size: 15,color: Colors.red,),
                                ],
                              ),
                              SizedBox(height: 8.0,),
                              Text('10年教龄 | 中央戏剧学院歌剧表演本科',style: TextStyle(fontSize: 12,color: Colors.black),),
                              SizedBox(height: 8.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('曾交的学生 | 1982名',style: TextStyle(fontSize: 11,color: Colors.black38),),
                                  Expanded(child: Container(),),
                                  Icon(Icons.whatshot,color: Colors.red,size: 15,),
                                  Text('9999',style: TextStyle(fontSize: 11,color: Colors.black),),
                                  SizedBox(width: 15.0,),
                                ],
                              ),
                              SizedBox(height: 8.0,),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(3.0),
                                    ),
                                    child: Text('钢琴认证',style: TextStyle(color: Colors.white,fontSize: 11),),
                                  ),
                                  SizedBox(width: 8.0,),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(3.0),
                                    ),
                                    child: Text('魔法乐理认证',style: TextStyle(color: Colors.white,fontSize: 11),),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Divider(color: Colors.black12,height: 1.0,),
                    Text('推荐理由：家长也要打造自己的成才体系，用互动式教育影响孩子',maxLines: 1,style: TextStyle(fontSize: 13,color: Colors.black),),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (content)=>teacherDetailPage()));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.only(top: 8,left: 8,right: 8,bottom: 5),
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [BoxShadow(color: Colors.black54,blurRadius: 5.0)],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ClipRRect(child: Image.network('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=4263308502,1464248223&fm=11&gp=0.jpg',
                          width: 110,height: 110,fit: BoxFit.fill,),borderRadius: BorderRadius.circular(8.0),),
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text('汤子酱',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13),),
                                  SizedBox(width: 10.0,),
                                  Icon(Icons.star,size: 15,color: Colors.red,),
                                  Icon(Icons.star,size: 15,color: Colors.red,),
                                  Icon(Icons.star,size: 15,color: Colors.red,),
                                  Icon(Icons.star,size: 15,color: Colors.red,),
                                  Icon(Icons.star,size: 15,color: Colors.red,),
                                ],
                              ),
                              SizedBox(height: 8.0,),
                              Text('10年教龄 | 中央戏剧学院歌剧表演本科',style: TextStyle(fontSize: 12,color: Colors.black),),
                              SizedBox(height: 8.0,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('曾交的学生 | 1982名',style: TextStyle(fontSize: 11,color: Colors.black38),),
                                  Expanded(child: Container(),),
                                  Icon(Icons.whatshot,color: Colors.red,size: 15,),
                                  Text('9999',style: TextStyle(fontSize: 11,color: Colors.black),),
                                  SizedBox(width: 15.0,),
                                ],
                              ),
                              SizedBox(height: 8.0,),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(3.0),
                                    ),
                                    child: Text('钢琴认证',style: TextStyle(color: Colors.white,fontSize: 11),),
                                  ),
                                  SizedBox(width: 8.0,),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(3.0),
                                    ),
                                    child: Text('魔法乐理认证',style: TextStyle(color: Colors.white,fontSize: 11),),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Divider(color: Colors.black12,height: 1.0,),
                    Text('推荐理由：家长也要打造自己的成才体系，用互动式教育影响孩子',maxLines: 1,style: TextStyle(fontSize: 13,color: Colors.black),),
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

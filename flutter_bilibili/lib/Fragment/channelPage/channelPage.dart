import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bilibili/Fragment/channelPage/news_entity.dart';
import 'package:flutter_bilibili/HttpTool/httpTool.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
class channelPage extends StatefulWidget {
  @override
  _channelPageState createState() => _channelPageState();
}

class _channelPageState extends State<channelPage> {
  NewsEntity _newsModel;
  int _p = 0;
  RefreshController _refreshController;
  getHttp() {
    FormData formData = FormData.from({'cid': 60});
    HttpTool.getInstance().get(
      'http://www.wanandroid.com/article/list/${_p}/json',
          (data) {
        print(data);
        setState(() {
          _newsModel = NewsEntity.fromJson(data);
        });
        _refreshController.refreshCompleted(resetFooterState: true);
      },
      params: formData,
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshController = RefreshController(initialRefresh:true);
    getHttp();
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
      appBar: AppBar(title: Text('频道'),),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),//defaultTargetPlatform == TargetPlatform.iOS?WaterDropHeader():WaterDropMaterialHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
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
        ),
      ),
    );
  }
}
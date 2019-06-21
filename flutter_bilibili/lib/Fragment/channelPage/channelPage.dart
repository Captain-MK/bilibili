import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bilibili/Fragment/channelPage/news_entity.dart';
import 'package:flutter_bilibili/HttpTool/httpTool.dart';

class channelPage extends StatefulWidget {
  @override
  _channelPageState createState() => _channelPageState();
}

class _channelPageState extends State<channelPage> {
  NewsEntity _newsModel;
  var getUrl = 'http://www.wanandroid.com/article/list/0/json';
  getHttp() {
    FormData formData = FormData.from({'cid': 60});
    HttpTool.getInstance().get(
      getUrl,
          (data) {
        print(data);
        setState(() {
          _newsModel = NewsEntity.fromJson(data);
        });
      },
      params: formData,
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHttp();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('频道'),),
      body: ListView.builder(
        itemCount: _newsModel.datas.length,
          itemBuilder:(c,i){
            NewsData model = _newsModel.datas[i];
            return Container(
              height: 80.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 10.0,),
                  Image.asset('images/user.png',width: 30,height: 30,),
                  SizedBox(width: 10.0,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(model.author,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                      Text(model.title,softWrap: true,maxLines: 100,)
                    ],
                  ),
                  SizedBox(width: 10.0,),
                ],
              ),
            );
          }
      ),
    );
  }
}
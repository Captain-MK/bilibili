import 'package:flutter/material.dart';
import 'package:flutter_bilibili/Fragment/dynamic/model/dynamic_model_entity.dart';
import 'package:flutter_bilibili/Fragment/dynamic/widget/grid_nav.dart';
import 'package:flutter_bilibili/Fragment/dynamic/widget/web_view.dart';
import 'package:flutter_bilibili/HttpTool/httpTool.dart';
import 'package:flutter_bilibili/entity_factory.dart';

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
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('动态'),),
      body: _dynamicModelEntity !=null?ListView(
        children: <Widget>[
          LocalNav(localNavList: _dynamicModelEntity.localNavList,callback: (model){
            print(model.url);
//            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WebView(model:model,)));
            Navigator.push(context,
            MaterialPageRoute(builder: (content)=>WebView(model: model,))
            );
          },),
        ],
      ):Container(child: Center(child: CircularProgressIndicator(),),),
    );
  }
}

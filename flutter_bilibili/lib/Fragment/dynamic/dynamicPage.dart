import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_bilibili/Fragment/dynamic/model/dynamic_model_entity.dart';
import 'package:flutter_bilibili/Fragment/dynamic/widget/local_nav.dart';
import 'package:flutter_bilibili/Fragment/dynamic/widget/middle_card.dart';
import 'package:flutter_bilibili/Fragment/dynamic/widget/sales_box.dart';
import 'package:flutter_bilibili/Fragment/dynamic/widget/sub_nav.dart';
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
        ],
      ),removeTop: true,):Container(child: Center(child: CircularProgressIndicator(),),),
    );
  }
}

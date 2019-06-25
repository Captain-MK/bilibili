import 'package:flutter/material.dart';
import 'package:flutter_bilibili/Fragment/dynamic/model/dynamic_model_entity.dart';
import 'package:flutter_bilibili/Fragment/dynamic/widget/web_view.dart';
//网格卡片
class MiddleCard extends StatelessWidget {
  final DynamicModelGridnav gridNavModel;

  const MiddleCard({Key key, this.gridNavModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 7.0,right: 7.0,bottom: 5.0),
      child: PhysicalModel(//裁切圆角
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: _grideNavItems(context),
        ),
      ),
    );
  }
  _grideNavItems(BuildContext context){
    List<Widget> items = [];
    if(gridNavModel == null) return items;
    if (gridNavModel.hotel != null){
      items.add(_grideNavItem(context, gridNavModel.hotel, true));
    }
    if (gridNavModel.flight != null){
      items.add(_grideNavItem(context, gridNavModel.flight, false));
    }
    if (gridNavModel.travel != null){
      items.add(_grideNavItem(context, gridNavModel.travel, false));
    }
    return items;
  }
  _grideNavItem(BuildContext context,DynamicModelGridnavModel gridNavModel,bool first){//是不是第一个
    List<Widget> items = [];
    items.add(_mainItem(context, gridNavModel.mainItem));
    items.add(_doubleItem(context, gridNavModel.item1, gridNavModel.item2));
    items.add(_doubleItem(context, gridNavModel.item3, gridNavModel.item4));
    List<Widget> exandItems=[];
    items.forEach((item){
      exandItems.add(Expanded(child: item,flex: 1,));
    });
    Color startColor = Color(int.parse('0xff'+gridNavModel.startColor));
    Color endColor = Color(int.parse('0xff'+gridNavModel.endColor));
    return Container(
      height: 88.0,
      margin: first?null:EdgeInsets.only(top: 3.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [startColor,endColor]),
      ),
      child: Row(children: exandItems,),
    );
  }
  _mainItem(BuildContext context,DynamicModelGridnavCommentModel mainModel){
    return _wrapGesture(context, Stack(
      alignment: AlignmentDirectional.topCenter,
      children: <Widget>[
        Image.network(mainModel.icon,fit: BoxFit.contain,height: 88.0,width: 121.0,
          alignment: AlignmentDirectional.bottomEnd,),
        Container(margin: EdgeInsets.only(top: 10.0),child:
        Text(mainModel.title,style: TextStyle(color: Colors.white,fontSize: 14),),),
      ],
    ), mainModel);
  }
  _doubleItem(BuildContext context,DynamicModelGridnavCommentModel topModel,DynamicModelGridnavCommentModel bottomModel){
    return Column(
      children: <Widget>[
        Expanded(
          child: _item(context, topModel, true),
        ),
        Expanded(
          child: _item(context, bottomModel, false),
        ),
      ],
    );
  }
  _item (BuildContext context,DynamicModelGridnavCommentModel model,bool first){
    BorderSide borderSide = BorderSide(width: 0.8,color: Colors.white);
    return FractionallySizedBox(
      widthFactor: 1.0,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left:borderSide,
            bottom: first?borderSide:BorderSide.none,
          ),
        ),
        child: _wrapGesture(context, Center(
          child: Text(model.title,textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: Colors.white),),
        ), model),
      ),
    );
  }
  _wrapGesture(BuildContext context,Widget widget,DynamicModelGridnavCommentModel model){
      return GestureDetector(
        child: widget,
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>WebView(url: model.url,
              title: model.title,
              statusBarColor: model.statusBarColor,
          )));
        },
      );
  }
}
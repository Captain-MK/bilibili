import 'package:flutter/material.dart';
import 'package:flutter_bilibili/Fragment/dynamic/model/dynamic_model_entity.dart';
typedef clickBtn = void Function(DynamicModelLocalnavlist model);
class LocalNav extends StatelessWidget{
  final List<DynamicModelLocalnavlist> localNavList;
  final clickBtn callback;
  const LocalNav({Key key, this.localNavList,this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(7),
          child: _items(context),
        ),
      ),
    );
  }
  _items(BuildContext context){
    if (localNavList == null) return null;
    List<Widget> items = [];
    localNavList.forEach((model){
      items.add(_item(context,model));
    });
    return Row(
      children: items,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }
  Widget _item (BuildContext context,DynamicModelLocalnavlist model){
    return GestureDetector(
      onTap: (){
        if (callback != null){
            callback(model);
        }
      },
      child: Column(
        children: <Widget>[
          Image.network(model.icon,width: 50.0,height: 50.0,),
          SizedBox(height: 10.0,),
          Text(model.title),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bilibili/Fragment/dynamic/model/dynamic_model_entity.dart';
import 'package:flutter_bilibili/Fragment/dynamic/widget/web_view.dart';

class SubNav extends StatelessWidget {
  final List<DynamicModelSubnavlist> subNavList;

  const SubNav({Key key, this.subNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
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

  _items(BuildContext context) {
    if (subNavList == null) return null;
    List<Widget> items = [];
    subNavList.forEach((model) {
      items.add(_item(context, model));
    });
    //计算出第一行显示的行数
    int separate = (subNavList.length / 2 + 0.5).toInt();
    return Column(
      children: <Widget>[
        Row(
          children: items.sublist(0, separate),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Row(
            children: items.sublist(separate, subNavList.length),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        ),
      ],
    );
  }

  Widget _item(BuildContext context, DynamicModelSubnavlist model) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (content)=>WebView(statusBarColor:model.statusBarColor,
              icon: model.icon,
              title: model.title,
              url: model.url,
              hideAppBar: model.hideAppBar,
            ))
        );
        },
        child: Column(
          children: <Widget>[
            Image.network(
              model.icon,
              width: 18.0,
              height: 18.0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 3.0),
              child: Text(
                model.title,
                style: TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}

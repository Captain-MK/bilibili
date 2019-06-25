import 'package:flutter/material.dart';
import 'package:flutter_bilibili/Fragment/dynamic/model/dynamic_model_entity.dart';
import 'package:flutter_bilibili/Fragment/dynamic/widget/web_view.dart';

class SalesBox extends StatelessWidget {
  final DynamicModelSalesbox salesBox;
  const SalesBox({Key key, this.salesBox}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: _items(context),
      ),
    );
  }
  _items(BuildContext context) {
    if (salesBox == null) return null;
    List<Widget> items = [];
    items.add(_item(context, salesBox.bigCard1, true,false));
    items.add(_item(context, salesBox.bigCard2, true,false));
    items.add(_item(context, salesBox.smallCard1, false,false));
    items.add(_item(context, salesBox.smallCard2, false,false));
    items.add(_item(context, salesBox.smallCard3, false,false));
    items.add(_item(context, salesBox.smallCard4, false,true));
    return Column(
      children: <Widget>[
        Container(
          height: 44,
          margin: EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Color(0xfff2f2f2),width: 1.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.network(salesBox.icon,fit: BoxFit.fill,height: 15.0,),
              GestureDetector(child: Text('获取更多福利>   ',style: TextStyle(color: Colors.black54,fontSize: 13),),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (content)=>WebView(
                        icon: salesBox.icon,
                        title: '获取更多福利',
                        url: salesBox.moreUrl,
                      ))
                  );
                },
              ),
            ],
          ),
        ),
        Row(children:items.sublist(0,2),),
        Row(children:items.sublist(2,4),),
        Row(children:items.sublist(4,6),),
      ],
    );
  }
  Widget _item(BuildContext context, DynamicModelSalesboxModel model,bool big,bool last) {
    BorderSide borderSide = BorderSide(width: 1.0,color: Color(0xfff2f2f2));
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (content)=>WebView(
            icon: model.icon,
            title: model.title,
            url: model.url,
          ))
      );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: !last?borderSide:BorderSide.none,
            right: !last?borderSide:BorderSide.none,
          ),
        ),
        child: Image.network(
          model.icon,
          width: (MediaQuery.of(context).size.width-10)/2-1,
          height: big?130.0:65,
        ),
      ),
    );
  }
}

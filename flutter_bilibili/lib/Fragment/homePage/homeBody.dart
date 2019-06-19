import 'package:flutter/material.dart';
import 'package:flutter_bilibili/AppModel.dart';
class homeBody extends StatefulWidget {
  TabController _tabbarController;
  homeBody(@required this._tabbarController):assert(_tabbarController != null);
  @override
  _homeBodyState createState() => _homeBodyState();
}

class _homeBodyState extends State<homeBody>{
  var _index=0;
  void getindex ()async{
    _index = await AppModel().getSaveIndex();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getindex();
  }
  @override
  Widget build(BuildContext context) {
    final model = AppModel.of(context);
    return
      Container(
        height: 49.0,
        child: TabBar(
          controller: widget._tabbarController,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.pink,
          tabs: <Widget>[
            Text('直播', style: TextStyle(color: themeList[model.themeIndex != 0?model.themeIndex:_index])),
            Text('汽车', style: TextStyle(color: themeList[model.themeIndex != 0?model.themeIndex:_index])),
            Text('动态', style: TextStyle(color: themeList[model.themeIndex != 0?model.themeIndex:_index])),
            Text('我爱你', style: TextStyle(color: themeList[model.themeIndex != 0?model.themeIndex:_index])),
            Text('你不在', style: TextStyle(color: themeList[model.themeIndex != 0?model.themeIndex:_index])),
          ],
        ),
      );
  }
}

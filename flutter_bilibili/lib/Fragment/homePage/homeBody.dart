import 'package:flutter/material.dart';
import 'package:flutter_bilibili/AppModel.dart';
class homeBody extends StatefulWidget {
  TabController _tabbarController;
  homeBody(@required this._tabbarController):assert(_tabbarController != null);
  @override
  _homeBodyState createState() => _homeBodyState();
}

class _homeBodyState extends State<homeBody>{
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
            Text('直播', style: TextStyle(color: themeList[model.themeIndex])),
            Text('汽车', style: TextStyle(color: themeList[model.themeIndex])),
            Text('动态', style: TextStyle(color: themeList[model.themeIndex])),
            Text('我爱你', style: TextStyle(color: themeList[model.themeIndex])),
            Text('你不在', style: TextStyle(color: themeList[model.themeIndex])),
          ],
        ),
      );
  }
}

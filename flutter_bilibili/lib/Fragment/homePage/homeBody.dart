import 'package:flutter/material.dart';
class homeBody extends StatefulWidget {
  TabController _tabbarController;
  homeBody(@required this._tabbarController):assert(_tabbarController != null);
  @override
  _homeBodyState createState() => _homeBodyState();
}

class _homeBodyState extends State<homeBody>{
  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 49.0,
        child: TabBar(
          controller: widget._tabbarController,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.pink,
          tabs: <Widget>[
            Text('直播', style: TextStyle(color: Colors.black54)),
            Text('汽车', style: TextStyle(color: Colors.black54)),
            Text('动态', style: TextStyle(color: Colors.black54)),
            Text('我爱你', style: TextStyle(color: Colors.black54)),
            Text('你不在', style: TextStyle(color: Colors.black54)),
          ],
        ),
      );
  }
}

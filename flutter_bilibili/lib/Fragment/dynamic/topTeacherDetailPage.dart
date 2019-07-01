import 'package:flutter/material.dart';
class teacherDetailPage extends StatefulWidget {
  @override
  _teacherDetailPageState createState() => _teacherDetailPageState();
}

class _teacherDetailPageState extends State<teacherDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('音乐小屋'),
//        actions: <Widget>[
//          IconButton(icon: Icon(Icons.menu), onPressed: (){
//            print('菜单');
//          }),
//        ],
//      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Sliver Demo'),
            centerTitle: true,
            expandedHeight: 200,//展开的高度
            forceElevated: true,//强制显示阴影
            // 设置该属性，当有下滑手势的时候，就会显示 AppBar
//        floating: true,
//             该属性只有在 floating 为 true 的情况下使用，不然会报错
//             当上滑到一定的比例，会自动把 AppBar 收缩（不知道是不是 bug，当 AppBar 下面的部件没有被 AppBar 覆盖的时候，不会自动收缩）
            // 当下滑到一定比例，会自动把 AppBar 展开
//        snap: true,
            // 设置该属性使 Appbar 折叠后不消失
//        pinned: true,
            // 通过这个属性设置 AppBar 的背景
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Expanded Title'),
              // 背景折叠动画
              collapseMode: CollapseMode.parallax,
              background: Image.asset('images/bj.png', fit: BoxFit.cover),
            ),
          ),
          SliverPersistentHeader(
            delegate: DemoHeader(),
          ),


          // 这个部件一般用于最后填充用的，会占有一个屏幕的高度，
          // 可以在 child 属性加入需要展示的部件
          SliverFillRemaining(
            child: Center(child: Text('啊啊啊'),),
          ),
          SliverToBoxAdapter(child: Container(color: Colors.black54,height: 200.0,child: Center(child: Text('aaa'),),),),//将非Sliver组件封装成Sliver组件
          SliverFillViewport(//widget是全屏的
              viewportFraction: 1.0,
              delegate: SliverChildBuilderDelegate(
                      (_, index) => Container(
//                          height: 300,//无效果
                          child: Text('Item $index'), alignment: Alignment.center, color: (index%2==0)?Colors.red:Colors.yellow),
                  childCount: 10))
        ],
      ),
    );
  }
}
class DemoHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: Colors.pink,
        alignment: Alignment.center,
        child: Text('我是一个头部部件', style: TextStyle(color: Colors.white, fontSize: 30.0)));
  } // 头部展示内容

  @override
  double get maxExtent => 300.0; // 最大高度

  @override
  double get minExtent => 100.0; // 最小高度

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false; // 因为所有的内容都是固定的，所以不需要更新
}
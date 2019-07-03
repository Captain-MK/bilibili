import 'package:flutter/material.dart';

class teacherDetailPage extends StatefulWidget {
  @override
  _teacherDetailPageState createState() => _teacherDetailPageState();
}

class _teacherDetailPageState extends State<teacherDetailPage> {
  @override
  Widget build(BuildContext context) {
    return demo2();
  }
}

class demo2 extends StatelessWidget {
  final _tabs = <String>['主页', '问答'];
  final colors = <Color>[
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.pink,
    Colors.yellow,
    Colors.deepPurple
  ];

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
      body: DefaultTabController(
          length: _tabs.length,
          child: NestedScrollView(
              headerSliverBuilder: (context, innerScrolled) => <Widget>[
//                SliverToBoxAdapter(
//                  child: Container(
//                    color: Colors.white,
//                    child: Column(
//                      children: <Widget>[
//                        Container(height: 80,color: Colors.amber,),
//                        Container(
//                          height: 45,
//                          child: TabBar(
//                            labelColor: Colors.red,
//                            unselectedLabelColor: Colors.grey,
//                            indicatorColor: Colors.red,
//                            indicatorSize: TabBarIndicatorSize.label,
//                              tabs: _tabs.map((tab) => Text(tab, style: TextStyle(fontSize: 16.0))).toList(),
//                          ),
//                        ),
//                        Divider(height: 2.0,color: Colors.black12,)
//                      ],
//                    ),
//                  ),
//                ), //将非Sliver组件封装成Sliver组件
                SliverOverlapAbsorber(
                  // 传入 handle 值，直接通过 `sliverOverlapAbsorberHandleFor` 获取即可
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  child: SliverAppBar(
                    pinned: true,
                    title: Text('NestedScroll Demo'),
                    expandedHeight: 200.0,// 展开的高度
//                    flexibleSpace:FractionallySizedBox(
//                      widthFactor: 1,
//                      child: Container(
//                        color: Colors.red,
//                        child: Container(
//                          height: 20,
//                          width: 40,
//                          color: Colors.green,
//                        ),
//                      ),
//                    ),
                    flexibleSpace: FlexibleSpaceBar(
                        background: Image.asset('images/bj.png', fit: BoxFit.cover),
//                      title: Container(
//                          height: 45,
//                      padding: EdgeInsets.symmetric(horizontal: 100),
//                          child: TabBar(
//                            labelColor: Colors.red,
//                            unselectedLabelColor: Colors.grey,
//                            indicatorColor: Colors.red,
//                            indicatorSize: TabBarIndicatorSize.label,
//                              tabs: _tabs.map((tab) => Text(tab, style: TextStyle(fontSize: 16.0))).toList(),
//                          ),
//                        ),
                    ),
                    bottom: TabBar(tabs: _tabs.map((tab) => Text(tab, style: TextStyle(fontSize: 18.0))).toList()),
                    forceElevated: innerScrolled,// 是否显示层次感
                  ),
                ),
                  ],
              body: TabBarView(
                  children: _tabs
                      // 这边需要通过 Builder 来创建 TabBarView 的内容，否则会报错
                      // NestedScrollView.sliverOverlapAbsorberHandleFor must be called with a context that contains a NestedScrollView.
                      .map((tab) => Builder(
                            builder: (context) => CustomScrollView(
                                  // key 保证唯一性
                                  key: PageStorageKey<String>(tab),
                                  slivers: <Widget>[
                                    // 将子部件同 `SliverAppBar` 重叠部分顶出来，否则会被遮挡
                                    SliverOverlapInjector(handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
                                    SliverToBoxAdapter(
                                      child: Container(
                                        child: Center(
                                          child: Text(
                                            '哈哈哈',
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SliverGrid(
                                        delegate: SliverChildBuilderDelegate(
                                            (_, index) =>
                                                Image.asset('images/user.png',),
                                            childCount: 8),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 4,
                                                mainAxisSpacing: 10.0,
                                                crossAxisSpacing: 10.0),),
                                    SliverList(
                                        delegate: SliverChildBuilderDelegate((content,i){
                                          return Column(children: <Widget>[
                                            Container(child: Center(child: Text('asdasd${i}',style: TextStyle(fontSize: 20),),),),
                                            Divider(color: Colors.black12,height: 2,)
                                          ],);
                                        },
                                          childCount: 20,
                                        ),
                                    )
//                                    SliverFixedExtentList(
//                                        delegate: SliverChildBuilderDelegate((_, index) => Container(
//                                                child: Container(
//                                                  color: Colors.pink,
//                                                  child: Text(
//                                                      '$tab - item${index + 1}',
//                                                      style: TextStyle(
//                                                          fontSize: 20.0,
//                                                          color:
//                                                              colors[index % 6])),
//                                                ),
//                                                alignment: Alignment.center),
//                                            childCount: 25),
//                                        itemExtent: 50.0,
//                                    ),
                                  ],
                                ),
                          ))
                      .toList()))),
    );
  }
}

class demo1 extends StatelessWidget {
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
            expandedHeight: 200,
            //展开的高度
            forceElevated: true,
            //强制显示阴影
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
            child: Center(
              child: Text('啊啊啊'),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.black54,
              height: 200.0,
              child: Center(
                child: Text('aaa'),
              ),
            ),
          ), //将非Sliver组件封装成Sliver组件
          SliverFillViewport(
            //widget是全屏的
            viewportFraction: 1.0,
            delegate: SliverChildBuilderDelegate(
              (_, index) => Container(
//                          height: 300,//无效果
                    child: Text('Item $index'),
                    alignment: Alignment.center,
                    color: (index % 2 == 0) ? Colors.red : Colors.yellow,
                  ),
              childCount: 10,
            ),
          )
        ],
      ),
    );
  }
}

class DemoHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: Colors.pink,
        alignment: Alignment.center,
        child: Text('我是一个头部部件',
            style: TextStyle(color: Colors.white, fontSize: 30.0)));
  } // 头部展示内容

  @override
  double get maxExtent => 300.0; // 最大高度

  @override
  double get minExtent => 100.0; // 最小高度

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) =>
      false; // 因为所有的内容都是固定的，所以不需要更新
}

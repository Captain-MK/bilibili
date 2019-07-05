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
  final _tabs = <String>['主页10', '课程20','活动30','老师10'];
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
      body: DefaultTabController(
          length: _tabs.length,
          child: NestedScrollView(
              headerSliverBuilder: (context, innerScrolled) => <Widget>[
                SliverOverlapAbsorber(
                  // 传入 handle 值，直接通过 `sliverOverlapAbsorberHandleFor` 获取即可
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  child: SliverAppBar(
                    pinned: true,
                    title: Text('会员机构'),
                    elevation: 0.0,
                    expandedHeight: 255,// 展开的高度
                    flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          color: Colors.white,
                          child: Stack(
                            children: <Widget>[
                              Image.network('http://img0.pcgames.com.cn/pcgames/1306/09/2847015_Lee_Sin_DragonFistSkin_Ch_thumb.jpg', fit: BoxFit.cover,width: MediaQuery.of(context).size.width,height: 120,),
                              Positioned(
                                left: 15,
                                top: 90,
                                child: Row(
                                  children: <Widget>[
                                    ClipRRect(child: FadeInImage.assetNetwork(placeholder: 'images/user.png', image: 'http://b-ssl.duitang.com/uploads/item/201704/30/20170430194407_JtvXr.thumb.224_0.jpeg',width: 60,height: 60,),borderRadius: BorderRadius.circular(30),),
                                    SizedBox(width: 15.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('扬州小鱼儿咨询有限供货商',style: TextStyle(color: Colors.white,fontSize: 14),),
                                        SizedBox(width: 10.0,),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 4.0),
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Text('会员中心机构',style: TextStyle(color: Colors.white,fontSize: 12),),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 150,
                                left: 10,
                                right: 10,
                                bottom: 44.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('介绍：授课模式包括1对1辅导、个性化小组辅导、艺考文化课辅导等。总部坐落于扬州，自2001年创立至今，历经十八年的发展。',maxLines: 3,style: TextStyle(color: Colors.black,fontSize: 15)),
                                    Text('年限 20年  .  学生 2000  .  年龄段 1~3 岁',maxLines: 1,style: TextStyle(color: Colors.red,fontSize: 12),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                    ),
                    bottom: asd(_tabs),
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
                      .toList()),
          ),
      ),
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

class asd extends PreferredSize{
  final List<String> _tabs;
  asd(this._tabs);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Divider(height: 1.0,color: Colors.black12,),
        Container(
          height: 39,
          color: Colors.white,
          child: TabBar(
            tabs: _tabs.map((tab) => Text(tab, style: TextStyle(fontSize: 14.0,color: Colors.black38))).toList(),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.orange,
          ),
        )
      ],
    );
  }
  @override
  Size get preferredSize {
    return Size.fromHeight(40);
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bilibili/Fragment/my_Page.dart';
class homeAppBar extends StatefulWidget implements PreferredSizeWidget{
  @override
  _homeAppBarState createState() => _homeAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _homeAppBarState extends State<homeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: Row(
        children: <Widget>[
          GestureDetector(
            child: Icon(Icons.menu),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>myPage()));
            },
          ),
          SizedBox(width: 10.0,),
          Stack(
            alignment: Alignment(1.3, -1.5),
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  'images/user.png',
                  width: 35.0,
                  height: 35.0,
                ),
              ),
              Container(
                height: 10.0,
                width: 10.0,
                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white,width: 1.0),
                ),
              ),
            ],),

          Container(
            alignment: Alignment(-0.9, 0),
            margin: EdgeInsets.only(left: 20.0),
            width: 160.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Icon(Icons.search),
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.search),
            SizedBox(
              width: 10.0,
            ),
            Stack(
              alignment: Alignment(1.3, -1.5),
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    'images/相机.png',
                    width: 35.0,
                    height: 35.0,
                  ),
                ),
                Container(
                  height: 10.0,
                  width: 10.0,
                  decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(5.0),
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white,width: 1.0),
                  ),
                ),
              ],),
            SizedBox(
              width: 20.0,
            ),
          ],
        ),
      ],
    );
  }
}

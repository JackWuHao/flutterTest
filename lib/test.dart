
import 'package:flutter/material.dart';
/**
 * 在flutter中构建布局

 * flutter的布局机制如何工作
 * 如何垂直和水平布局widget
 *如何构建一个flutter布局
 */
class test extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
       appBar: new AppBar(
         title: new Text("xiaocao"),
       ),
      body: new ListView(
        children: <Widget>[
          new Image.asset( "images/lake.jpg",width: 600,height: 240,fit: BoxFit.cover,),
          TitleSection(),
          Button(),
          TextSection(),

        ],
      ),
    //和上面一直除了不能滑动
//    body: new Column(
//      children: <Widget>[
//          new Image.asset( "images/lake.jpg",width: 600,height: 240,fit: BoxFit.cover,),
//          TitleSection(),
//          Button(),
//          TextSection(),
//      ],
//    ),
    );
  }
}


class TitleSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.all(32.0),
      //整体是一个水平布局
      child: new Row(
        children: <Widget>[

          new  Expanded(child:
              //垂直左对齐
          new Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: new Text("Oeschinen Lake Campground", style: new TextStyle(fontWeight: FontWeight.bold),),

              ),
              new Text("Kandersteg, Switzerland",style: new TextStyle( color: Colors.grey[500],),),
              
            ],
          )
          ),
          new Icon(Icons.star,color: Colors.red,),
          new Text("41"),
        ],
      ),
    );
  }
}

class getText extends StatelessWidget{
  final IconData icon;
  final String text;
  getText({this.icon,this.text});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      //聚集widgets
      mainAxisSize: MainAxisSize.min,
      //居中
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(icon,color: Colors.blue,),
        new Container(
          margin: const EdgeInsets.only(top:8.0),
          child: new Text(text ,style: new TextStyle(color: Colors.blue),),
        ),
      ],
      
    );
  }
}

//下面的button布局
class Button extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Row(
        //MainAxisAlignment.spaceEvenly平均分配子空间  他会在每个子项之间,之前,之后平均分配空闲空间 当然也可以使用Expanded来实现
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            getText(icon: Icons.call,text: "CALL",),
            getText(icon:Icons.near_me,text: "ROUTE",),
            getText(icon: Icons.share,text: "SHARE",),
          ],
      ),
    );
  }
}
//最后的文本布局
class TextSection extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
       padding: const EdgeInsets.all(32.0),
      child: new Text( "Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.",
     softWrap: true,//softWrap: true 文本是否在换行符处中断
   ),
    );
  }
}






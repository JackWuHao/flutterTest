import 'package:flutter/material.dart';
import 'package:apitest/test.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:MyCusScaffold(),
    );
  }
}
/**
* Scaffold 是 Material library 中提供的一个widget,
* 它提供了默认的导航栏、标题和包含主屏幕widget树的body属性。
* widget树可以很复杂
 * StatelessWidget是什么？
 * 前面已经说过Flutter中大多数东西都是widget,StatelessWidget是widget的子类,他代表的是一类无状态的widget，
    还有另一个对应的有状态的statefulWidget

    Widget的两大分类，两者的差距在于你是否需要管理控件的状态
    statelessWidget:无状态的
    statefulWidget”:有状态的(如果用户和widget交互,widget会发生变化,他就是有状态的)
 * **/
class MyScaffold extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Material(
       child: new Scaffold(
         appBar: new AppBar(
           title: Text("hello flutter"),
         ),
         body: new Center(
           child: Text("hello flutter"),
         ),
       ),

     );
  }
}


class TurotialHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        //leading在标题之前显示的组件 IconButton 交互图标
        leading: new IconButton(icon: new Icon(Icons.menu), onPressed: null, tooltip: "导航菜单",),
       title: new Text("京西商城"),
        //在标题之后显示的组件 注意是数组形式 可以有多个widget
        actions: <Widget>[
          new IconButton(
            //icon：在按钮中显示的图标
            icon: new Icon(Icons.shopping_cart),
            //点击该按钮时的回调  类似于Andorid,Ios的onClick 如果设置为null将禁用该按钮(不妨碍tooltip)
            onPressed: openCart ,
            //tooltip:提示信息，当用户长按按钮时将显示此文本
            tooltip: "open shopping cart",
          ),

        ],
      ),
      //body将占屏幕的大部分 Scaffold中的主要内容
      body: new Center(
        child: new Text("hello flutter"),
        //Center会将其子widget置于其中心位置  这是官方对他的说明 A widget that centers its child within itself.
      ),
      //FloatingActionButton 浮动按钮 将悬停在内容以上 note:每个页面最多一个浮动按钮 可以用于共享或导航等案例
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        tooltip: "增加",
        child: new Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );

  }
}


/*
* 打开购物车的点击事件
*
 */

void openCart(){
 print("点击了");
}

//自定义appbar
//和java类似
class MyAppBar extends StatelessWidget{

   final Widget title;
   final num test;
   //构造方法
   //必须传值
  // MyAppBar(this.title);
   //可选传值
   MyAppBar({this.title,this.test});
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
     //布局为盒子布局margin padding ,left ,right ,height,bottom 类似css
     return new Container(
       height: 56.0,  //像素高度
         //EdgeInsets对象使用场景很多,通过他可以很好的控制widget上下左右的偏移量 有.all全部设置 也有.symmetric水平和垂直可选 也有.only上下左右可选
       padding: const EdgeInsets.symmetric(horizontal: 8.0), ///左侧和右侧均有8像素填充
       margin: const EdgeInsets.only(left: 0,right: 0,top:44,bottom:0),
       decoration: new BoxDecoration(color: Colors.blue[500]),
       child: new Row(
         children: <Widget>[
           new IconButton(icon: new Icon(Icons.menu), onPressed: null, tooltip: "导航菜单",),
           new Expanded(child: new Center(child: title,)),
           new IconButton(icon: new Icon(Icons.search), onPressed: openCart,tooltip:"搜索",),

         ],
       ),
     );
    return null;
  }


}

class MyCusScaffold extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Material(
      //Column 垂直方向的线性布局
      child: new Column(
          children: <Widget>[
            new MyAppBar(title: new Text("京西商城", style: Theme.of(context).primaryTextTheme.body1,),
            ),
           new Expanded(child: new Center(child: new Text("hello flutter"),)),
           new Row(
             mainAxisAlignment: MainAxisAlignment.start,
             textDirection:TextDirection.rtl,
             children: <Widget>[
               new Container(

                 margin: const EdgeInsets.only(bottom: 40),

                 child: new FloatingActionButton(
                   onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) =>test()));
                   },
                   tooltip: "添加",
                   child: new Icon(
                       Icons.add),
                   backgroundColor: Colors.pink,

                 ),
               ),

             ],
           ),

          ],
      ),
    );
  }
}










class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

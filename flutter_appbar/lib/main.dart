import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Appbar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  void _showMessage(String msg) {
    Toast.show(msg, context);
  }

  createItem(IconData icon, String text, String id) {
    return PopupMenuItem(
      value: id, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon),
            Text(text)
    ],));
  }

  createTab(String text, IconData icon) {
    return Tab(
      text: text,
      icon: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        leading: IconButton(icon: Icon(Icons.supervised_user_circle), onPressed: () => Toast.show("登录", context)),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.access_alarms), onPressed: () => Toast.show("定时", context)),
          IconButton(icon: Icon(Icons.account_balance_wallet), onPressed: () => Toast.show("钱包", context)),
          IconButton(icon: Icon(Icons.account_box), onPressed: () => Toast.show("通讯录", context)),
          PopupMenuButton<String>(itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
            createItem(Icons.message, '发起群聊', 'A'),
            createItem(Icons.group_add, '添加服务', 'B'),
            createItem(Icons.cast_connected, '扫一扫码', 'C')
          ],
          onSelected: (String id) {
            switch (id) {
              case 'A':
                _showMessage(id);
              break;
            }
          },)
        ],
        bottom: TabBar(
          controller: TabController(length: null, vsync: null),
          isScrollable: true,
          tabs: <Widget>[
            createTab("全部", Icons.all_inclusive),
            createTab("第一", Icons.looks_one),
            createTab("第二", Icons.looks_two),
            createTab("第三", Icons.looks_3),
            createTab("第四", Icons.looks_4)
          ]
        ),
      ),
      body: Center(

        child: Column(

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
      ),
    );
  }
}

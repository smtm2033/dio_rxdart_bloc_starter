import 'package:dio_rxdart_bloc/bloc/user_bloc.dart';
import 'package:dio_rxdart_bloc/layout_cheat_sheet.dart';
import 'package:dio_rxdart_bloc/scoped_model_demo/scoped_model_demo_widget.dart';

import 'scoped_model_demo/scoped_model_counter.dart';
import 'user_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: TextTheme(
            title: TextStyle(fontSize: 30, color: Colors.red),
            subtitle: TextStyle(fontSize: 20, color: Colors.red),
            body1: TextStyle(fontSize: 15, color: Colors.red)),
      ),
      // 为了调试ScopedModel而注释掉MyHomePage
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      // 测试ScopedModel用
      // home: ScopedModelDemoWidget(model: MyModel()),
      // 测试flutter布局的widget用
      home: LayoutCheatSheet(),
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
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: UserWidget(),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.7],
            colors: [
              Color(0xFFF12711),
              Color(0xFFf5af19),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text("R"),
        onPressed: () {
          bloc.getUser();
        },
      ),
    );
  }
}

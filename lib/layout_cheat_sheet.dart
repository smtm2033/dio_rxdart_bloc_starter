import 'package:flutter/material.dart';

// 这是一个测试widget，用来测试Material中提供布局控制的widget的情况

class LayoutCheatSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IntrinsicWidth')),

      // 实现 button等widget的同高 同宽
      // body: Center(
      //   child: IntrinsicWidth(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: <Widget>[
      //         RaisedButton(
      //           onPressed: () {},
      //           child: Text('Short'),
      //         ),
      //         RaisedButton(
      //           onPressed: () {},
      //           child: Text('A bit Longer'),
      //         ),
      //         RaisedButton(
      //           onPressed: () {},
      //           child: Text('The Longest text button'),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      // 指定widget出现在特定位置
      // body: LayoutBuilder(
      //   builder: (context, constraints) => Stack(
      //     fit: StackFit.expand,
      //     children: <Widget>[
      //       Material(color: Colors.yellowAccent),
      //       Positioned(
      //         top: 0,
      //         child: Icon(Icons.star, size: 20.0),
      //       ),
      //       Positioned(
      //         top: constraints.maxHeight - 40.0,
      //         left: constraints.maxWidth - 40.0,
      //         child: Icon(Icons.call, size: 20.0),
      //       ),
      //     ],
      //   ),
      // ),

      // expanded with Flex layouts，使用flex控制布局
      // body: Row(
      //   children: <Widget>[
      //     Expanded(
      //       child: Container(
      //         decoration: const BoxDecoration(color: Colors.red),
      //         //child: Text("flex =3"),
      //       ),
      //       flex: 3,
      //     ),
      //     Expanded(
      //       child: Container(
      //         decoration: const BoxDecoration(color: Colors.green),
      //         child: Text("flex =2"),
      //       ),
      //       flex: 2,
      //     ),
      //     Expanded(
      //       child: Container(
      //         decoration: const BoxDecoration(color: Colors.blue),
      //         child: ConstrainedBox(
      //           constraints: BoxConstraints.expand(),
      //           child: Card(child: Text("flex =1")),
      //         ),
      //       ),
      //       flex: 1,
      //     ),
      //   ],
      // ),

      // boxDecoration -  image，使用图片
      // body: Center(
      //   child: Container(
      //     height: 200,
      //     width: 200,
      //     decoration: BoxDecoration(
      //       color: Colors.yellow,
      //       image: DecorationImage(
      //         fit: BoxFit.fitWidth,
      //         image: NetworkImage(
      //           'https://flutter.io/images/catalog-widget-placeholder.png',
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      // boxDecoration - border - 控制边框
      // body: Center(
      //   child: Container(
      //     height: 200,
      //     width: 200,
      //     decoration: BoxDecoration(
      //         boxShadow: const [BoxShadow(blurRadius: 10)],
      //         color: Colors.yellow,
      //         border: Border.all(color: Colors.red, width: 3),
      //         borderRadius: BorderRadius.all(Radius.circular(10))),
      //   ),
      // ),

      // material - material？
      // body: Center(
      //   child: Material(
      //     shape: const BeveledRectangleBorder(
      //       borderRadius: BorderRadius.all(Radius.circular(20)),
      //       side: BorderSide(color: Colors.black, width: 4),
      //     ),
      //     color: Colors.yellow,
      //     child: Container(
      //       height: 200,
      //       width: 200,
      //     ),
      //   ),
      // ),

      // sliver
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(const [
              ListTile(title: Text('First item')),
              ListTile(title: Text('Second item')),
              ListTile(title: Text('Third item')),
              ListTile(title: Text('Fourth item')),
            ]),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: Colors.yellowAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  FlutterLogo(size: 200),
                  Text(
                    'This is some longest text that should be centered'
                    'together with the logo',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

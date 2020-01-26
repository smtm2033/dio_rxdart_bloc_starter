import 'package:flutter/material.dart';

import 'second_route.dart';
import '../model/global_var.dart';

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("first_route: " + globalVar.title);
    print("first_route: " + globalVar.number.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('Global Variable title:' + globalVar.title),
              Text('Global Variable number:' + globalVar.number.toString()),
              // Text('Global  Variable title:' + globalVar.title),
            ],
          ),
          RaisedButton(
            child: Text("Second route"),
            onPressed: () {
              // Navigate to second route when tapped.
              globalVar.number += 1;
              globalVar.title = "new title from first route";
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            },
          ),
        ],
      ),
    );
  }
}

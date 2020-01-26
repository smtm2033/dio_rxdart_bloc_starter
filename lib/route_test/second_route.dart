import 'package:dio_rxdart_bloc/model/global_var.dart';
import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("second_route: " + globalVar.title);
    print("second_route: " + globalVar.number.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
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
            onPressed: () {
              globalVar.number += 1;
              globalVar.title = "new title from second route";
              // Navigate back to first route when tapped.
              Navigator.pop(context);
            },
            child: Text('Go back!'),
          ),
        ],
      ),
    );
  }
}

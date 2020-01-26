import 'package:dio_rxdart_bloc/todo_test/todo_list.dart';
import 'package:flutter/material.dart';

class TodoDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // retrive the paramaters from the arguments shipped with the RouteSetting
    final Todo todo = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text(todo.description),
      ),
    );
  }
}

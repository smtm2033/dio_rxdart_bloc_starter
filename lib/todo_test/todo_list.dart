// represent a todo item
import 'package:dio_rxdart_bloc/todo_test/todo_detail.dart';
import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

final todos = List<Todo>.generate(
    20,
    (i) => Todo(
          'Todo $i',
          'A description of the todo $i',
        ));

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos"),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodoDetail(todo: todos[index]),
                  ));
            },
          );
        },
      ),
    );
  }
}

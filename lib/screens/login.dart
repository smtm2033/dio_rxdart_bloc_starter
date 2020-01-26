import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login', style: Theme.of(context).textTheme.display4),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text('login controls go here'),
              ),
            ),
            Divider(
              height: 4,
              color: Colors.black,
            ),
            RaisedButton(
              onPressed: () {
                print('login');
              },
              child: Text("Login..."),
            ),
          ],
        ),
      ),
    );
  }
}

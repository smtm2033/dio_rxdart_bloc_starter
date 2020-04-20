import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: Theme.of(context).textTheme.display4),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text('Home contents'),
              ),
            ),
            Divider(
              height: 4,
              color: Colors.black,
            ),
            RaisedButton(
              onPressed: () {
                print('Logout...');
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}

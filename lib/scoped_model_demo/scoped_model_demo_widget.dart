import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'scoped_model_counter.dart';

class ScopedModelDemoWidget extends StatelessWidget {
  final MyModel model;

  ScopedModelDemoWidget({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModel<MyModel>(
        model: model,
        child: Column(
          children: <Widget>[
            Text("ScopedModel state management Demo"),
            SizedBox(
              height: 40.0,
            ),
            ScopedModelDescendant<MyModel>(builder: (context, child, model) {
              return RaisedButton(
                onPressed: () => model.increment(),
                //onPressed: () => print(1),
                child: Icon(Icons.access_alarm),
              );
            }),
            SizedBox(
              height: 40.0,
            ),
            ScopedModelDescendant<MyModel>(builder: (context, child, model) {
              return Text('The counter value is: ${model.counter}');
            }),
          ],
        ),
      ),
    );
  }
}

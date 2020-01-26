import 'package:dio_rxdart_bloc/model/cart_model.dart';
import 'package:dio_rxdart_bloc/model/catalog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.display4),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            Divider(
              height: 4,
              color: Colors.black,
            ),
            _CartTotal(),
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.title;
    var cart = Provider.of<CartModel>(context);
    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        title: Text(
          cart.items[index].name,
          style: itemNameStyle,
        ),
        trailing: _AddButton(item: cart.items[index]),

        // FlatButton(
        //   onPressed: () {
        //     cart.remove(cart.items[index]);
        //   },
        //   splashColor: Theme.of(context).primaryColor,
        //   child: Icon(
        //     Icons.delete,
        //     semanticLabel: 'DEL',
        //   ),
        // ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);

    return FlatButton(
      onPressed: () => cart.remove(item),
      splashColor: Theme.of(context).primaryColor,
      child: Icon(
        Icons.delete,
        semanticLabel: 'DEL',
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle = Theme.of(context).textTheme.display4.copyWith(fontSize: 48);
    // var cart = Provider.of<CartModel>(context);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<CartModel>(
              builder: (context, cart, child) =>
                  Text('\$${cart.totalPrice}', style: hugeStyle),
            ),
            // or using this type of method:
            // Text('\$${cart.totalPrice}', style: hugeStyle),
            SizedBox(
              width: 24,
            ),
            FlatButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Buying not supported yet.')));
              },
              color: Colors.white,
              child: Text('BUY'),
            )
          ],
        ),
      ),
    );
  }
}

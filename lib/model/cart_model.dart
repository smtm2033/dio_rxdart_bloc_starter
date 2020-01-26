import 'catalog.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  /// The current catalog, used to construce items from numeric ids.
  final CatalogModel _catalog;

  /// Internal, private state of the cart. Stores the ids of each item.
  final List<int> _itemIds;

  /// Construct a CartModel instance that is backed by a [CatalogModel] and
  /// and an optional previous state of the cart
  ///
  /// If [previous] is not `null`, its items are copied to the newly
  /// constructed instance.
  CartModel(this._catalog, CartModel previous)
      : assert(_catalog != null),
        _itemIds = previous?._itemIds ?? [] {
    // print('CartModel is initialised and itemsIds length is ${_itemIds.length}');
  }

  /// An empty cart with no Catalog.
  CartModel.empty()
      : _catalog = null,
        _itemIds = [];

  /// List of items in the cart.
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  /// The current total price of all items
  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  /// Adds a new [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    _itemIds.add(item.id);

    // This line tells [Model] that it should rebuild the widgets that depend on it.
    notifyListeners();
  }

  /// Remove an [item] from the cart
  void remove(Item item) {
    _itemIds.remove(item.id);
    // tell the [Model] that it should rebuild the widgets that depend on it
    notifyListeners();
  }
}

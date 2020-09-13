
import 'dart:async';

import 'package:DJStateManager/item_provider.dart';
import 'package:flutter/material.dart';

class MainBloc {
  final itemProvider = ItemProvider();

  final itemsController = StreamController<List<Item>>();
  final detailedColorController = StreamController<Color>();
  final detailedItemController = StreamController<Item>();

  Stream get itemsStream => itemsController.stream;
  Stream get detailedColorStream => detailedColorController.stream;
  Stream get detailedItemStream => detailedItemController.stream;

  StreamSink<List<Item>> get itemsSink => itemsController.sink;
  StreamSink<Color> get detailedColorSink => detailedColorController.sink;
  StreamSink<Item> get detailedItemSink => detailedItemController.sink;

  List<Item> _items;
  int _detailedIndex;
  getItems() async {
    _items = await itemProvider.fetchItems();

    itemsSink.add(_items);
  }

  showDetailed(Color color, int index, Item item) {
    detailedColorSink.add(color);
    detailedItemSink.add(item);
    _detailedIndex = index;
  }

  increment() {
    _items[_detailedIndex].count++;
    itemsSink.add(_items);
    detailedItemSink.add(_items[_detailedIndex]);
  }

  void dispose() {
    itemsController.close();
    detailedColorController.close();
    detailedItemController.close();
  }
}

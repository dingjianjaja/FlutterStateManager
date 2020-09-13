import 'package:flutter/material.dart';

class ItemProvider {
  ItemProvider();

  Future<List<Item>> fetchItems() async {
    List<Item> items = [];
    for (int i = 0; i < 10; i++) {
      items.add(Item());
    }
    await Future.delayed(Duration(seconds: 2));
    return items;
  }
}

class Item {
  int count;

  Item({this.count = 0});
}

class ItemCard extends StatefulWidget {
  final Item item;
  final VoidCallback onTap;
  final Color color;

  ItemCard({this.item, this.color, this.onTap});

  @override
  _ItemCardState createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        child: Container(
          color: widget.color,
          child: Center(
            child: Text(
              "${widget.item.count}",
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

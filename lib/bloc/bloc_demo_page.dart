

import 'package:DJStateManager/bloc/main_bloc.dart';
import 'package:DJStateManager/common/color_utils.dart';
import 'package:DJStateManager/item_provider.dart';
import 'package:flutter/material.dart';

class BlocDemoPage extends StatefulWidget {
  @override
  _BlocDemoPageState createState() => _BlocDemoPageState();
}

class _BlocDemoPageState extends State<BlocDemoPage> {
  MainBloc mainBloc;

  @override
  void initState() {
    super.initState();
    mainBloc = MainBloc();
    mainBloc.getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('bloc'),),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 150,
            child: StreamBuilder<List<Item>>(
              stream: mainBloc.itemsStream,
              builder: (context, snapshot) => !snapshot.hasData
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Color randColor = RandomColor.randomColor();
                  return SizedBox(
                    width: 100,
                    child: ItemCard(
                      item: snapshot.data[index],
                      color: randColor,
                      onTap: () => mainBloc.showDetailed(
                          randColor, index, snapshot.data[index]),
                    ),
                  );
                },
              ),
            ),
          ),
          Divider(),
          Center(
            child: StreamBuilder<Item>(
              stream: mainBloc.detailedItemStream,
              builder: (context, snapshotDetailedItem) => StreamBuilder<Color>(
                stream: mainBloc.detailedColorStream,
                builder: (context, snapshotDetailedColor) =>
                !snapshotDetailedItem.hasData
                    ? Container()
                    : SizedBox(
                  width: 200,
                  height: 200,
                  child: ItemCard(
                    item: snapshotDetailedItem.data,
                    color: snapshotDetailedColor.data,
                    onTap: () => mainBloc.increment(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

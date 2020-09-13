import 'dart:ui';

import 'package:DJStateManager/item_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:states_rebuilder/states_rebuilder.dart';


class MainBloc extends StatesRebuilder {
  final itemProvider = ItemProvider();

  List<Item> items;
  Color detailedColor;
  int detailedIndex;
  BuildContext tappedCardTag;

  fetchItems(BuildContext tag) async {
    items = await itemProvider.fetchItems();

    rebuildStates([tag]);
  }

  showDetailed(Color color, int index, BuildContext tag) {
    detailedColor = color;
    detailedIndex = index;
    tappedCardTag = tag;
    rebuildStates(["detailedWidgetState"]);
  }

  increment() {
    items[detailedIndex].count++;

    rebuildStates(["detailedWidgetState", tappedCardTag]);
  }

  updateTappedTag(BuildContext context,int index){
    if(detailedIndex == index){
      tappedCardTag = context;
    }
  }

}
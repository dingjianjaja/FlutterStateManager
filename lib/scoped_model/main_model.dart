

import 'package:DJStateManager/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model {
  /// 提供数据
  final itemProvider = ItemProvider();

  /// ListView中显示的Item对象的列表
  List<Item> items;
  /// 详细容器中显示的卡片的颜色
  Color detailedColor;
  /// 详细容器中显示的卡的索引
  int detailedIndex;

  /// 从itemProvider获取项
  getItems() async {
    items = await itemProvider.fetchItems();

    notifyListeners();
  }

  /// 点击ListView卡片时调用。
  /// 更改了detailColor和DetailedIndex
  /// 并调用notifyListeners（）来重建详细的容器
  showDetailed(Color color, int index) {
    detailedColor = color;
    detailedIndex = index;

    notifyListeners();
  }

  increment() {
    items[detailedIndex].count++;

    notifyListeners();
  }
}
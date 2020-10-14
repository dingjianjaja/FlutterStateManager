import 'package:DJStateManager/common/color_utils.dart';
import 'package:DJStateManager/item_provider.dart';
import 'package:DJStateManager/scoped_model/main_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class MyScopedModel extends StatefulWidget {
  @override
  _MyScopedModelState createState() => _MyScopedModelState();
}

class _MyScopedModelState extends State<MyScopedModel> {
  MainModel mainModel;

  void initState() {
    super.initState();
    mainModel = MainModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scoped Model")),
      body: ScopedModel<MainModel>(
        model: mainModel,
        child: ScopedModelDemoPage(),
      ),
    );
  }
}



class ScopedModelDemoPage extends StatefulWidget {
  @override
  _ScopedModelDemoPageState createState() => _ScopedModelDemoPageState();
}

class _ScopedModelDemoPageState extends State<ScopedModelDemoPage> {

  @override
  void initState() {
    super.initState();
    ScopedModel.of<MainModel>(context).getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 10),
          height: 150,
          child: ScopedModelDescendant<MainModel>(
            rebuildOnChange: true,
            builder: (context, _, mainModel) => mainModel.items == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mainModel.items.length,
                    itemBuilder: (context, index) {
                      print('itemBuilder:$index');
                      Color randColor = RandomColor.randomColor();
                      return SizedBox(
                        width: 100,
                        child: ItemCard(
                          item: mainModel.items[index],
                          color: randColor,
                          onTap: () => ScopedModel.of<MainModel>(context)
                              .showDetailed(randColor, index),
                        ),
                      );
                    },
                  ),
          ),
        ),
        Divider(),
        Center(
          child: ScopedModelDescendant<MainModel>(
            builder: (context, _, mainModel) => mainModel.detailedIndex == null
                ? Container()
                : SizedBox(
                    width: 200,
                    height: 200,
                    child: ItemCard(
                      item: mainModel.items[mainModel.detailedIndex],
                      color: mainModel.detailedColor,
                      onTap: () => mainModel.increment(),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

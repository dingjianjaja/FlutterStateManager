
import 'package:DJStateManager/common/color_utils.dart';
import 'package:DJStateManager/item_provider.dart';
import 'package:DJStateManager/states_rebuilder/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class StateReBuilderDemoPage extends StatefulWidget {
  @override
  _StateReBuilderDemoPageState createState() => _StateReBuilderDemoPageState();
}

class _StateReBuilderDemoPageState extends State<StateReBuilderDemoPage> {
  MainBloc mainBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainBloc = MainBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('statesRebuilder'),),
      body: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 10),
              height: 150,
              child: StateBuilder(
                models: [mainBloc],
                initState: (context, _) => mainBloc.fetchItems(context),
                builder: (_, __) => mainBloc.items == null
                    ? Center(
                  child: CircularProgressIndicator(),
                )
                    : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mainBloc.items.length,
                  itemBuilder: (context, index) {
                    Color randColor = RandomColor.randomColor();
                    return SizedBox(
                      width: 100,
                      child: StateBuilder(
                        initState: (ctx,_){
                          return mainBloc.updateTappedTag(ctx, index);
                        },
                        models: [mainBloc],
                        builder: (context, _) {
                          return ItemCard(
                            item: mainBloc.items[index],
                            color: randColor,
                            onTap: () => mainBloc.showDetailed(
                                randColor, index, context),
                          );
                        },
                      ),
                    );
                  },
                ),
              )),
          Divider(),
          Center(
            child: StateBuilder(
              tag: "detailedWidgetState",
              models: [mainBloc],
              builder: (_, __) => mainBloc.detailedIndex == null
                  ? Container()
                  : SizedBox(
                width: 200,
                height: 200,
                child: ItemCard(
                  item: mainBloc.items[mainBloc.detailedIndex],
                  color: mainBloc.detailedColor,
                  onTap: () => mainBloc.increment(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

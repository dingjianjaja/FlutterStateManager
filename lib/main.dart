import 'package:DJStateManager/bloc/bloc_demo_page.dart';
import 'package:DJStateManager/provider/provider_demo_page.dart';
import 'package:DJStateManager/scoped_model/scoped_model_demo_page.dart';
import 'package:DJStateManager/states_rebuilder/states_rebuilder_page.dart';
import 'package:DJStateManager/states_rebuilder/states_rebuilder_page2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StateManager Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'StateManager'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyScopedModel()));
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.asset('images/scopedModel.png',width: 80,),
                    Text('scopedModel'),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BlocDemoPage()));
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.asset('images/bloc.png',width: 80,),
                    Text('bloc'),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StateReBuilderDemoPage()));
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.asset('images/statesRebuilder.png',width: 80,),
                    Text('statesRebuilder1'),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StateReBuilderDemoPage2()));
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    Image.asset('images/statesRebuilder.png',width: 80,),
                    Text('statesRebuilder2'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

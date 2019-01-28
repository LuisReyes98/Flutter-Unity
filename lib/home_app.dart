import 'package:flutter/material.dart';
import 'package:flutter_unity_game/page_game.dart';
import 'package:flutter_unity_game/page_home.dart';

class HomeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeApp();
  }
  
}

class _HomeApp extends State<HomeApp> {
  int currentPage = 0;

  final List<Widget> pageList = [
    PageHome(),
    PageGame(),
  ];

  _travelTo(int index){
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Unity con Flutter "),
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the Drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                
                child: Center(
                  child:Text(
                    'Unity y Flutter',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  )
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: (){
                  _travelTo(0);
                  Navigator.pop(context);

                },
              ),
              ListTile(
                title: Text('Game'),
                onTap:(){
                  _travelTo(1);
                  Navigator.pop(context);

                } ,
              ),
              ListTile(
                title: Text('Cerrar'),
                onTap: () {
                  Navigator.pop(context);
                  // Update the state of the app
                  // ...
                },
              ),
            ],

          ),
        ),
        body: pageList[currentPage],
      );
  }

}
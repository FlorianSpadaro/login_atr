import 'package:flutter/material.dart';
import 'package:test_login/utils/singleton.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:test_login/utils/poi_singleton.dart';

class HomeScreen extends StatefulWidget{
  @override
  HomeScreenState createState(){
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen>{
  Singleton singleton = new Singleton();

  @override
  Widget build(BuildContext context){
    return new DefaultTabController(
        length: 3,
        child: new Scaffold(
          appBar: new AppBar(
            bottom: new TabBar(
              tabs: [
                new Tab(icon: new Icon(Icons.folder)),
                new Tab(icon: new Icon(Icons.assignment_late)),
                new Tab(icon: new Icon(Icons.calendar_today)),
              ],
            ),
            title: new Text('Tabs Demo'),
          ),
          body: new TabBarView(
            children: [
              new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  while(index < singleton.listPoi.length){
                    return new Card(
                      child: new Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new ListTile(
                            onTap: () {
                              PoiSingleton poiSingleton = new PoiSingleton();
                              poiSingleton.poi = singleton.listPoi[index];
                              Navigator.of(context).pushNamed("/detailsPoi");
                            },
                            leading: const Icon(Icons.fiber_new,
                            color: Colors.green,),
                            title: new Text(singleton.listPoi[index].ftNumeroOeie),
                            trailing: new Text(singleton.listPoi[index].domaine),
                            subtitle: new Text(singleton.listPoi[index].address),
                          ),
                          new ButtonTheme.bar( // make buttons use the appropriate styles for cards
                            child: new ButtonBar(
                              children: <Widget>[
                                new FlatButton(
                                  child: const Text('INFO'),
                                  onPressed: () { /* ... */ },
                                ),
                                new FlatButton(
                                  child: const Text('ALLER'),
                                  onPressed: (){
                                    _launchURL(singleton.listPoi[index].address);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  
                },
              ),
              new Icon(Icons.directions_transit),
              new Icon(Icons.directions_bike),
            ],
          ),
        ),
      );
  }
}

_launchURL(String adresse) async {
  String url = 'https://www.waze.com/ul?q={$adresse}&navigate=yes';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
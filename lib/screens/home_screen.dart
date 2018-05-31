import 'package:flutter/material.dart';
import 'package:test_login/utils/singleton.dart';

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
    return new MaterialApp(
      home: new DefaultTabController(
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
                            onTap: () {},
                            leading: const Icon(Icons.fiber_new,
                            color: Colors.green,),
                            title: new Text(singleton.listPoi[index].ftNumeroOeie),
                            trailing: new Text(singleton.listPoi[index].domaine),
                            subtitle: new Text(singleton.listPoi[index].id.toString()),
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
                                  onPressed: (){},
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
      ),
    );
  }
}

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Singleton _singleton = new Singleton();

//     return new Scaffold(
//       appBar: new AppBar(title: new Text("Home"),),
//       body: new Center(
//         child: new Text("Welcome " + _singleton.user.nom + " " + _singleton.user.prenom),
//       ),
//     );
//   }

// }




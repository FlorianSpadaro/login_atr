import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';


Future<List> fetchPost(lng,lat) async {
  var url = 'http://192.168.30.218/map_affectation/API/poiProxi.php'; //'192.168.30.218/map_affectation/API/nbPoiCaffByRadius.php', body: {"latitude":45.7186302,"longitude":4.39605786,"km":30}
    final reponse = await http.post(url, body: {"latitude":"$lat","longitude":"$lng","km":"10"});
    final reponseJson = json.decode(reponse.body);
    return reponseJson;
}

class PoiProxi extends StatefulWidget{
  @override
  PoiProxiState createState(){
    return new PoiProxiState();
  }
}

class PoiProxiState extends State<PoiProxi>{
  Future<Null> _neverSatisfied(oeie,comment) async {
    print(comment);
  return showDialog<Null>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return new AlertDialog(

        title: new Text(oeie),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              comment != "" ? new Text(comment):new Text("Pas de ComLab"),
            ],
          ),
        ),
      );
    },
  );
}

  initPlatformState() async {
    var currentLocation = <String, double>{};

    var location = new Location();

    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      currentLocation = await location.getLocation;
    } on PlatformException {
      currentLocation = null;
    }
    if(currentLocation != null){
        return fetchPost(currentLocation['latitude'],currentLocation['longitude']);
    }
    // return currentLocation;
    
  }

  @override
  Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Poi à moins de 10km"),
        ),
        body: new ListView(
          children: <Widget>[
          new FutureBuilder(
              future: initPlatformState(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                List<Widget> textlist = [];
                for (var item in snapshot.data) {
                  textlist.add(new Card(
                   child: new ListTile(
                     leading: new Text(item['algo'] + "km"),
                     title: new Text(item['oeie']),
                      subtitle: new Text(item['ft_libelle_commune']),
                      dense: true,
                      trailing: new Text(item['domaine']),
                      onTap:(){_neverSatisfied(item['oeie'],item['ft_commentaire_creation_oeie']);},
                   ),
                 ));
                
                }
                return new Column(
                  children:textlist,
                );
                } else if (snapshot.hasError) {
                  return new Center(
                    child: new Column(
                      children: <Widget>[
                        new Icon(Icons.location_off,size: 100.0,color: Colors.grey[300],),
                        new Text("Pas de position GPS, Activez la position")
                      ],
                    )
                  );
                }
                // By default, show a loading spinner
                return new Column(
                  children: <Widget>[new RefreshProgressIndicator()],
                );
              },
            ),
          ],
        ),
      );
  }
}

import 'package:flutter/material.dart';
import 'package:test_login/utils/poi_singleton.dart';

class DetailsPoiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PoiSingleton poiSingleton = new PoiSingleton();
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text(poiSingleton.poi.ftNumeroOeie),),
      body: new Column(
        children: <Widget>[
          new Image.asset('assets/images/atr.png',
          fit: BoxFit.cover,
          ),
          new Padding(
            padding: new EdgeInsets.all(15.0),
            child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Icon(Icons.call,color: Colors.green,size: 30.0,),
              new Icon(Icons.map,color: Colors.green,size: 30.0,),
              new Icon(Icons.message,color: Colors.green,size: 30.0,),
            ],
          ),
          ),
          
          new ListTile(
            trailing: new Icon(Icons.map),
            title: new Text("Adresse"),
            // isThreeLine: true,
            subtitle: new Text(poiSingleton.poi.commune),
          )
        ],
      )
      // new Column(
      //   children: <Widget>[
      //     new Text("Id: " + poiSingleton.poi.id.toString()),
      //     new Text("Ft_Numero_Oeie: " + poiSingleton.poi.ftNumeroOeie),
      //     new Text("Domaine: " + poiSingleton.poi.domaine),
      //     new Text("Commune: " + poiSingleton.poi.commune),
      //     new Text("Voie: " + poiSingleton.poi.voie),
      //     new Text("Numéro de voie: " + poiSingleton.poi.numVoie),
      //     new Text("Adresse: " + poiSingleton.poi.address),
      //   ],
      // ),
    );
  }

}
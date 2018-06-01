import 'package:flutter/material.dart';
import 'package:test_login/utils/poi_singleton.dart';

class DetailsPoiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PoiSingleton poiSingleton = new PoiSingleton();
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("Détails POI"),),
      body: new Column(
        children: <Widget>[
          new Text("Id: " + poiSingleton.poi.id.toString()),
          new Text("Ft_Numero_Oeie: " + poiSingleton.poi.ftNumeroOeie),
          new Text("Domaine: " + poiSingleton.poi.domaine),
          new Text("Commune: " + poiSingleton.poi.commune),
          new Text("Voie: " + poiSingleton.poi.voie),
          new Text("Numéro de voie: " + poiSingleton.poi.numVoie),
          new Text("Adresse: " + poiSingleton.poi.address),
        ],
      ),
    );
  }

}
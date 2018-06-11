import 'package:test_login/utils/poi_singleton.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class DetailsPoiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PoiSingleton poiSingleton = new PoiSingleton();
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text(poiSingleton.poi.ftNumeroOeie),),
      body: 
      new ListView(
        children: <Widget>[
          new Card(
            child: new Column(
              children: <Widget>[
                new FutureBuilder(
                  future: imageUrl(poiSingleton.poi.address),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data;
                    } else if (snapshot.hasError) {
                      return new Image.asset("assets/images/no_data.png");
                    }
                    // By default, show a loading spinner
                    return new Column(
                      children: <Widget>[new RefreshProgressIndicator()],
                    );
                  },
                ),
                new ListTile(
                  title: new Text(poiSingleton.poi.commune),
                  subtitle: new Text(poiSingleton.poi.voie),
                  trailing: new Icon(Icons.drive_eta),
                  
                )
              ],
            ),
          ),
          new Card(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _titleSubject("POI", poiSingleton.poi.ftNumeroOeie)
              ],
            ),
          )
        ],
      )

    );
  }

}

_titleSubject(title,subject){
return new Padding(
                  padding: new EdgeInsets.symmetric(vertical:10.0,horizontal: 15.0),
                  child: new Row(
                  children: <Widget>[
                    new Text("$title :",style: new TextStyle(fontSize: 18.0),),
                    new Text("$subject",style: new TextStyle(fontSize: 18.0),textAlign: TextAlign.center),
                  ],
                ),
                );
}

Future<Image> imageUrl(adress) async {
  print(adress);
  var url = 'http://maps.google.com/maps/api/geocode/json?address=$adress'; //'192.168.30.218/map_affectation/API/nbPoiCaffByRadius.php', body: {"latitude":45.7186302,"longitude":4.39605786,"km":30}
    final reponse = await http.get(url);
    final reponseJson = json.decode(reponse.body);
    var lat = reponseJson['results'][0]['geometry']['location']['lat'];
    var lng = reponseJson['results'][0]['geometry']['location']['lng'];
    var urlMarker = 'https://maps.googleapis.com/maps/api/staticmap?center=$lat%2C$lng&zoom=18&size=600x200&markers=color:green%7Clabel:POI%7C$lat,$lng&key=AIzaSyAmw_61ROpJhvL_aRcLubMO0rlE_TBckLU';
    // print(reponseJson);
    print(lat);
    print(lng);
    return new Image.network(urlMarker);
}
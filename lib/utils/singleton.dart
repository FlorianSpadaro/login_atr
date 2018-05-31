import 'package:test_login/models/user.dart';
import 'package:test_login/models/poi.dart';
import 'package:test_login/data/rest_ds.dart';

class Singleton{
  static final Singleton _singleton = new Singleton.internal();

  User user;
  List<Poi> listPoi;

  factory Singleton(){
    return _singleton;
  }
  Singleton.internal();

  void getListPoi(){
    String caff = user.nom + " " + user.prenom;

    RestDatasource restDatasource = new RestDatasource();
    restDatasource.listPoiUser(caff).then((List<Poi> _listPoi){
      listPoi = _listPoi;
      print("TAILLE: " + listPoi.length.toString());
    });
  } 
}
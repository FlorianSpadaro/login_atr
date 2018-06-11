import 'dart:async';

import 'package:test_login/utils/network_util.dart';
import 'package:test_login/models/user.dart';
import 'package:test_login/models/poi.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();

  //API BDC
  static final baseUrlBdc = "http://192.168.30.218/bdc/API";
  static final loginUrl = baseUrlBdc + "/connexion.php";

  //API Map_affectation
  static final baseUrlMapAffect = "http://192.168.30.218/map_affectation/API";
  static final listePoiUserUrl = baseUrlMapAffect + "/getPoiAffecteByCaff.php";

  Future<User> login(String username, String password){
    return _netUtil.post(loginUrl, body: {
      "login": username,
      "mdp": password
    }).then((dynamic res){
      if(res != null)
      {
        print(res.toString());
        return new User.map(res);
      }
      else{
        return null;
      }
    });
  }

  Future<List<Poi>> listPoiUser(String caff){ //correspond à "NOM Prenom"
    var listPoi = new List<Poi>();

    return _netUtil.post(listePoiUserUrl, body: {
      "caff": caff
    }).then((dynamic res){
      if(res != null)
      {
        res.forEach((poi) => listPoi.add(Poi.map(poi)));
      }
      return listPoi;
    });
  }
}
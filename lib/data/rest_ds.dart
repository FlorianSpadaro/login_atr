import 'dart:async';

import 'package:test_login/utils/network_util.dart';
import 'package:test_login/models/user.dart';

class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final baseUrl = "http://192.168.30.218/bdc/API";
  static final loginUrl = baseUrl + "/connexion.php";

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
}
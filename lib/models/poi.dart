class Poi{
  int _id;
  String _ftNumeroOeie;
  String _domaine;
  Poi(this._id, this._ftNumeroOeie, this._domaine);

  Poi.map(dynamic obj){
    this._id = obj["id"];
    this._ftNumeroOeie = obj["ft_oeie_dre"];
    this._domaine = obj["domaine"];
  }

  int get id => _id;
  String get ftNumeroOeie => _ftNumeroOeie;
  String get domaine => _domaine;

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map["id"] = _id;
    map["ftNumeroOeie"] = _ftNumeroOeie;
    map["domaine"] = _domaine;

    return map;
  }
}
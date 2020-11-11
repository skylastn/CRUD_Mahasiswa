import 'dart:convert';

Provinsi provinsiFromJson(String str) => Provinsi.fromJson(json.decode(str));

String provinsiToJson(Provinsi data) => json.encode(data.toJson());

class Provinsi {
  Provinsi({
    this.listprov,
  });

  List<Listprov> listprov;

  factory Provinsi.fromJson(Map<String, dynamic> json) => Provinsi(
    listprov: List<Listprov>.from(json["listprov"].map((x) => Listprov.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "listprov": List<dynamic>.from(listprov.map((x) => x.toJson())),
  };
}

class Listprov {
  Listprov({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory Listprov.fromJson(Map<String, dynamic> json) => Listprov(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

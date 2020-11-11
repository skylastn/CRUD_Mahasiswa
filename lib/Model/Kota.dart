import 'dart:convert';

Kota kotaFromJson(String str) => Kota.fromJson(json.decode(str));

String kotaToJson(Kota data) => json.encode(data.toJson());

class Kota {
  Kota({
    this.listkota,
  });

  List<Listkota> listkota;

  factory Kota.fromJson(Map<String, dynamic> json) => Kota(
    listkota: List<Listkota>.from(json["listkota"].map((x) => Listkota.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "listkota": List<dynamic>.from(listkota.map((x) => x.toJson())),
  };
}

class Listkota {
  Listkota({
    this.id,
    this.provinceId,
    this.name,
  });

  String id;
  String provinceId;
  String name;

  factory Listkota.fromJson(Map<String, dynamic> json) => Listkota(
    id: json["id"],
    provinceId: json["province_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "province_id": provinceId,
    "name": name,
  };
}

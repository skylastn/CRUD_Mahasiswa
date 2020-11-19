import 'dart:convert';

Mahasiswa mahasiswaFromJson(String str) => Mahasiswa.fromJson(json.decode(str));

String mahasiswaToJson(Mahasiswa data) => json.encode(data.toJson());

class Mahasiswa {
  Mahasiswa({
    this.listkaryawan,
  });

  List<Listkaryawan> listkaryawan;

  factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
    listkaryawan: List<Listkaryawan>.from(json["listkaryawan"].map((x) => Listkaryawan.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "listkaryawan": List<dynamic>.from(listkaryawan.map((x) => x.toJson())),
  };
}

class Listkaryawan {
  Listkaryawan({
    this.id,
    this.nik,
    this.nama,
    this.tglLahir,
    this.kota,
    this.gaji,
  });

  String id;
  String nik;
  String nama;
  String tglLahir;
  String kota;
  String gaji;

  factory Listkaryawan.fromJson(Map<String, dynamic> json) => Listkaryawan(
    id: json["id"],
    nik: json["nik"],
    nama: json["nama"],
    tglLahir: json["tgl_lahir"],
    kota: json["kota"],
    gaji: json["gaji"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nik": nik,
    "nama": nama,
    "tgl_lahir": tglLahir,
    "kota": kota,
    "gaji": gaji,
  };
}

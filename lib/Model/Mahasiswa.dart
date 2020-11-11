import 'dart:convert';

Mahasiswa mahasiswaFromJson(String str) => Mahasiswa.fromJson(json.decode(str));

String mahasiswaToJson(Mahasiswa data) => json.encode(data.toJson());

class Mahasiswa {
  Mahasiswa({
    this.listmhs,
  });

  List<Listmh> listmhs;

  factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
    listmhs: List<Listmh>.from(json["listmhs"].map((x) => Listmh.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "listmhs": List<dynamic>.from(listmhs.map((x) => x.toJson())),
  };
}

class Listmh {
  Listmh({
    this.id,
    this.nama,
    this.email,
    this.tempatLahir,
    this.alamat,
    this.asalSekolah,
    this.kota,
    this.provinsi,
    this.tglLahir,
  });

  String id;
  String nama;
  String email;
  String tempatLahir;
  String alamat;
  String asalSekolah;
  String kota;
  String provinsi;
  DateTime tglLahir;

  factory Listmh.fromJson(Map<String, dynamic> json) => Listmh(
    id: json["id"],
    nama: json["nama"],
    email: json["email"],
    tempatLahir: json["tempat_lahir"],
    alamat: json["alamat"],
    asalSekolah: json["asal_sekolah"],
    kota: json["kota"],
    provinsi: json["provinsi"],
    tglLahir: DateTime.parse(json["tgl_lahir"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "email": email,
    "tempat_lahir": tempatLahir,
    "alamat": alamat,
    "asal_sekolah": asalSekolah,
    "kota": kota,
    "provinsi": provinsi,
    "tgl_lahir": "${tglLahir.year.toString().padLeft(4, '0')}-${tglLahir.month.toString().padLeft(2, '0')}-${tglLahir.day.toString().padLeft(2, '0')}",
  };
}

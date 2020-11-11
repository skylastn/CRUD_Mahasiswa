
import 'package:flutter/material.dart';
import 'package:tesmahasiswa/DaftarMahasiswaActivity.dart';

Widget appBarWidget(context) {

  return AppBar(
    elevation: 0.0,
    centerTitle: true,
    title: Text('Testing Mahasiswa'),
    actions: <Widget>[
      IconButton(
        onPressed: () async {

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DaftarMahasiswaActivity()),
          );

        },
        icon: Icon(Icons.assignment_ind),
        color: Color(0xFF323232),
      ),
    ],
  );
}

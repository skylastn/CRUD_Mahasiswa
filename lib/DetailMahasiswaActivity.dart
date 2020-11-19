import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:tesmahasiswa/AppBarWidget.dart';
import 'package:tesmahasiswa/DrawerWidget.dart';
import 'package:tesmahasiswa/Model/Mahasiswa.dart';
import 'package:tesmahasiswa/Network/ApiClient.dart';

class DetailMahasiswaActivity extends StatefulWidget {
  List<Listkaryawan> produk;
  int index;

  DetailMahasiswaActivity(
      {Key key,
        @required this.index,
        @required this.produk})
      : super(key: key);

  @override
  _DetailMahasiswaActivity createState() => _DetailMahasiswaActivity();
}

//https://api.evaly.com.bd/core/public/products/leather-backpack-for-women-6dba2a50d/
//https://api.evaly.com.bd/core/public/products/special-women-kids-cotton-panjabi-kameez-by-swapons-world-combo-pack-c8648f9f9/

class _DetailMahasiswaActivity extends State<DetailMahasiswaActivity> {


  double height, width;
  ApiClient apiClient = new ApiClient();
  TextEditingController jumlah = new TextEditingController();
  String nama, email, tempat, alamat, asal, tgllahir, provinsi, kota;

//  void initData() async{
//    for(int index=0; index<= widget.produk.length-1; index++){
//      if
//    }
//
//
//  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    initData();

  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    var pisahtgl = widget.produk[widget.index].tglLahir.toString().split(" ");
    tgllahir = pisahtgl[0];
    return Scaffold(
      backgroundColor: Color(0xFFfafafa),
      appBar: appBarWidget(context),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            /*Image.network(
              widget.productDetails.data.productVariants[0].productImages[0]),*/
//          Image.network(widget.produk[widget.index].images[0].largeImageUrl,
//            fit: BoxFit.fill,
//            loadingBuilder: (BuildContext context, Widget child,
//                ImageChunkEvent loadingProgress) {
//              if (loadingProgress == null) return child;
//              return Center(
//                child: CircularProgressIndicator(
//                  value: loadingProgress.expectedTotalBytes != null ?
//                  loadingProgress.cumulativeBytesLoaded /
//                      loadingProgress.expectedTotalBytes
//                      : null,
//                ),
//              );
//            },
//          ),
            Container(
              margin: EdgeInsets.only(top: 20),
            ),

            new Text("Nama", style: new TextStyle(fontSize: 15.0),
              textAlign: TextAlign.left,
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0,10,0,10),
              width: double.infinity,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.black)),
                color: Colors.white,
                textColor: Colors.black,
                padding: EdgeInsets.all(12.0),
                onPressed: () {


                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      child: widget.produk[widget.index].nama==null
                          ?Text(
                          "",
                          style: new TextStyle(fontSize: 18.0,
                            fontWeight: FontWeight.bold,)
                      )
                          :Text(
                          widget.produk[widget.index].nama,
                          style: new TextStyle(fontSize: 18.0,
                            fontWeight: FontWeight.bold,)
                      )
                  ),
                ),
              ),
            ),

            new Text("Email", style: new TextStyle(fontSize: 15.0),
              textAlign: TextAlign.left,
            ),
//            Container(
//              margin: const EdgeInsets.fromLTRB(0,10,0,10),
//              width: double.infinity,
//              child: FlatButton(
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(18.0),
//                    side: BorderSide(color: Colors.black)),
//                color: Colors.white,
//                textColor: Colors.black,
//                padding: EdgeInsets.all(12.0),
//                onPressed: () {
//
//
//                },
//                child: Align(
//                  alignment: Alignment.centerLeft,
//                  child: Container(
//                      child: widget.produk[widget.index].email==null
//                          ?Text(
//                          "",
//                          style: new TextStyle(fontSize: 18.0,
//                            fontWeight: FontWeight.bold,)
//                      )
//                          :Text(
//                          widget.produk[widget.index].email,
//                          style: new TextStyle(fontSize: 18.0,
//                            fontWeight: FontWeight.bold,)
//                      )
//                  ),
//                ),
//              ),
//            ),
//
//            new Text("Tempat Lahir", style: new TextStyle(fontSize: 15.0),
//              textAlign: TextAlign.left,
//            ),
//            Container(
//              margin: const EdgeInsets.fromLTRB(0,10,0,10),
//              width: double.infinity,
//              child: FlatButton(
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(18.0),
//                    side: BorderSide(color: Colors.black)),
//                color: Colors.white,
//                textColor: Colors.black,
//                padding: EdgeInsets.all(12.0),
//                onPressed: () {
//
//
//                },
//                child: Align(
//                  alignment: Alignment.centerLeft,
//                  child: Container(
//                      child: widget.produk[widget.index].tempatLahir==null
//                          ?Text(
//                          "",
//                          style: new TextStyle(fontSize: 18.0,
//                            fontWeight: FontWeight.bold,)
//                      )
//                          :Text(
//                          widget.produk[widget.index].tempatLahir,
//                          style: new TextStyle(fontSize: 18.0,
//                            fontWeight: FontWeight.bold,)
//                      )
//                  ),
//                ),
//              ),
//            ),
//
//            new Text("Alamat", style: new TextStyle(fontSize: 15.0),
//              textAlign: TextAlign.left,
//            ),
//            Container(
//              margin: const EdgeInsets.fromLTRB(0,10,0,10),
//              width: double.infinity,
//              child: FlatButton(
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(18.0),
//                    side: BorderSide(color: Colors.black)),
//                color: Colors.white,
//                textColor: Colors.black,
//                padding: EdgeInsets.all(12.0),
//                onPressed: () {
//
//
//                },
//                child: Align(
//                  alignment: Alignment.centerLeft,
//                  child: Container(
//                      child: widget.produk[widget.index].alamat==null
//                          ?Text(
//                          "",
//                          style: new TextStyle(fontSize: 18.0,
//                            fontWeight: FontWeight.bold,)
//                      )
//                          :Text(
//                          widget.produk[widget.index].alamat,
//                          style: new TextStyle(fontSize: 18.0,
//                            fontWeight: FontWeight.bold,)
//                      )
//                  ),
//                ),
//              ),
//            ),
//
//            new Text("Asal Sekolah", style: new TextStyle(fontSize: 15.0),
//              textAlign: TextAlign.left,
//            ),
//            Container(
//              margin: const EdgeInsets.fromLTRB(0,10,0,10),
//              width: double.infinity,
//              child: FlatButton(
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(18.0),
//                    side: BorderSide(color: Colors.black)),
//                color: Colors.white,
//                textColor: Colors.black,
//                padding: EdgeInsets.all(12.0),
//                onPressed: () {
//
//
//                },
//                child: Align(
//                  alignment: Alignment.centerLeft,
//                  child: Container(
//                      child: widget.produk[widget.index].asalSekolah==null
//                          ?Text(
//                          "",
//                          style: new TextStyle(fontSize: 18.0,
//                            fontWeight: FontWeight.bold,)
//                      )
//                          :Text(
//                          widget.produk[widget.index].asalSekolah,
//                          style: new TextStyle(fontSize: 18.0,
//                            fontWeight: FontWeight.bold,)
//                      )
//                  ),
//                ),
//              ),
//            ),
//
//            new Text("Kota", style: new TextStyle(fontSize: 15.0),
//              textAlign: TextAlign.left,
//            ),
//            Container(
//              margin: const EdgeInsets.fromLTRB(0,10,0,10),
//              width: double.infinity,
//              child: FlatButton(
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(18.0),
//                    side: BorderSide(color: Colors.black)),
//                color: Colors.white,
//                textColor: Colors.black,
//                padding: EdgeInsets.all(12.0),
//                onPressed: () {
//
//
//                },
//                child: Align(
//                  alignment: Alignment.centerLeft,
//                  child: Container(
//                      child: widget.produk[widget.index].kota==null
//                          ?Text(
//                          "",
//                          style: new TextStyle(fontSize: 18.0,
//                            fontWeight: FontWeight.bold,)
//                      )
//                          :Text(
//                          widget.produk[widget.index].kota,
//                          style: new TextStyle(fontSize: 18.0,
//                            fontWeight: FontWeight.bold,)
//                      )
//                  ),
//                ),
//              ),
//            ),
//
//            new Text("Provinsi", style: new TextStyle(fontSize: 15.0),
//              textAlign: TextAlign.left,
//            ),
//            Container(
//              margin: const EdgeInsets.fromLTRB(0,10,0,10),
//              width: double.infinity,
//              child: FlatButton(
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(18.0),
//                    side: BorderSide(color: Colors.black)),
//                color: Colors.white,
//                textColor: Colors.black,
//                padding: EdgeInsets.all(12.0),
//                onPressed: () {
//
//
//                },
//                child: Align(
//                  alignment: Alignment.centerLeft,
//                  child: Container(
//                      child: widget.produk[widget.index].provinsi==null
//                          ?Text(
//                          "",
//                          style: new TextStyle(fontSize: 18.0,
//                            fontWeight: FontWeight.bold,)
//                      )
//                          :Text(
//                          widget.produk[widget.index].provinsi,
//                          style: new TextStyle(fontSize: 18.0,
//                            fontWeight: FontWeight.bold,)
//                      )
//                  ),
//                ),
//              ),
//            ),
//
//            new Text("Tanggal Lahir", style: new TextStyle(fontSize: 15.0),
//              textAlign: TextAlign.left,
//            ),
//            Container(
//              margin: const EdgeInsets.fromLTRB(0,10,0,10),
//              width: double.infinity,
//              child: FlatButton(
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(18.0),
//                    side: BorderSide(color: Colors.black)),
//                color: Colors.white,
//                textColor: Colors.black,
//                padding: EdgeInsets.all(12.0),
//                onPressed: () {
////                                    Navigator.push(
////                                      context,
////                                      MaterialPageRoute(builder: (context) => RegisterMember()),
////                                    );
//
//                },
//                child: Align(
//                  alignment: Alignment.centerLeft,
//                  child: Container(
//                    child: Text(
//                        tgllahir,
//                        style: new TextStyle(fontSize: 18.0,
//                          fontWeight: FontWeight.bold,)
//                    ),
//                  ),
//                ),
//              ),
//            ),

          ],
        ),

      ),
    );
  }


}

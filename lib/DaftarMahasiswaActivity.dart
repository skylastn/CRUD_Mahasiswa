import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nice_button/NiceButton.dart';
import 'package:tesmahasiswa/CustomShape.dart';
import 'package:tesmahasiswa/Model/Kota.dart';
import 'package:tesmahasiswa/Model/Provinsi.dart';
import 'package:tesmahasiswa/Network/ApiClient.dart';
import 'package:tesmahasiswa/ResponsiveWidget.dart';
import 'package:tesmahasiswa/ViewModel/KotaViewModels.dart';
import 'package:tesmahasiswa/ViewModel/ProvinsiViewModels.dart';
import 'package:tesmahasiswa/customappbar.dart';
import 'package:tesmahasiswa/main.dart';
import 'package:tesmahasiswa/textformfield.dart';
import 'package:http/http.dart' as http;

class DaftarMahasiswaActivity extends StatefulWidget {
  @override
  _DaftarMahasiswaActivity createState() => _DaftarMahasiswaActivity();
}

//List<String> data = ['Page 0', 'Page 1', 'Page 2'];
//int initPosition = 1;

List<Tab> _tabs = List<Tab>();
List<Widget> _generalWidgets = List<Widget>();

TabController _tabController;
TextEditingController searchController = new TextEditingController();

double height, width;

class _DaftarMahasiswaActivity extends State<DaftarMahasiswaActivity>  {
  ApiClient apiClient = new ApiClient();
  List<Listprov> listprov = new List();
  List<Listkota> listKota = new List();
  var firstColor = Color(0xff5b86e5),
      secondColor = Color(0xff36d1dc);
  TextEditingController namacontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController tempatcontroller = new TextEditingController();
  TextEditingController alamatcontroller = new TextEditingController();
  TextEditingController asalcontroller = new TextEditingController();
//  TextEditingController emailcontroller = new TextEditingController();

  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  String prov, city, provfix="", cityfix="", tgl = "Tanggal Lahir";
  String _myActivityResult;
  EdgeInsets contentPadding = const EdgeInsets.fromLTRB(12, 12, 8, 0);
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProv();
  }

  @override
  Widget build(BuildContext context) {

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88,child: CustomAppBar()),
//                clipShape(),
                form(context),
//                acceptTermsTextRow(),
                SizedBox(height: _height/35,),

                ListProv(),
                ListKota(),

                button(),
                SizedBox(height: _height/35,),

//                infoTextRow(),
//                socialIconsRow(),
                //signInTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        var pisahtgl = picked.toString().split(" ");
        tgl = pisahtgl[0];
      });
  }

  Widget ListProv() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InputDecorator(
            decoration: InputDecoration(
              contentPadding: contentPadding,
              labelText: "Pilih Provinsi",
              filled: true,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<dynamic>(
                isExpanded: true,
                hint: Text(
                  "Pilih Provinsi",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                value: prov,
                onChanged: (dynamic newValue) {
                  var splitprov = newValue.split(":");
                  prov = newValue;
                  provfix = splitprov[1];
                  print(splitprov[0]+":"+splitprov[1]);
                  setState(() {

                  });
                  getCity(splitprov[0]);
                },
                items: listprov.map((item) {
                  return DropdownMenuItem<dynamic>(
                    value: item.id+":"+item.name,
                    child: Text(item.name,
                        overflow: TextOverflow.ellipsis),
                  );
                }).toList(),
              ),
            ),
          ),
//                      SizedBox(height: state.hasError ? 5.0 : 0.0),
//                      Text(
//                        state.hasError ? state.errorText : '',
//                        style: TextStyle(
//                            color: Colors.redAccent.shade700,
//                            fontSize: state.hasError ? 12.0 : 0.0),
//                      ),
        ],
      ),
    );
  }

  Widget ListKota() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InputDecorator(
            decoration: InputDecoration(
              contentPadding: contentPadding,
              labelText: "Pilih Kota",
              filled: true,
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<dynamic>(
                isExpanded: true,
                hint: Text(
                  "Pilih Kota",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                value: city,
                onChanged: (dynamic newValue) {

                  var splitcity = newValue.split(":");
                  city = newValue;
                  cityfix = splitcity[1];
                  print(splitcity[0]+":"+splitcity[1]);
                  setState(() {

                  });
                },
                items: listKota.map((item) {
                  return DropdownMenuItem<dynamic>(
                    value: item.id+":"+item.name,
                    child: Text(item.name,
                        overflow: TextOverflow.ellipsis),
                  );
                }).toList(),
              ),
            ),
          ),
//                      SizedBox(height: state.hasError ? 5.0 : 0.0),
//                      Text(
//                        state.hasError ? state.errorText : '',
//                        style: TextStyle(
//                            color: Colors.redAccent.shade700,
//                            fontSize: state.hasError ? 12.0 : 0.0),
//                      ),
        ],
      ),
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large? _height/8 : (_medium? _height/7 : _height/6.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large? _height/12 : (_medium? _height/11 : _height/10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Container(
          height: _height / 5.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.0,
                  color: Colors.black26,
                  offset: Offset(1.0, 10.0),
                  blurRadius: 20.0),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
              onTap: (){
                print('Adding photo');
              },

              child: Icon(Icons.add_a_photo, size: _large? 40: (_medium? 33: 31),color: Colors.orange[200],)),
        ),
//        Positioned(
//          top: _height/8,
//          left: _width/1.75,
//          child: Container(
//            alignment: Alignment.center,
//            height: _height/23,
//            padding: EdgeInsets.all(5),
//            decoration: BoxDecoration(
//              shape: BoxShape.circle,
//              color:  Colors.orange[100],
//            ),
//            child: GestureDetector(
//                onTap: (){
//                  print('Adding photo');
//                },
//                child: Icon(Icons.add_a_photo, size: _large? 22: (_medium? 15: 13),)),
//          ),
//        ),
      ],
    );
  }

  Widget form(BuildContext context2) {
    return Container(
      margin: EdgeInsets.only(
          left:_width/ 12.0,
          right: _width / 12.0,
          top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            emailTextFormField(),
            SizedBox(height: _height/ 60.0),
            tempatlahirTextFormField(),
            SizedBox(height: _height / 60.0),
            alamatTextFormField(),
            SizedBox(height: _height / 60.0),
            asalsekolahTextFormField(),
            SizedBox(height: _height / 60.0),
//            tglTextFormField(),
            tglFormField(context2),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    return CustomTextField(
      textEditingController: namacontroller,
      enabled: false,
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "Nama Anda",
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      textEditingController: emailcontroller,
      enabled: false,
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email,
      hint: "Email Anda",
    );
  }

  Widget tempatlahirTextFormField() {
    return CustomTextField(
      textEditingController: tempatcontroller,
      enabled: false,
      keyboardType: TextInputType.text,
      icon: Icons.home,
      hint: "Tempat Lahir",
    );
  }

  Widget alamatTextFormField() {
    return CustomTextField(
      textEditingController: alamatcontroller,
      enabled: false,
      keyboardType: TextInputType.datetime,
      icon: Icons.business,
      hint: "Alamat Anda",
    );
  }

  Widget asalsekolahTextFormField() {
    return CustomTextField(
      textEditingController: asalcontroller,
      enabled: false,
      keyboardType: TextInputType.datetime,
      icon: Icons.business,
      hint: "Asal Sekolah",
    );
  }
//  Widget tglTextFormField() {
//    return CustomTextField(
//      enabled: true,
//      keyboardType: TextInputType.datetime,
//      icon: Icons.business,
//      hint: "Asal Sekolah",
//    );
//  }

  Widget tglFormField(BuildContext context2) {
    return NiceButton(
      radius: 40,
      padding: const EdgeInsets.all(15),
      text: tgl,
      icon: Icons.date_range,
      gradientColors: [secondColor, firstColor],
      onPressed: () {
//        tgl = "Coba";
        _selectDate(context2);

//        Fluttertoast.showToast(
//            msg: "Anda Memilih Tes Gambar",
//            toastLength: Toast.LENGTH_SHORT,
//            gravity: ToastGravity.BOTTOM,
//            timeInSecForIosWeb: 1,
//            backgroundColor: Colors.red,
//            textColor: Colors.white,
//            fontSize: 16.0
//        );
//        Navigator.push(
//          context,
//          MaterialPageRoute(builder: (context) => GambarActivity()),
//        );
      },
    );
  }

  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: Colors.orange[200],
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
              }),
          Text(
            "I accept all terms and conditions",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: _large? 12: (_medium? 11: 10)),
          ),
        ],
      ),
    );
  }

  Widget button() {
    return Container(
      margin: EdgeInsets.only(top: 30, ),
      child: RaisedButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        onPressed: () {
//          print("Routing to your account");
          DaftarMember("", namacontroller.text, emailcontroller.text, tempatcontroller.text,
              alamatcontroller.text, asalcontroller.text, cityfix, provfix, tgl);
        },
        textColor: Colors.white,
        padding: EdgeInsets.all(0.0),
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width:_height*0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            gradient: LinearGradient(
              colors: <Color>[Colors.orange[200], Colors.pinkAccent],
            ),
          ),
          padding: const EdgeInsets.all(12.0),
          child: Text('DAFTAR', style: TextStyle(fontSize: 18),),
        ),
      )
      ,
    );
  }

  Widget infoTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Or create using social media",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: _large? 12: (_medium? 11: 10)),
          ),
        ],
      ),
    );
  }

  Widget socialIconsRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 80.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/googlelogo.png"),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/fblogo.jpg"),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/images/twitterlogo.jpg"),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
//              Navigator.of(context).pop();
              print("Routing to Sign up screen");
            },
            child: Text(
              "Daftar",
              style: TextStyle(
                  fontWeight: FontWeight.w800, color: Colors.orange[200], fontSize: 19),
            ),
          )
        ],
      ),
    );
  }

  DaftarMember(String id, nama, email, tempat_lahir, alamat, asal_sekolah, kota, provinsi, tgl_lahir) async {
    print("id:"+id+"||nama:"+nama+"||email:"+email+"||tempat_lahir:"+tempat_lahir+"||alamat:"+alamat+"||asal_sekolah:"+asal_sekolah
        +"||kota:"+kota+"||provinsi:"+provinsi+"||tgl_lahir:"+tgl_lahir);
    print(apiClient.getBaseUrl()+"Mahasiswa/add_mahasiswa");
    http.post(apiClient.getBaseUrl()+"Mahasiswa/add_mahasiswa", headers: {
      'Accept': 'application/json',
//      'authorization': apiConfig.getBasicAuth()
    }, body: {
      "id": id,
      "nama": nama,
      "email": email,
      "tempat_lahir": tempat_lahir,
      "alamat": alamat,
      "asal_sekolah": asal_sekolah,
      "kota": kota,
      "provinsi": provinsi,
      "tgl_lahir": tgl_lahir,

    }).then((response) {
      //check response status, if response status OK
//    print("Response Status : $res");
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data["status"] == true) {
//          print(data['mobiletoken']);

          Fluttertoast.showToast(
              msg: "Berhasil Menambahkan Mahasiswa",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
//              timeInSecForIos: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );

        } else {
          Fluttertoast.showToast(
              msg: "Mohon Maaf Terjadi Kesalahan",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
//              timeInSecForIos: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
          print(data['info']);
        }

      }
    }
    );
  }

  void getProv (){
    ProvinsiViewModels.getProv("").then((value) {

      listprov.addAll(value.listprov);
      setState(() {

      });

    });

  }

  void getCity (String id_prov){
    KotaViewModels.getCity(id_prov).then((value) {

      listKota.addAll(value.listkota);
      setState(() {

      });

    });

  }
}

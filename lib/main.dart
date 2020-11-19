import 'package:flutter/material.dart';
import 'package:nice_button/NiceButton.dart';
import 'package:tesmahasiswa/CustomShape.dart';
import 'package:tesmahasiswa/DaftarMahasiswaActivity.dart';
import 'package:tesmahasiswa/DropDownField.dart';
import 'package:tesmahasiswa/ListMahasiswaActivity.dart';
import 'package:tesmahasiswa/Model/Kota.dart';
import 'package:tesmahasiswa/Model/Provinsi.dart';
import 'package:tesmahasiswa/Network/ApiClient.dart';
import 'package:tesmahasiswa/ResponsiveWidget.dart';
import 'package:tesmahasiswa/ViewModel/KotaViewModels.dart';
import 'package:tesmahasiswa/ViewModel/ProvinsiViewModels.dart';
import 'package:tesmahasiswa/CustomAppBar.dart';
import 'package:tesmahasiswa/textformfield.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var firstColor = Color(0xff5b86e5),
      secondColor = Color(0xff36d1dc);
  TextEditingController nowa = new TextEditingController();
  TextEditingController pesan = new TextEditingController();
  String _activity = '+62';

  @override
  Widget build(BuildContext context) {
    Color hexToColor(String code) {
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Welcome to Flutter",
        home:Builder(
          builder: (context) => Center(
              child: new Container (
                  padding: const EdgeInsets.all(30.0),
                  color: Colors.white,
                  child: new Container(
                    child: new Center(
                        child: new Column(
                            children: [
                              new Padding(padding: EdgeInsets.only(top: 140.0)),
                              new Text('Tes ',
                                style: new TextStyle(color: hexToColor("#F2A03D"),
                                    fontSize: 25.0),),

                              new Padding(padding: EdgeInsets.only(top: 30.0)),

                              NiceButton(
                                radius: 40,
                                padding: const EdgeInsets.all(15),
                                text: "Daftar Karyawan",
//                                icon: Icons.assignment_ind,
                                gradientColors: [secondColor, firstColor],
                                onPressed: () {

//                                  Fluttertoast.showToast(
//                                      msg: "Anda Memilih tes User",
//                                      toastLength: Toast.LENGTH_SHORT,
//                                      gravity: ToastGravity.BOTTOM,
//                                      timeInSecForIosWeb: 1,
//                                      backgroundColor: Colors.red,
//                                      textColor: Colors.white,
//                                      fontSize: 16.0
//                                  );

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DaftarMahasiswaActivity()),
                                  );

                                },
                              ),
                              new Padding(padding: EdgeInsets.only(top: 15.0)),

                              NiceButton(
                                radius: 40,
                                padding: const EdgeInsets.all(15),
                                text: "Dashboard",
                                icon: Icons.dashboard,
                                gradientColors: [secondColor, firstColor],
                                onPressed: () {

//                                  Fluttertoast.showToast(
//                                      msg: "Anda Memilih Tes Gambar",
//                                      toastLength: Toast.LENGTH_SHORT,
//                                      gravity: ToastGravity.BOTTOM,
//                                      timeInSecForIosWeb: 1,
//                                      backgroundColor: Colors.red,
//                                      textColor: Colors.white,
//                                      fontSize: 16.0
//                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ListMahasiswa()),
                                  );
                                },
                              )

                            ]
                        )
                    ),
                  )
              )
          ),
        )
//        new Material(

//        )
    );
  }
}

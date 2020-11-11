import 'package:flutter/material.dart';
import 'package:tesmahasiswa/AppBarWidget.dart';
import 'package:tesmahasiswa/DetailMahasiswaActivity.dart';
import 'package:tesmahasiswa/DrawerWidget.dart';
import 'package:tesmahasiswa/Model/Mahasiswa.dart';
import 'package:tesmahasiswa/ViewModel/MahasiswaViewModels.dart';
class ListMahasiswa extends StatefulWidget {
  @override
  _ListMahasiswa createState() => _ListMahasiswa();
}

//List<String> data = ['Page 0', 'Page 1', 'Page 2'];
//int initPosition = 1;

double height, width;

class _ListMahasiswa extends State<ListMahasiswa>  {
  double height, width;

  List<Listmh> user = new List();
  void initData() async{
//    user = await UserViewModels.getUser();
    MahasiswaViewModels.getMahasiswa("").then((value) {
      user.addAll(value.listmhs);
//      for(int i = 0; i<=5; i++){
//        user.addAll(value);
//      }
      setState(() {

      });

    });


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initData();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: appBarWidget(context),
      drawer: DrawerWidget(),
      body:SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 10),
              height:height,
              child:GridView.count(
                crossAxisCount: 2,
//    physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(1.0),
//                  childAspectRatio: 7.0 / 9.0,
                children: List<Widget>.generate(user.length, (index) {
                  if(user==null||user.length==0){
                    return CircularProgressIndicator();
                  }else{
                    return GridTile(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailMahasiswaActivity(index: index,produk: user,)),
                            );

                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 5),
                            child: Card(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                ),
                                elevation: 0,
                                child: Center(
                                  child: Column(
                                    children: <Widget>[

                                      Image.network("https://i.picsum.photos/id/9/250/250.jpg?hmac=tqDH5wEWHDN76mBIWEPzg1in6egMl49qZeguSaH9_VI",
                                        height: 80,
                                        width: 65,
                                        loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                                          if (loadingProgress == null) return child;
                                          return Center(
                                            child: CircularProgressIndicator(
                                              value: loadingProgress.expectedTotalBytes != null ?
                                              loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes : null,
                                            ),
                                          );
                                        },
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(left: 5, right: 5, top: 10),
                                        child: Text(user[index].nama,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color(0xFF444444),
                                                fontFamily: 'Roboto-Light.ttf',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        )
                    );
                  }

                }),
              )
          )

      ),
    );
  }


}


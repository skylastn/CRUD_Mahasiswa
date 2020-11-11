import 'package:tesmahasiswa/Model/Kota.dart';
import 'package:tesmahasiswa/Model/Provinsi.dart';
import 'package:tesmahasiswa/Network/ApiClient.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class KotaViewModels {
  static Future<Kota> getCity(String id_prov) async {
    // future is used to handle the error when calling api > Future + async or await
//    var configandro = new Configandro();
    ApiClient apiClient = new ApiClient();
//    ApiConfig apiConfig = new ApiConfig();
    var data;
    var dan = '&';

    if(id_prov==null||id_prov.isEmpty){
      data = await http.get(apiClient.getBaseUrl()+"Mahasiswa/kota", headers: {
        'Accept': 'application/json',
      });
    }else{
      var materiget = 'province_id='+id_prov;
      data = await http.get(apiClient.getBaseUrl()+"Mahasiswa/kota?"+materiget, headers: {
        'Accept': 'application/json',
      });
    }


//    final data2 = artikelFromJson(data.body);
    print('Cek Data Kota: '+data.body);
    return kotaFromJson(data.body);

  }

}
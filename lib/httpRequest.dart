import 'dart:async';
import 'package:http/http.dart' as http ;

class getHttpInfo {

//  static String ipAdress = '192.168.8.108';
//  static String ipAdress = '172.16.41.32';
  static String ipAdress = '192.168.43.159';
  static String port = '3000';

//  Future<Object> createGetRequest(String apiUrl) async {
//    String url = 'http://' + ipAdress + ':' + this.port + '/api/' + apiUrl;
//    print(url);
//    var res = http.get(Uri.encodeFull(url),headers: { "Accept" : "application/json"});
////    var result = http.get(url)
//
//    return res;
//  }

  static getBaseUrl(){
    return ('http://' + ipAdress + ':' + port + '/api/');
  }
}
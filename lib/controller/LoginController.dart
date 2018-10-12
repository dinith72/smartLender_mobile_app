//import 'package:mobile_app/databaseConn.dart';
import '../httpRequest.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;


class loginController{
  bool status;
   Future<bool> validateUser(String un , String pw) async {
         var result = getLoginInfo();
         result.then((bool valid) {
            this.status = valid ;
            print(valid);
            return valid;
         });
//        print(this.status);
////        var resBody = json.decores.body);
//        if(un == 'dj' && pw=='dj'){
//          return true;
//        }
//        else  {
//          return false;
//        }

//     return true;
   }

    Future<bool>  getLoginInfo(String pw , String un) async {
     String url = getHttpInfo.getBaseUrl() + 'login/validate';
     print(url);
     Map<String, String> jsonMap = {
       'un': pw,
       'pw': un
     };
     String jsonStr = jsonEncode(jsonMap);
     print(jsonStr);
     var res =  await http.post( url, body: jsonMap,headers: { "Accept" : "application/json"});
     print(res.statusCode);
     var resBody = json.decode(res.body);
     print(resBody);
     print(resBody['result'].toString());
     if(resBody['result'].toString() == 'valid'){
       return true;
     }
     else {
       return true;
     }
//     return 'success';

   }


}
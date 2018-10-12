import 'package:date_format/date_format.dart';
import 'package:mobile_app/modelClasses/CenterInfo.dart';
import '../httpRequest.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;




class HomeController {

  Map<int ,CenterInfo> centeInfoList = new Map();
  DateTime getTodaysDate(){
    DateTime now = DateTime.now();
    return now ;
  }

  DateTime getPreviousDate(DateTime date){
    DateTime previos = date.add(new Duration(days: 1)) ;
    return previos;
  }

  DateTime getNextDate(DateTime date){
    DateTime next = date.add(new Duration(days: -1));
    return next;
  }

  double getTotalCollection( DateTime date ){
    double amount = 0.0 ;
    String dateStr = formatDate(date,[yyyy, '-', mm, '-', dd] );
    String comDate = formatDate(DateTime.now(),[yyyy, '-', mm, '-', dd]) ;
//    int res = date.compareTo(now);
    int res = dateStr.compareTo(comDate);
    if(res == 0){
      return 12500.0;
    }else {
      return 2500.0;
    }
  }

  double getTotalPayments( DateTime date ){
    double amount = 0.0 ;
    String dateStr = formatDate(date,[yyyy, '-', mm, '-', dd] );
    String comDate = formatDate(DateTime.now(),[yyyy, '-', mm, '-', dd]) ;
//    int res = date.compareTo(now);
    int res = dateStr.compareTo(comDate);
    if(res == 0){
      return 20000.0;
    }else {
      return 0.0;
    }
  }
  Future getReqInfo(String urlPmnt) async{

  }

//  Future<Map<int,CenterInfo>> getCenterInfo(DateTime date, String nic) async {
////      List<CenterInfo> getCenterInfo(DateTime date, int res ){
//
////    String dateStr = formatDate(date, [yyyy, '-', mm, '-', dd]);
//    String dateStr = '2018-10-11';
//    String comDate = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
////    int res = date.compareTo(now);
//    int res = dateStr.compareTo(comDate);
//    String urlPmnt = getHttpInfo.getBaseUrl() + "lc/loansGranted/details/" + nic + "/" + dateStr;
//    String urlCollec = getHttpInfo.getBaseUrl() + "pmt/centerwise/" + nic + "/" + dateStr;
//    print(urlPmnt);
//    print(urlCollec);
//
//    // getting the request data from the ape
////    Future reqPmt = await getReqInfo(urlPmnt);
//    http.get(Uri.encodeFull(urlCollec),headers: { "Accept" : "application/json"})
//          .then((resultCol){
//            if(resultCol.statusCode == 200){
//              List<dynamic> resBody = json.decode(resultCol.body);
//              resBody.forEach((item){
//                if (!centeInfoList.containsKey(item['idcenter'])){
//                  CenterInfo cenInfo = new CenterInfo();
//                  cenInfo.name = item['centerName'];
//                  cenInfo.collections = double.parse(item['amount'].toString());
//                  centeInfoList.putIfAbsent(item['idcenter'], () => cenInfo);
//                }else {
//                  CenterInfo cenInfo = centeInfoList[item['idcenter']];
//                  cenInfo.name = item['centerName'];
//                  cenInfo.collections = double.parse(item['amount'].toString()) ;
//                  centeInfoList[item['idcenter']] = cenInfo;
//                }
//
//              });
//              print(resBody);
//            }
//            http.get(Uri.encodeFull(urlPmnt),headers: { "Accept" : "application/json"})
//                .then((result){
//              if(result.statusCode == 200){
//                List<dynamic> resBody = json.decode(result.body);
//                print(resBody);
//                resBody.forEach((item){
//                  if(!centeInfoList.containsKey(item['idcenter'])){
//                    CenterInfo cenInfo = new CenterInfo();
//                    cenInfo.name = item['centerName'];
//                    cenInfo.payments = double.parse(item['amount'].toString());
//                    centeInfoList.putIfAbsent(item['idcenter'], () => cenInfo);
//                  }
//                  else{
//                    CenterInfo cenInfo = centeInfoList[item['idcenter']];
////          cenInfo.name = item['centerName'];
//                    cenInfo.payments = double.parse(item['amount'].toString()) ;
//                    centeInfoList.update(item['idcenter'],(Cen)=> cenInfo);
//                  };
//
//                });
//                print(centeInfoList);
//                return centeInfoList;
//              }
//            });
//        });
//
////    print(centeInfoList);
////    print(result);
////
////
////
////
////
////    print(centeInfoList);
//
//
////    List<CenterInfo> centerInfoListSp = new List();
////
////    if (res == 0) {
////      CenterInfo cf1 = new CenterInfo();
////      cf1.name = 'yakkala';
////      cf1.attendemce = 85.0;
////      cf1.payments = 10000.0;
////      cf1.collections = 15000.0;
////      centerInfoListSp.add(cf1);
////
////      CenterInfo cf2 = new CenterInfo();
////      cf2.name = 'Gampaha';
////      cf2.attendemce = 90.0;
////      cf2.payments = 5000.0;
////      cf2.collections = 20000.0;
////      centerInfoListSp.add(cf2);
////    }else {
////      CenterInfo cf1 = new CenterInfo();
////      cf1.name = 'miriswatte';
////      cf1.attendemce = 80.0;
////      cf1.payments = 0.0;
////      cf1.collections = 15000.0;
////      centerInfoListSp.add(cf1);
////
////      CenterInfo cf2 = new CenterInfo();
////      cf2.name = 'kelaniya';
////      cf2.attendemce = 80.0;
////      cf2.payments = 0.0;
////      cf2.collections = 10000.0;
////      centerInfoListSp.add(cf2);
////    }
//
////    return centeInfoList;
//      }


Future<Map<int,CenterInfo>> getCenterInfo(DateTime date, String nic) async {
//      List<CenterInfo> getCenterInfo(DateTime date, int res ){

    String dateStr = formatDate(date, [yyyy, '-', mm, '-', dd]);
    print(dateStr);
//  String dateStr = '2018-10-11';
  String comDate = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
//    int res = date.compareTo(now);
  int res = dateStr.compareTo(comDate);
  String urlPmnt = getHttpInfo.getBaseUrl() + "lc/loansGranted/details/" + nic + "/" + dateStr;
  String urlCollec = getHttpInfo.getBaseUrl() + "pmt/centerwise/" + nic + "/" + dateStr;
  print(urlPmnt);
  print(urlCollec);

  // getting the request data from the ape
//    Future reqPmt = await getReqInfo(urlPmnt);
  var resultCol = await http.get(Uri.encodeFull(urlCollec),headers: { "Accept" : "application/json"});

  if(resultCol.statusCode == 200){
    List<dynamic> resBody = json.decode(resultCol.body);
    resBody.forEach((item){
      print(resBody);
      if (!centeInfoList.containsKey(item['idcenter'])){
        CenterInfo cenInfo = new CenterInfo();
        cenInfo.name = item['centerName'];
        cenInfo.collections = double.parse(item['amount'].toString());
        centeInfoList.putIfAbsent(item['idcenter'], () => cenInfo);
      }else {
        CenterInfo cenInfo = centeInfoList[item['idcenter']];
        cenInfo.name = item['centerName'];
        cenInfo.collections = double.parse(item['amount'].toString()) ;
        centeInfoList[item['idcenter']] = cenInfo;
      }

    });

  }
   var result = await http.get(Uri.encodeFull(urlPmnt),headers: { "Accept" : "application/json"});

    if(result.statusCode == 200){
      List<dynamic> resBody = json.decode(result.body);
      print(resBody);
      resBody.forEach((item){
        if(!centeInfoList.containsKey(item['idcenter'])){
          CenterInfo cenInfo = new CenterInfo();
          cenInfo.name = item['centerName'];
          cenInfo.payments = double.parse(item['amount'].toString());
          centeInfoList.putIfAbsent(item['idcenter'], () => cenInfo);
        }
        else{
          CenterInfo cenInfo = centeInfoList[item['idcenter']];
//          cenInfo.name = item['centerName'];
          cenInfo.payments = double.parse(item['amount'].toString()) ;
          centeInfoList.update(item['idcenter'],(Cen)=> cenInfo);
        };

      });
      print(centeInfoList);
      return centeInfoList;
    }
    }


//    print(centeInfoList);
//    print(result);
//
//
//
//
//
//    print(centeInfoList);


//    List<CenterInfo> centerInfoListSp = new List();
//
//    if (res == 0) {
//      CenterInfo cf1 = new CenterInfo();
//      cf1.name = 'yakkala';
//      cf1.attendemce = 85.0;
//      cf1.payments = 10000.0;
//      cf1.collections = 15000.0;
//      centerInfoListSp.add(cf1);
//
//      CenterInfo cf2 = new CenterInfo();
//      cf2.name = 'Gampaha';
//      cf2.attendemce = 90.0;
//      cf2.payments = 5000.0;
//      cf2.collections = 20000.0;
//      centerInfoListSp.add(cf2);
//    }else {
//      CenterInfo cf1 = new CenterInfo();
//      cf1.name = 'miriswatte';
//      cf1.attendemce = 80.0;
//      cf1.payments = 0.0;
//      cf1.collections = 15000.0;
//      centerInfoListSp.add(cf1);
//
//      CenterInfo cf2 = new CenterInfo();
//      cf2.name = 'kelaniya';
//      cf2.attendemce = 80.0;
//      cf2.payments = 0.0;
//      cf2.collections = 10000.0;
//      centerInfoListSp.add(cf2);
//    }

//    return centeInfoList;
}



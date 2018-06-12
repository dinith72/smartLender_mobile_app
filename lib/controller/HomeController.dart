import 'package:date_format/date_format.dart';
import 'package:mobile_app/modelClasses/CenterInfo.dart';




class HomeController {

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

  List<CenterInfo> getCenterInfo(DateTime date) {
    List<CenterInfo> centeInfo = new List<CenterInfo>();
    String dateStr = formatDate(date, [yyyy, '-', mm, '-', dd]);
    String comDate = formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]);
//    int res = date.compareTo(now);
    int res = dateStr.compareTo(comDate);
    if (res == 0) {
      CenterInfo cf1 = new CenterInfo();
      cf1.name = 'yakkala';
      cf1.attendemce = 85.0;
      cf1.payments = 10000.0;
      cf1.collections = 15000.0;
      centeInfo.add(cf1);

      CenterInfo cf2 = new CenterInfo();
      cf2.name = 'Gampaha';
      cf2.attendemce = 90.0;
      cf2.payments = 5000.0;
      cf2.collections = 20000.0;
      centeInfo.add(cf2);
    }else {
      CenterInfo cf1 = new CenterInfo();
      cf1.name = 'miriswatte';
      cf1.attendemce = 80.0;
      cf1.payments = 0.0;
      cf1.collections = 15000.0;
      centeInfo.add(cf1);

      CenterInfo cf2 = new CenterInfo();
      cf2.name = 'kelaniya';
      cf2.attendemce = 80.0;
      cf2.payments = 0.0;
      cf2.collections = 10000.0;
      centeInfo.add(cf2);
    }

    return centeInfo;
  }
}
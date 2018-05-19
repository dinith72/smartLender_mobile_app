import 'package:sqljocky5/sqljocky.dart';
import 'dart:async';

class databaseConn {

  var pool;

  static ConnectionPool getConnection(){
    var pool = new ConnectionPool(
        host: 'localhost',
        port: 3305,
        user: 'root',
        password: 'mysql',
        db: 'smartlender',
        max: 5);
    print('connected');
    return pool;


  }
  static testSample() async {
    var pool2 = new ConnectionPool(
        host: '127.0.0.1',
        port: 3305,
        user: 'root',
        password: 'mysql',
        db: 'smartlender',
        max: 5,
      useSSL: true,
    );
    print('connected');
    var result = await pool2.query("SELECT * FROM smartlender.company;");
    result.forEach((row) {
      print(row[1]);
    }

    );
  }
}
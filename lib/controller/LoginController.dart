import 'package:mobile_app/databaseConn.dart';
import 'package:sqljocky5/sqljocky.dart';


class loginController{
   bool validateUser(String un , String pw)  {
        var pool = databaseConn.getConnection();
//        var result = await pool.prepareExecute('SELECT * FROM smartlender.company;', null);
//        result.forEach((row){
//          print(row[1]);
//        });
        if(un == '' && pw==''){
          return true;
        }
        else  {
          return false;
        }

//     return true;
   }
}
import 'package:mobile_app/databaseConn.dart';



class loginController{
   bool validateUser(String un , String pw)  {

        if(un == '' && pw==''){
          return true;
        }
        else  {
          return false;
        }

//     return true;
   }
}
class Attendencecontroller {
  bool markAttendence(List<String> nic , DateTime date , int status){
    for ( String s in nic){
      print(s);

    }
    print(date.toString());
    print(status.toString());
    return true ;
  }
}
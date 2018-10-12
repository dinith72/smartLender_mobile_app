import 'package:mobile_app/controller/Member.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../httpRequest.dart';
import 'dart:convert';
import 'package:mobile_app/controller/Member.dart';

class Attendencecontroller {
  bool markAttendence(List<String> nic , DateTime date , int status){
    for ( String s in nic){
      print(s);

    }
    print(date.toString());
    print(status.toString());
    return true ;
  }
  Future<bool> markAttendenceAsync(List<String> nic , DateTime date , int status){
    String url = getHttpInfo.getBaseUrl() + "att/updateAtt";
    print("ststus " + status.toString());
    var jsonMap = {

      'status': '1',
        'time': new DateTime.now().toIso8601String(),
        'teamMemId': '7',
        'empId': "953280086v",
        'comId': 2.toString(),
        'description': "j new attendence",
        'effDate': date.toIso8601String()


    };
    var jsonMap2 = {
      "status": 1,
      "time": "2018-2-06 10:00:00",
      "teamMemId": 3,
      "empId": "953280086v",
      "comId": 3,
      "description": "j new attendence",
      "effDate": "2018-05-07"
    };
    String jsonStr = jsonEncode(jsonMap);
    print(jsonMap);
    var client = new http.Client();
    client.post(url, body: jsonStr ).then((result) {
      print(result.statusCode);
      print(result.body);
    });
  }
  List<String> getTeams(){
    List<String> teams = new List<String>();
    teams.addAll(['select team']);

    return teams;
  }

  Future<Map<String,String>> getTeamsAsync(String cenId) async {
    Map<String , String> teams = new Map();
    String url = getHttpInfo.getBaseUrl() + "team/cenId/" + cenId ;
    print(url);
    var res =  await http.get(Uri.encodeFull(url),headers: { "Accept" : "application/json"});
    print(res );
    List<dynamic> resBody = json.decode(res.body);
    resBody.forEach((entry){
//      print(entry['firstName'] + " " + entry['lastName']);
      teams.putIfAbsent(entry['idteam'].toString(),() => entry['teamName']);
    });
    return (teams);
  }

  List <Member> getMembers(){
    List<Member> memberList = new List<Member>();
//    members.addAll(['Dinith Jayabodhi', 'chamaka rajapakshe','wisura weerathunga','a','a','v']);

    Member member = new Member();
    member.memName = 'dinith';
    member.loanAmt =10000.0;
    member.paidLoanAmt = 2500.0;
    member.memNic = '953280086v';
    memberList.add(member);

    Member member1 = new Member();
    member1.memName = 'dinith';
    member1.loanAmt =10000.0;
    member1.paidLoanAmt = 2500.0;
    member1.memNic = '953280081v';
    memberList.add(member1);

    Member member2 = new Member();
    member2.memName = 'dinith';
    member2.loanAmt =10000.0;
    member2.paidLoanAmt = 2500.0;
    member2.memNic = '953280082v';
    memberList.add(member2);
    return memberList;
  }

  Future<Map<String,Member>> getMembersAsync(String teamId) async {
    Map<String , Member> members = new Map();
    String url = getHttpInfo.getBaseUrl() + "tmem/team/" + teamId ;
    print(url);
    var res =  await http.get(Uri.encodeFull(url),headers: { "Accept" : "application/json"});
    print(res );
    List<dynamic> resBody = json.decode(res.body);
    resBody.forEach((entry){
        Member mem = new Member();
        mem.memNic = entry['NIC'];
        mem.memName = entry['firstName'] ;
//      print(entry['firstName'] + " " + entry['lastName']);
      members.putIfAbsent(entry['idteamMember'].toString(),() => mem);
    });
    return (members);
  }

  List<String> getCenterNames(){
    List<String> centerNames = new List<String>();
    centerNames.add('center 01');
    centerNames.add('center 02');
    centerNames.add('center 03');
    centerNames.add('center 04');
    centerNames.add('center 05');
    centerNames.add('center 06');
    return centerNames;
  }
  Future<Map<String,String>> getCenterNamesAsync() async {
    Map<String , String> centers = new Map();
    String url = getHttpInfo.getBaseUrl() + "cen";
    print(url);
    var res =  await http.get(Uri.encodeFull(url),headers: { "Accept" : "application/json"});
    print(res );
    List<dynamic> resBody = json.decode(res.body);
    resBody.forEach((entry){
//      print(entry['firstName'] + " " + entry['lastName']);
      centers.putIfAbsent(entry['idcenter'].toString(),() => entry['centerName']);
    });
    return (centers);
  }

  String getCenterId(String name){
    return 'cent1';
  }

}
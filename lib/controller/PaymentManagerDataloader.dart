import 'package:mobile_app/controller/Member.dart';
import 'package:http/http.dart' as http;
import '../httpRequest.dart';
import 'dart:convert';
import 'dart:async';

class PaymentManagerDataLoader{

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

  String getCenterId(String name){
    return 'cent1';
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
    member1.memName = 'chamaka';
    member1.loanAmt =10000.0;
    member1.paidLoanAmt = 5000.0;
    member1.memNic = '953280081v';
    memberList.add(member1);

    Member member2 = new Member();
    member2.memName = 'chathura';
    member2.loanAmt =10000.0;
    member2.paidLoanAmt = 7500.0;
    member2.memNic = '953280082v';
    memberList.add(member2);
    return memberList;
  }

  Future<Map<String,Member>> getMembersAsync(String teamId) async {
    Map<String , Member> members = new Map();
    String url = getHttpInfo.getBaseUrl() + "tmem/team/" + teamId ;
    List<String> tmtmeId = ['1','2','5','7','8','9'];
    print(url);
    var res =  await http.get(Uri.encodeFull(url),headers: { "Accept" : "application/json"});
    print(res );
    List<dynamic> resBody = json.decode(res.body);
    resBody.forEach((entry){
//      tmtmeId.add(entry['idteamMember']);
      Member mem = new Member();
      mem.memNic = entry['NIC'];
      mem.memName = entry['firstName'] ;


      double loanAmt =
      mem.loanAmt = 10000.0;
      mem.paidLoanAmt = 5000.0;
//      print(entry['firstName'] + " " + entry['lastName']);
      members.putIfAbsent(entry['idteamMember'].toString(),() => mem);

    });
    return (members);
  }

  List<String> getPeriods(){
    List<String> periods = new List<String>();
    periods.addAll(['01' , '02' , '03' , '04']);
    return periods;
  }

  bool sendCollectionDetials(List<String> nic , double amount, String period){
    for(String s in nic){
      print(s);
    }
    print(amount);
    print(period);
    return true;
  }
  bool sendSingleCollectionDetials(String nic , double amount, String period){
    print(nic);
    print(amount);
    print(period);
    return true;
  }


}
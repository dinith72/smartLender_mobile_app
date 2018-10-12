import 'package:mobile_app/otherComponents/EntryItem.dart';
import 'package:mobile_app/otherComponents/Entry.dart';
import 'package:mobile_app/controller/Member.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import '../httpRequest.dart';
import 'dart:convert';

class MemberInfoController {

  List<String> _teams = new List<String>();
  List<String> _members = new List<String>();
  List<String> _centers = new List<String>();
  List<Entry> _memberDetials = new List<Entry>();
  String _loanCycle = '5';
  double _loanAmt = 45000.0;
  double _attendence ;
  double _repayemnt ;

  String getMemNic(String memName){
    return '953280086v';
  }
  List<String> getCenters(){
    _centers  = ['Gampaha' , 'colombo' , 'kelaniaya' , 'Ja_ela'];
    return _centers;
  }

  List<String> getMembers(){
    _members = ['dinith jayaboshi' , 'akalanka jayalath' , 'chathura ' , 'pasan'];
    return _members;
  }
  Future<Map<String,String>> getMembersAsync() async{
    Map<String,String> members = new Map();
    String url = getHttpInfo.getBaseUrl() + "cus/2";
    print(url);
    var res = await http.get(Uri.encodeFull(url),headers: { "Accept" : "application/json"});
    print(res);
    List<dynamic> resBody = json.decode(res.body);
    resBody.forEach((entry){
      print(entry['firstName'] + " " + entry['lastName']);
//      members.add(entry['firstName'] + " " + entry['lastName']);
      String name = entry['firstName'] + " " + entry['lastName'];
      members.putIfAbsent(entry['NIC'].toString(),() => name);
    });
    return (members);

  }


  List<String> getTeams(){
    _teams = ['team 1' , 'team 2' , 'team 3' , 'teams4'];
    return _teams;
  }
    Future<List<Entry>> getMemberDetails(String nic) async {
    print(nic);
    Member mem = new Member();
    String url = getHttpInfo.getBaseUrl() + "cus/" + nic + "/2";
    var res = await http.get(Uri.encodeFull(url),headers: { "Accept" : "application/json"});
    var resBody = jsonDecode(res.body);
    print(resBody['NIC']);
    mem.memNic = resBody['NIC'];
    mem.memName = resBody['firstName'] + ' ' + resBody['lastName'];
    mem.dob = resBody['birthdate'].toString().substring(0,10);
    mem.status = resBody['status'];
    mem.joinedDate = resBody['joinedDate'];
    mem.businessType = resBody['businesType'];
    print(mem);
    String url2 = getHttpInfo.getBaseUrl() + "lc/cus/all/" + nic + "/2";
    var res2 = await http.get(Uri.encodeFull(url2),headers: { "Accept" : "application/json"});
    List<dynamic> resbody2 = jsonDecode(res2.body);
    String grantedDate = resbody2[0]['grantedDate'].toString().substring(0,10);
    String dueDate = resbody2[0]['dueDate'].toString().substring(0,10);
    String amount = resbody2[0]['amount'].toString();
    this._loanAmt = double.parse(amount);
    String cycleREf = resbody2[0]['loanCycRef'];
    this._loanCycle = resbody2[0]['idLoanCycle'].toString();
    _memberDetials =
    [
      new Entry(
          "personal Info",
          '',
          <Entry>[
            new Entry('nic',mem.memNic,),
            new Entry('name',mem.memName),
            new Entry('date of birth',mem.dob),
            new Entry('status',mem.status),

          ]
      ),

      new Entry(
          'Company Info',
          '',
          <Entry>[
            new Entry('joined date' , mem.joinedDate),
            new Entry('business', mem.businessType),


          ]
      ),
      new Entry(
          'Loan Payment Info',
          '',
          <Entry>[
            new Entry('Granted date' , grantedDate),
            new Entry( 'Due Date ' , dueDate),
            new Entry('Amount ' , amount),
            new Entry('Reference  ',cycleREf),


          ]
      )
    ];
    return _memberDetials;

  }
  Future<double> getRepayment() async{
    // getting the total attendence
    print('repayment is running');
//    print('loan cycle' + _loanCycle);
    String url = getHttpInfo.getBaseUrl() + "pmt/sum/sum2/sum3/"  + _loanCycle;
    print(url);
    var res = await http.get(Uri.encodeFull(url),headers: { "Accept" : "application/json"});
    var resBody = jsonDecode(res.body);
    double pmnt = double.parse(resBody['total'].toString());
    print(pmnt);
    _repayemnt = pmnt/_loanAmt*100;
    return _repayemnt;
  }
  Future<double> getAtendence(String nic) async{

    // getting the total attendence
    String urlatt = getHttpInfo.getBaseUrl() + "att/cus/" + nic + "/1";
    var resAtt = await http.get(Uri.encodeFull(urlatt),headers: { "Accept" : "application/json"});
    var resAttbody = jsonDecode(resAtt.body);
    int att = resAttbody['total'];
    print(att);

    // getting the total absebts
    String urlAbs = getHttpInfo.getBaseUrl() + "att/cus/" + nic + "/0";
    var resAbs = await http.get(Uri.encodeFull(urlAbs),headers: { "Accept" : "application/json"});
    var resAbsbody = jsonDecode(resAbs.body);
    int absents = resAbsbody['total'];
    print(absents);
    _attendence = att/(att + absents)*100;
    return _attendence;
  }

  List<Member> getMemberSearchDetails(String nic){
    List<Member> memList = new List<Member>();
    Member mem = new Member();
    mem.memNic = '953280086v';
    mem.memName = 'dinith  jayabodhi';
    Member mem1 = new Member();
    mem1.memNic = '953280087v';
    mem1.memName = 'chamaka';
    Member mem2 = new Member();
    mem2.memNic = '953280088v';
    mem2.memName = 'wisura';
    Member mem3 = new Member();
    mem3.memNic = '953280080v';
    mem3.memName = 'chathura';

    memList.add(mem);
    memList.add(mem1);
    memList.add(mem2);
    memList.add(mem3);
    return memList;

  }


}
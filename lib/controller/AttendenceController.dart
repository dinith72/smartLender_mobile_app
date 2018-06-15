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
  List<String> getTeams(){
    List<String> teams = new List<String>();
    teams.addAll(['Team 01', 'Team 02', 'Team 03']);

    return teams;
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

  String getCenterId(String name){
    return 'cent1';
  }

}
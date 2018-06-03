import 'package:mobile_app/controller/Member.dart';


class PaymentManagerDataLoader{

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
      memberList.add(member);

    return memberList;
  }
}
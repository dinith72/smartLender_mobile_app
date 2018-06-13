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
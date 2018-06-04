class Member{
  String _memName;
  double _loanAmt;
  double _paidLoanAmt;
  String _profPicUrl;
  String _memNic;

  String get memNic => _memNic;

  set memNic(String value) {
    _memNic = value;
  }

  String get memName => _memName;

  set memName(String value) {
    _memName = value;
  }

  String get profPicUrl => _profPicUrl;

  set profPicUrl(String value) {
    _profPicUrl = value;
  }

  double get paidLoanAmt => _paidLoanAmt;

  set paidLoanAmt(double value) {
    _paidLoanAmt = value;
  }

  double get loanAmt => _loanAmt;

  set loanAmt(double value) {
    _loanAmt = value;
  }


}
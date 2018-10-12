class Member{
  String _memName;
  double _loanAmt;
  double _paidLoanAmt;
  String _profPicUrl;
  String _memNic;
  String _dob;
  String _conNum;
  String _status;
  String _joinedDate;
  String _businessType;


  String get joinedDate => _joinedDate;

  set joinedDate(String value) {
    _joinedDate = value;
  }

  String get status => _status;

  set status(String value) {
    _status = value;
  }

  String get conNum => _conNum;

  set conNum(String value) {
    _conNum = value;
  }

  String get dob => _dob;

  set dob(String value) {
    _dob = value;
  }

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

  String get businessType => _businessType;

  set businessType(String value) {
    _businessType = value;
  }


}
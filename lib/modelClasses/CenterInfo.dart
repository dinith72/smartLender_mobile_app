class CenterInfo {

  String _name ;
  double _attendemce ;
  double _collections ;
  double _payments ;

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  double get attendemce => _attendemce;

  double get payments => _payments;

  set payments(double value) {
    _payments = value;
  }

  double get collections => _collections;

  set collections(double value) {
    _collections = value;
  }

  set attendemce(double value) {
    _attendemce = value;
  }
}
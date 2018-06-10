class Entry {

  // this entry calss accept 3 imports ,
  // title of section , contents ( data) , another collection of same type of entities .
  Entry(this.title, this.content, [this.children = const <Entry>[]]);

  final String title; // ttile of the compoent
  final String content; // content of component
  final List<Entry> children; // collection of sub components
}
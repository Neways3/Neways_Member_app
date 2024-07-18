class DropdownModel {
  final int id;
  final String name;
  var additionlValue;

  DropdownModel(this.id, this.name,{this.additionlValue});
  factory DropdownModel.selectItem(String title)=>DropdownModel(0, title);
}
class DropdownModelForTwoValue {
  final int id;
  final String name;
  final String name1;

  var additionlValue;

  DropdownModelForTwoValue(this.id, this.name,this.name1, {this.additionlValue});
  factory DropdownModelForTwoValue.selectItem(String title, String title1)=>DropdownModelForTwoValue(0, title, title1);
}

class DropdownModelForData {
  final String title;
  final String name;
  var additionlValue;

  DropdownModelForData(this.title, this.name,{this.additionlValue});
  factory DropdownModelForData.selectItem(String title)=>DropdownModelForData('', title);
}
class RadioModel {
  final String title;
  final dynamic value;
  final dynamic groupValue;

  RadioModel({this.title, this.value, this.groupValue});

@override
  String toString() {
    return 'Title: $title, Value: $value, GroupValue: $groupValue';
  }

}

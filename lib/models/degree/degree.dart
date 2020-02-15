import 'package:flutter/foundation.dart';

class Degree implements Comparable<Degree> {
  String name, key, type, years;

  Degree(
      {@required this.name,
      @required this.key,
      @required this.type,
      @required this.years});

  @override
  int compareTo(Degree other) {
    return name.compareTo(other.name);
  }

}

import 'package:flutter/foundation.dart';
import 'package:pakistan_universities_admission/models/degree/degree.dart';

class BachelorDegree extends Degree {
  String name, key;
  int requiredPercenatge;

  BachelorDegree(
      {@required this.name, @required this.key, this.requiredPercenatge})
      : super(name: name, key: key, type: "Bachelor", years: "4 years");
}

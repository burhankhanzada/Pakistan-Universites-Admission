import 'package:flutter/foundation.dart';
import 'package:pakistan_universities_admission/models/degree/degree.dart';

class MasterDegree extends Degree {
  final String name, key;
  final double reuiredCGPA;

  MasterDegree(
      {@required this.name, @required this.key, @required this.reuiredCGPA})
      : super(name: name, key: key, type: "Master", years: "2 years");
}

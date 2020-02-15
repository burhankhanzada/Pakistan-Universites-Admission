import 'package:flutter/material.dart';
import 'package:pakistan_universities_admission/models/university/university.dart';

class UniversityDetail extends StatelessWidget {
  final University university;

  const UniversityDetail({this.university});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('University Detail'),
      ),
      body: Column(
        children: <Widget>[
          Text(university.name),
        ],
      ),
    );
  }
}

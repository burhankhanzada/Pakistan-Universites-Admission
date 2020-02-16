import 'package:flutter/material.dart';
import 'package:pakistan_universities_admission/models/university/university.dart';

class CityWidget extends StatelessWidget {
  final University university;

  const CityWidget({this.university});

  @override
  Widget build(BuildContext context) {
    Widget textWidget(String text) {
      return Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      );
    }

    if (university.cities != null) {
      List<Widget> cities = [];

      for (int i = 0; i < university.cities.length; i++) {
        var text = university.cities[i];

        if (i != university.cities.length - 1) {
          text = '$text, ';
        } else {
          text = '${university.cities[i]}';
        }

        cities.add(textWidget(text));
      }

      return Wrap(
        children: cities,
      );
    } else if (university.city != null) {
      return textWidget(university.city);
    }
  }
}

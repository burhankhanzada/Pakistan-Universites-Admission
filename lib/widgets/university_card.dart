import 'package:flutter/material.dart';
import 'package:pakistan_universities_admission/models/university/university.dart';
import 'package:pakistan_universities_admission/pages/university_detail.dart';

class UniversityCard extends StatelessWidget {
  final University university;

  const UniversityCard({this.university});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UniversityDetail(
                university: university,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 24,
                backgroundColor: Theme.of(context).primaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/images/university.png',
                    height: 48,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(university.name,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  .fontSize)),
                      Row(
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/location.png',
                                  height: 24,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: university.city is String
                                        ? Text(
                                            '${university.city}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          )
                                        : null),
                              ],
                            ),
                          ),
                          Chip(
                            backgroundColor: Theme.of(context).primaryColor,
                            label: Text(
                              '${university.sector}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

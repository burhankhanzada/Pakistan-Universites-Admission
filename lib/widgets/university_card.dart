import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pakistan_universities_admission/models/university/university.dart';
import 'package:pakistan_universities_admission/pages/university_detail.dart';
import 'package:pakistan_universities_admission/utils/color.dart';
import 'package:pakistan_universities_admission/widgets/city.dart';

class UniversityCard extends StatelessWidget {
  final University university;

  const UniversityCard({this.university});

  @override
  Widget build(BuildContext context) {
    Color primaryColor;

    ThemeData theme() {
      if (university.color != null) {
        print(university.color);
        primaryColor = Color(getColorFromHex(university.color));
        return Theme.of(context)
            .copyWith(primaryColor: primaryColor, accentColor: primaryColor);
      }
    }

    Widget image() {
      if (university.logo != null) {
        return CachedNetworkImage(
          width: 50,
          height: 50,
          imageUrl: university.logo,
          placeholder: (context, url) => CircularProgressIndicator(),
        );
      } else
        return CircleAvatar(
          radius: 25,
          backgroundColor: Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/university.png',
              height: 50,
              color: Colors.white,
            ),
          ),
        );
    }

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
            children: <Widget>[
              Hero(
                tag: university.name,
                child: image(),
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
                            fit: FlexFit.loose,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/location.png',
                                  height: 24,
                                  color: Theme.of(context).primaryColor,
                                ),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: CityWidget(
                                      university: university,
                                    ),
                                  ),
                                )
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

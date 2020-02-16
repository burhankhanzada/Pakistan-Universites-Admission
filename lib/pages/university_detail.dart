import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pakistan_universities_admission/models/degree/degree.dart';
import 'package:pakistan_universities_admission/models/university/university.dart';
import 'package:pakistan_universities_admission/pages/all_degrees.dart';
import 'package:pakistan_universities_admission/widgets/city.dart';
import 'package:url_launcher/url_launcher.dart';

class UniversityDetail extends StatelessWidget {
  final University university;

  const UniversityDetail({this.university});

  @override
  Widget build(BuildContext context) {
    List<Widget> actionsList = [];

    if (university.website != null) {
      actionsList.add(IconButton(
        icon: Icon(Icons.open_in_browser),
        onPressed: () {
          _launchURL(university.website);
        },
      ));
    }

    List<Widget> bodyWidgets = [];

    Widget image() {
      if (university.logo != null) {
        return CachedNetworkImage(
          imageUrl: university.logo,
          placeholder: (context, url) => Container(
            color: Theme.of(context).primaryColor,
            child: CircularProgressIndicator(),
          ),
        );
      } else
        return Container(
          width: double.maxFinite,
          height: 100,
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.all(16),
          child: Image.asset(
            'assets/images/university.png',
            color: Colors.white,
          ),
        );
    }

    bodyWidgets.add(Padding(
      padding: const EdgeInsets.all(8),
      child: Hero(
        tag: university.name,
        child: image(),
      ),
    ));

    bodyWidgets.add(Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: Text(
          university.name,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: Theme.of(context).textTheme.headline4.fontSize,
              fontWeight: FontWeight.bold),
        ),
      ),
    ));

    Widget addressOrCity() {
      if (university.address != null) {
        return Text(
          university.address,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
          ),
        );
      } else {
        return CityWidget(
          university: university,
        );
      }
    }

    bodyWidgets.add(Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
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
                    child: addressOrCity(),
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
    ));

    degreesWidget() {
      if (university.degrees != null && university.degrees.isNotEmpty) {
        List<Degree> degrees = [];

        for (int i = 0; i < university.degrees.length; i++) {
          for (var d in BachelorDegrees.bachelorsDegreesList) {
            if (university.degrees[i] == d.key) {
              degrees.add(d);
            }
          }
        }

        degrees.sort();

        List<Widget> degreeWigets = [];

        for (var d in degrees) {
          degreeWigets.add(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    fit: FlexFit.loose,
                    child: Text(
                      d.name,
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.subtitle1.fontSize,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      d.years,
                      style: TextStyle(
                        fontSize:
                            Theme.of(context).textTheme.subtitle1.fontSize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        bodyWidgets.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8),
              width: double.maxFinite,
              color: Theme.of(context).primaryColor,
              child: Text(
                'Degrees provide',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Theme.of(context).textTheme.headline6.fontSize,
                ),
              ),
            ),
            Wrap(
              spacing: 8,
              children: degreeWigets,
            ),
          ],
        ));
      }
    }

    degreesWidget();

    campusesWidget() {
      if (university.campuses != null && university.campuses.isNotEmpty) {
        List<Widget> campusWigets = [];

        university.campuses.sort();

        for (var c in university.campuses) {
          campusWigets.add(
            Container(
              margin: EdgeInsets.all(8),
              width: double.maxFinite,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        c.name,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize:
                              Theme.of(context).textTheme.headline6.fontSize,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
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
                                padding: const EdgeInsets.only(left: 8),
                                child: Text(
                                  c.address,
                                  style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .subtitle1
                                        .fontSize,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        bodyWidgets.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8),
              width: double.maxFinite,
              color: Theme.of(context).primaryColor,
              child: Text(
                'Campuses',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Theme.of(context).textTheme.headline6.fontSize,
                ),
              ),
            ),
            Wrap(
              spacing: 8,
              children: campusWigets,
            ),
          ],
        ));
      }
    }

    campusesWidget();

    if (university.otherDetails != null && university.otherDetails.isNotEmpty) {
      print("otherDetails: ${university.otherDetails}");
      bodyWidgets.add(Text(university.otherDetails));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('University Detail'),
        actions: actionsList,
      ),
      body: ListView(scrollDirection: Axis.vertical, children: bodyWidgets),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

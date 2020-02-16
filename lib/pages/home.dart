import 'package:flutter/material.dart';
import 'package:pakistan_universities_admission/pages/find.dart';
import 'package:pakistan_universities_admission/pages/universities.dart';

class HomePage extends StatelessWidget {
  final title;

  const HomePage({this.title});

  @override
  Widget build(BuildContext context) {
    Widget button({String text, String imagePath, VoidCallback onPressed}) {
      return Expanded(
        child: Container(
          padding: EdgeInsets.all(8.0),
          width: double.maxFinite,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            clipBehavior: Clip.antiAlias,
            child: Ink(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: onPressed,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 2,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              text,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .fontSize),
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        imagePath,
                        color: Colors.white,
                        height: 80,
                        width: 80,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                button(
                  text: 'Find university for undergraduate degree',
                  imagePath: 'assets/images/certificate.png',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FindPage(
                        optionChoosedFromHome: 0,
                      ),
                    ),
                  ),
                ),
                // button(
                //   text: 'Find University Based On Last Degree',
                //   imagePath: 'assets/images/degree.png',
                //   onPressed: () => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => FindPage(
                //         optionChoosedFromHome: 1,
                //       ),
                //     ),
                //   ),
                // ),
                // button(
                //   text: 'Find University Based On City',
                //   imagePath: 'assets/images/location.png',
                //   onPressed: () => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => FindPage(
                //         optionChoosedFromHome: 1,
                //       ),
                //     ),
                //   ),
                // ),
                button(
                  text: 'See all universities',
                  imagePath: 'assets/images/university.png',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UniversitiesPage(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

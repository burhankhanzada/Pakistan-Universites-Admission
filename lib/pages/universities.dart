import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pakistan_universities_admission/models/radio_model.dart';
import 'package:pakistan_universities_admission/models/university/university.dart';
import 'package:pakistan_universities_admission/pages/university_detail.dart';
import 'package:pakistan_universities_admission/widgets/radio_row.dart';
import 'package:pakistan_universities_admission/widgets/university_card.dart';

class UniversitiesPage extends StatefulWidget {
  List<University> universityList;

  UniversitiesPage({this.universityList});

  @override
  _UniversitiesPageState createState() => _UniversitiesPageState();
}

class _UniversitiesPageState extends State<UniversitiesPage> {
  int sortRadioGroup = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Universities'),
        actions: <Widget>[
          // PopupMenuButton(
          //   icon: Icon(Icons.filter_list),
          //   onSelected: (String) {},
          //   itemBuilder: (context) {
          //     return <PopupMenuItem>[
          //       PopupMenuItem(
          //         child: RadioRow(
          //           radioModel: RadioModel(
          //               title: 'Sort with name',
          //               value: 0,
          //               groupValue: sortRadioGroup),
          //           onChanged: (value) => setState(
          //             () => sortRadioGroup = value,
          //           ),
          //         ),
          //       ),
          //       PopupMenuItem(
          //         child: RadioRow(
          //           radioModel: RadioModel(
          //               title: 'Sort with city',
          //               value: 1,
          //               groupValue: sortRadioGroup),
          //           onChanged: (value) => setState(
          //             () => sortRadioGroup = value,
          //           ),
          //         ),
          //       )
          //     ];
          //   },
          // ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print(widget.universityList.length);
              showSearch(
                context: context,
                delegate:
                    SearchUniversity(universityList: widget.universityList),
              );
            },
          )
        ],
      ),
      body: widget.universityList != null
          ? UniversityList(
              universityList: widget.universityList,
            )
          : FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('assets/all_universities.json'),
              builder: (context, snapshot) {
                List<University> list = [];

                if (snapshot.connectionState == ConnectionState.done) {
                  var parsedJson = json.decode(snapshot.data.toString());

                  for (var json in parsedJson) {
                    list.add(University.fromJson(json));
                  }

                  widget.universityList = list;

                  return UniversityList(
                    universityList: list,
                  );
                } else
                  return Center(
                    child: CircularProgressIndicator(),
                  );
              },
            ),
    );
  }
}

class UniversityList extends StatelessWidget {
  final List<University> universityList;

  const UniversityList({this.universityList});

  @override
  Widget build(BuildContext context) {
    if (universityList.isNotEmpty) {
      return ListView.builder(
        itemCount: universityList.length,
        itemBuilder: (context, index) {
          return UniversityCard(
            university: universityList[index],
          );
        },
      );
    } else {
      return Center(
        child: Text(
          'No University Found',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: Theme.of(context).textTheme.headline6.fontSize),
        ),
      );
    }
  }
}

class SearchUniversity extends SearchDelegate<String> {
  final List<University> universityList;

  List<University> recentList;

  SearchUniversity({this.universityList});

  bool showingResults = false;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            showSuggestions(context);
            showingResults = false;
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        if (showingResults) {
          showSuggestions(context);
          showingResults = false;
          query = "";
        } else {
          close(context, null);
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    showingResults = true;
    List<University> resultList = universityList
        .where((element) =>
            element.name.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: resultList.length,
      itemBuilder: (context, index) {
        return UniversityCard(
          university: resultList[index],
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<University> sugestionList;

    if (query.isEmpty && recentList != null) {
      sugestionList = recentList;
    } else {
      sugestionList = universityList
          .where((element) =>
              element.name.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    }

    return ListView.builder(
      itemCount: sugestionList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UniversityDetail(
                  university: sugestionList[index],
                ),
              ),
            );
          },
          child: ListTile(
            leading: Container(
              width: 0,
            ),
            title: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: sugestionList[index].name.substring(0, query.length),
                    style: TextStyle(
                        backgroundColor:
                            Theme.of(context).primaryColor.withOpacity(0.75)),
                  ),
                  TextSpan(
                      text: sugestionList[index].name.substring(query.length),
                      style: DefaultTextStyle.of(context).style),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

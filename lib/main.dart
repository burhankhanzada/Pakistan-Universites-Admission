import 'package:flutter/material.dart';
import 'package:pakistan_universities_admission/pages/home.dart';
import 'package:pakistan_universities_admission/utils/color.dart';

main() => runApp(App());

class App extends StatelessWidget {
  final String title = 'Pakistan Universities Admission';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primaryColor: brandColor, accentColor: brandColor),
      home: HomePage(title: title),
    );
  }
}

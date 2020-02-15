import 'package:flutter/material.dart';
import 'package:pakistan_universities_admission/pages/home.dart';

main() => runApp(App());

class App extends StatelessWidget {

  final String title = 'Pakistan Universities Admission';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        primaryColor: Colors.green[900],
        accentColor:  Colors.green[900]
      ),
      home: HomePage(title: title),
    );
  }
}

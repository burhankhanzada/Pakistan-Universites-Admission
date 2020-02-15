import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pakistan_universities_admission/models/degree/degree.dart';
import 'package:pakistan_universities_admission/models/radio_model.dart';
import 'package:pakistan_universities_admission/models/university/university.dart';
import 'package:pakistan_universities_admission/pages/all_degrees.dart';
import 'package:pakistan_universities_admission/pages/universities.dart';
import 'package:pakistan_universities_admission/widgets/radio_row.dart';

class FindPage extends StatefulWidget {
  final int optionChoosedFromHome;

  const FindPage({this.optionChoosedFromHome});

  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  List<Step> _stepList;

  int _currentStep = 0;
  bool _isStepComplete = false;

  int _qualificationRadioGroupValue = -1;
  double _qualificationPercentage = 0.0;
  String _degreeRadioGroupValue;

  final _percentageController = TextEditingController();
  final _percentageFormKey = GlobalKey<FormState>();

  List<RadioModel> _degreeList;
  List<University> _universityList = [];

  @override
  void dispose() {
    _percentageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.optionChoosedFromHome == 0) {
      _stepList = [
        Step(
          isActive: _currentStep == 0 ? true : false,
          state: _currentStep == 0 ? StepState.editing : StepState.indexed,
          title: _stepTitleWidget(text: 'Whats is your last qualification?'),
          content: _lastQualificationListWidget(),
        ),
        Step(
          isActive: _currentStep == 1 ? true : false,
          state: _currentStep == 1 ? StepState.editing : StepState.indexed,
          title: _stepTitleWidget(text: 'What percentage you get?'),
          content: _peratgeTextFeildWidget(),
        ),
        Step(
          isActive: _currentStep == 2 ? true : false,
          state: _currentStep == 2 ? StepState.editing : StepState.indexed,
          title: _stepTitleWidget(text: 'What degree you want to do?'),
          content: _degreeListWidget(),
        ),
        // Step(
        //   isActive: _currentStep == 3 ? true : false,
        //   state: _currentStep == 3 ? StepState.editing : StepState.indexed,
        //   title: _stepTitleWidget(text: 'Which university you want to go?'),
        //   content: _universityListWidget(),
        // ),
      ];
    } else if (widget.optionChoosedFromHome == 1) {
      _stepList = [
        Step(
          isActive: _currentStep == 0 ? true : false,
          state: _currentStep == 0 ? StepState.editing : StepState.indexed,
          title:
              _stepTitleWidget(text: 'What is catergory of your last degree?'),
          content: _degreeListWidget(),
        ),
      ];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Find University'),
      ),
      body: Stepper(
        steps: _stepList,
        currentStep: _currentStep,
        onStepTapped: (index) => _selectStep(index),
        onStepContinue: _continueStep,
        onStepCancel: _cancelStep,
      ),
    );
  }

  _continueStep() {
    if (_currentStep == 1) {
      if (_percentageController.text.isEmpty) {
        _selectStep(_currentStep + 1);
      } else {
        if (_percentageFormKey.currentState.validate()) {
          setState(() {
            _qualificationPercentage = double.parse(_percentageController.text);
            _selectStep(_currentStep + 1);
          });
        }
      }
    } else if (_currentStep == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              UniversitiesPage(universityList: _universityList),
        ),
      );
    } else {
      _currentStep + 1 != _stepList.length
          ? _selectStep(_currentStep + 1)
          : setState(
              () {
                _isStepComplete = true;
              },
            );
    }
  }

  _selectStep(int index) => setState(() {
        _currentStep = index;
        print('current indecx: $_currentStep');
      });

  _cancelStep() {
    if (_currentStep > 0) _selectStep(_currentStep - 1);
  }

  _generateDegreeList() {
    List<Degree> degreeList = [];

    switch (_qualificationRadioGroupValue) {
      case 0:
        if (_qualificationPercentage >= 45.0) {
          degreeList.add(BachelorDegrees.bba);
        }
        if (_qualificationPercentage >= 50.0) {
          degreeList.add(BachelorDegrees.bscs);
          degreeList.add(BachelorDegrees.bsse);
        }
        if (_qualificationPercentage >= 60.0) {
          degreeList.add(BachelorDegrees.bee);
          degreeList.add(BachelorDegrees.bsee);
        }
        break;
      case 1:
        if (_qualificationPercentage >= 50.0) {
          degreeList.add(BachelorDegrees.pharmD);
          degreeList.add(BachelorDegrees.mbbs);
          degreeList.add(BachelorDegrees.bscn);
        }
        break;
    }

    degreeList.sort();

    _degreeList = [];

    for (var degree in degreeList) {
      _degreeList.add(RadioModel(
          title: degree.name,
          value: degree.key,
          groupValue: _degreeRadioGroupValue));
    }
  }

  _generateUniversityList() {
    DefaultAssetBundle.of(context)
        .loadString('assets/verified_universities.json')
        .then((value) {
      var parsedJson = json.decode(value.toString());

      _universityList = [];

      for (var json in parsedJson) {
        var university = University.fromJson(json);

        if (university.degreeList.contains(_degreeRadioGroupValue)) {
          print('${university.name} have selected $_degreeRadioGroupValue');
          _universityList.add(university);
        } else {
          print('${university.name} have not selected $_degreeRadioGroupValue');
        }
      }

      if (_universityList != null) _universityList.sort();
    });
  }

  Widget _stepTitleWidget({String text}) => Text(
        text,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontSize: Theme.of(context).textTheme.subtitle1.fontSize,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _lastQualificationListWidget() {
    List<String> qualificationList = [
      'Pre-Engineering',
      'Pre-Medical',
      'Information Computer Science',
      'Commerce',
    ];

    List<RadioModel> list = qualificationList
        .map((value) => RadioModel(
            value: qualificationList.indexOf(value),
            title: value,
            groupValue: _qualificationRadioGroupValue))
        .toList();

    return Column(
        children: list
            .map((qualification) => _radioCardWidget(
                  radioModel: qualification,
                  onChanged: (value) => setState(() {
                    _qualificationRadioGroupValue = value;
                  }),
                ))
            .toList());
  }

  Widget _peratgeTextFeildWidget() {
    if (_qualificationRadioGroupValue == -1) {
      return _errorCardWidget("Fist select your last qualification");
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _percentageFormKey,
          child: TextFormField(
            controller: _percentageController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your percentage',
                hintText: '88 or 88.00'),
            validator: (value) {
              var percentage = double.parse(value);

              if (percentage == null)
                return 'please enter your percentage';
              else if (percentage < 0)
                return 'Negative percentage is not allowed';
              else if (percentage == 0) return 'Zero can\'t be percentage';

              return null;
            },
          ),
        ),
      );
    }
  }

  Widget _degreeListWidget() {
    _generateDegreeList();

    if (_qualificationRadioGroupValue < 0) {
      return _errorCardWidget('First enter your last qualification percentage');
    } else if (_degreeList == null || _degreeList.isEmpty) {
      return _errorCardWidget('Right now no degree available');
    } else {
      return Column(
          children: _degreeList
              .map(
                (degree) => _radioCardWidget(
                  radioModel: degree,
                  onChanged: (value) {
                    setState(() {
                      _degreeRadioGroupValue = value;
                      _generateUniversityList();
                    });
                  },
                ),
              )
              .toList());
    }
  }

  Widget _radioCardWidget({RadioModel radioModel, ValueChanged onChanged}) {
    return Card(
        child: RadioRow(
      radioModel: radioModel,
      onChanged: onChanged,
    ));
  }

  Widget _errorCardWidget(String errorText) => Card(
        color: Colors.red[400],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: Text(
            errorText,
            style: TextStyle(color: Colors.white),
          )),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:pakistan_universities_admission/models/radio_model.dart';

class RadioRow extends StatelessWidget {
  final RadioModel radioModel;
  final ValueChanged onChanged;

  const RadioRow({this.radioModel, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: radioModel.value,
          groupValue: radioModel.groupValue,
          onChanged: onChanged,
        ),
        Text(
          radioModel.title,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: Theme.of(context).textTheme.subtitle2.fontSize,
          ),
        )
      ],
    );
  }
}

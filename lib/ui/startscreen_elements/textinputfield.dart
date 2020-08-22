import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mastermind/ui/ui_contants.dart';

class TextInputField extends StatefulWidget {
  final String title;
  final StreamController<dynamic> stream;
  TextInputField(this.title, this.stream);

  @override
  State<StatefulWidget> createState() => _TextInputFieldState(title, stream);
}

class _TextInputFieldState extends State<TextInputField> {
  final String title;
  final StreamController<dynamic> stream;
  _TextInputFieldState(this.title, this.stream);

  String value = defaultTrials;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: size * 15 / 360),
        ),
        Container(
          width: size * 30 / 360,
          child: TextField(
            keyboardType: TextInputType.numberWithOptions(),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'^[1-9][0-9]?'),
              ),
            ],
            decoration: InputDecoration(
              hintText: defaultTrials,
            ),
            textAlignVertical: TextAlignVertical(y: 0.0),
            expands: false,
            enableInteractiveSelection: false,
            onChanged: (value) {
              this.value = value;
              if (value == '') {
                this.value = defaultTrials;
              }
              stream.add(int.parse(this.value));
            },
          ),
        ),
      ],
    );
  }
}

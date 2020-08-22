import 'package:flutter/material.dart';
import 'dart:async';

class CheckBar extends StatefulWidget {
  final String title;
  final StreamController<dynamic> stream;
  final bool defaultValue;
  CheckBar(this.title, this.defaultValue, this.stream);

  @override
  _CheckBarState createState() => _CheckBarState(title, defaultValue, stream);
}

class _CheckBarState extends State<CheckBar> {
  final String title;
  final StreamController<dynamic> stream;
  final bool defaultValue;
  bool value;
  _CheckBarState(this.title, this.defaultValue, this.stream) {
    value = defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: size * 60 / 360,
          height: 0,
        ),
        Checkbox(
          value: value,
          onChanged: (bool value) {
            setState(() {
              stream.add(value);
              this.value = value;
            });
          },
        ),
        Text(title, style: TextStyle(fontSize: size * 15 / 360)),
      ],
    );
  }
}

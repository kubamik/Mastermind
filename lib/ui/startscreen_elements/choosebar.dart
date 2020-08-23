import 'package:flutter/material.dart';
import 'dart:async';

class ChooseBar extends StatefulWidget {
  final String title;
  final List<int> items;
  final StreamController<dynamic> stream;
  ChooseBar(this.title, this.items, this.stream);

  @override
  _ChooseBarState createState() => _ChooseBarState(title, items, stream);
}

class _ChooseBarState extends State<ChooseBar> {
  final String title;
  final List<int> items;
  final StreamController<dynamic> stream;
  int value;
  _ChooseBarState(this.title, this.items, this.stream) {
    value = items[0];
  }

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
        DropdownButton<int>(
          items: items.map<DropdownMenuItem<int>>(
            (value) {
              return DropdownMenuItem<int>(
                child: Text(value.toString()),
                value: value,
              );
            },
          ).toList(),
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          onChanged: (value) {
            setState(() {
              this.value = value;
              stream.add(value);
            });
          },
          icon: Icon(Icons.arrow_drop_down),
          value: value,
        ),
      ],
    );
  }
}

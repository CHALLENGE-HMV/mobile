import 'package:flutter/material.dart';

class YearPicker extends StatefulWidget {
  final int currentYear;

  const YearPicker({Key? key, required this.currentYear}) : super(key: key);

  @override
  _YearPickerState createState() => _YearPickerState();
}

class _YearPickerState extends State<YearPicker> {
  @override
  Widget build(BuildContext context) {
    List<int> years = [];
    for (int i = widget.currentYear - 5; i <= widget.currentYear + 1; i++) {
      years.add(i);
    }

    int selectedValue = widget.currentYear;

    return DropdownButton<int>(
        items: years.map((int year) {
      return DropdownMenuItem(
        child: Text(year.toString()),
        value: year,
      );
    }).toList(),
    value: selectedValue,
    onChanged: (newVal) {
          setState(() {
            selectedValue = newVal!;
          });
    },);
  }
}

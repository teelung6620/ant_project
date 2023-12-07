import 'package:flutter/material.dart';

class DropdownYears extends StatefulWidget {
  const DropdownYears({Key? key}) : super(key: key);

  @override
  _DropdownYearsState createState() => _DropdownYearsState();
}

class _DropdownYearsState extends State<DropdownYears> {
  String dropdownvalue = 'Item 1';
  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      // Initial Value
      value: dropdownvalue,

      // Down Arrow Icon
      icon: const Icon(Icons.keyboard_arrow_down),

      // Array list of items
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      // After selecting the desired option,it will
      // change button value to selected value
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
    );
  }
}

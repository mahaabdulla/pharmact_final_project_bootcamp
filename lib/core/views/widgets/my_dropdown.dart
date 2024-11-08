import 'package:flutter/material.dart';

class MyDropdown extends StatefulWidget {
  const MyDropdown({super.key});

  @override
  _MyDropdownState createState() => _MyDropdownState();
}

class _MyDropdownState extends State<MyDropdown> {
  int? selectedValue; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown Example'),
      ),
      body: Center(
        child: DropdownButton<int>(
          value: selectedValue, 
          hint: Text('اختر رقمًا'), 
          items: List.generate(10, (index) {
            return DropdownMenuItem<int>(
              value: index + 1, 
              child: Text((index + 1).toString()), 
            );
          }),
          onChanged: (int? newValue) {
            setState(() {
              selectedValue = newValue; 
            });
          },
        ),
      ),
    );
  }
}
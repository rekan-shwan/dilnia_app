import 'package:flutter/material.dart';

class CityDropdown extends StatefulWidget {
  const CityDropdown({super.key});
  @override
  _CityDropdownState createState() => _CityDropdownState();
}

class _CityDropdownState extends State<CityDropdown> {
  String? selectedCity; // to hold selected value

  final List<String> cities = ["Erbil", "Baghdad"];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedCity,
      hint: Text("Select City"),
      items: cities.map((city) {
        return DropdownMenuItem(
          value: city,
          child: Text(city),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedCity = value;
        });
      },
    );
  }
}

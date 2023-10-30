import 'package:flutter/material.dart';
import 'package:studentlogin/services/api_functions.dart';

class AcademicYearDropdown extends StatefulWidget {
  const AcademicYearDropdown({super.key});

  @override
  DropdownButtonState createState() => DropdownButtonState();
}

class DropdownButtonState extends State<AcademicYearDropdown> {
  String? selectedAcademicYear;
  List<String> academicYears = [];

  @override
  void initState() {
    super.initState();
    fetchAcademicYears().then((years) {
      setState(() {
        academicYears = years;
        if (academicYears.isNotEmpty) {
          selectedAcademicYear = academicYears[0];
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: const Text("start-end"),
      value: selectedAcademicYear,
      items: academicYears.map((String year) {
        return DropdownMenuItem<String>(
          value: year,
          child: Text(year),
        );
      }).toList(),
      onChanged: (String? year) {
        setState(() {
          selectedAcademicYear = year;
        });
      },
    );
  }
}




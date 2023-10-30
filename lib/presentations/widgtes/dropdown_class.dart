// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DropDownClassButton extends StatefulWidget {
  const DropDownClassButton({Key? key}) : super(key: key);

  @override
  State<DropDownClassButton> createState() => _DropDownClassButtonState();
}

class _DropDownClassButtonState extends State<DropDownClassButton> {
  String? selectedValue;
  List<String> courseList = [];

  @override
  void initState() {
    super.initState();
    fetchData(); 
  }

  Future<void> fetchData() async {
    const String url =
        'https://llabdemo.orell.com/api/masters/anonymous/getAllClassList';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> data = {
      'institutionId': 32,
      'academicYearId':
          '93', 
    };

    final String requestBody = jsonEncode(data);

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: requestBody,
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        List<String> courseList = responseData.map((item) {
          return item['course']
              .toString(); 
        }).toList();
        log(courseList.toString());
        setState(() {
          this.courseList = courseList;
          selectedValue = courseList.isNotEmpty ? courseList[0] : null;
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response data: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: const Text("Course"),
      value: selectedValue,
      items: courseList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedValue = newValue;
        });
      },
    );
  }
}

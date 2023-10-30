// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

Future<List<String>> fetchAcademicYears() async {
  final response = await http.get(Uri.parse(
      'https://llabdemo.orell.com/api/masters/anonymous/getAcademicYear/32'));

  if (response.statusCode == 200) {
    final List<dynamic> academicYearsData = json.decode(response.body);

    List<String> academicYears = academicYearsData
        .map((item) => item['academicYear'].toString())
        .toList();

    log(academicYears.toString());

    return academicYears;
  } else {
    throw Exception('Failed to load academic years');
  }
}

//==============Course=============//

Future<void> makePostRequest() async {
  const String url =
      'https://llabdemo.orell.com/api/masters/anonymous/getAllClassList';
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  final Map<String, dynamic> data = {
    'institutionId': 32,
    'academicYearId': '93',
  };

  final String requestBody = jsonEncode(data);

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: requestBody,
    );

    if (response.statusCode == 200) {
      print('Response data: ${response.body}');
      log(response.toString());
    } else {
      print('Request failed with status: ${response.statusCode}');
      print('Response data: ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

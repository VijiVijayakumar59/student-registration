// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:studentlogin/model/form_model.dart';

Future<void> saveUser(FormModel model) async {
  const String apiUrl =
      "https://llabdemo.orell.com/api/userService/anonymous/saveUser";

  Map<String, dynamic> data = {
    "academicYearId": "93",
    "address": model.address,
    "createdBy": "poonam.orell1",
    "emailId": model.email,
    "image": "",
    "institutionId": 32,
    "mobileCode": "",
    "mobileNo": model.mobile,
    "modifiedBy": "poonam.orell1",
    "name": model.name,
    "password": model.password,
    "status": "N",
    "userClassDetailsList": [
      {"userClassId": 0, "userId": "0", "classId": "793"}
    ],
    "classId": "793",
    "userClassId": 0,
    "userId": "0",
    "userCoduserType": "STUDENT",
    "whatsappCodee": "sarish.orell1",
    "": "",
    "whatsappNo": model.whatsappNumber
  };

  final response =
      await http.post(Uri.parse(apiUrl), body: jsonEncode(data), headers: {
    "Content-Type": "application/json",
  });

  if (response.statusCode == 500) {
    print("User saved successfully.");
  } else {
    print("Failed to save user. Status code: ${response.statusCode}");
    print(response.body);
  }
}

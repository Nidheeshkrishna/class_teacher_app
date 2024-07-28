import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:machine_test_hamon/features/student/data/models/Student_list_model.dart';
import 'package:machine_test_hamon/features/subjects/data/models/subject_list_model.dart';

 
  @override
Future<List<Subject>> getSubjects() async {
  final response = await http.get(Uri.parse(
      'https://nibrahim.pythonanywhere.com/subjects/?api_key=57cDa')); // Replace with your actual URL and API key
  if (response.statusCode == 200) {
    final decodedData = jsonDecode(response.body);
    if (decodedData is List) {
      // Check if the response is a list
      return decodedData
          .map((studentData) => Subject.fromJson(studentData))
          .toList();
    } else {
      throw Exception('Invalid response format: Expected a list of students.');
    }
  } else {
    throw Exception(
        'Failed to load students: Status code ${response.statusCode}');
  }
}




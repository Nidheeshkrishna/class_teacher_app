import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:machine_test_hamon/features/student/data/models/Student_list_model.dart';
import 'package:machine_test_hamon/features/student/data/repositries/student_repositorty.dart';

class StudentRepositoryImpl implements StudentRepository {
  final String baseUrl =
      'https://nibrahim.pythonanywhere.com/students/?api_key=57cDa'; // Replace with your actual URL and API key (**remember to replace for security reasons**)

  @override
  Future<List<Student>> getStudents() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      if (decodedData is Map<String, dynamic>) {
        final studentList = decodedData['students'] as List;
        return studentList
            .map((studentData) => Student.fromJson(studentData))
            .toList();
      } else {
        throw Exception(
            'Invalid response format: Expected a map with "students" key');
      }
    } else {
      throw Exception(
          'Failed to load students: Status code ${response.statusCode}');
    }
  }
}

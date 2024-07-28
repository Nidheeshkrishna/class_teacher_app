import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:machine_test_hamon/features/subjects/data/models/subject_list_model.dart';
import 'package:machine_test_hamon/features/subjects/data/repositries/subject_repositorty.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  final String baseUrl =
      'https://nibrahim.pythonanywhere.com/subjects/?api_key=57cDa'; // Replace with your actual URL and API key (**remember to replace for security reasons**)

  @override
  Future<List<Subject>> getSubjects() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body);
      if (decodedData is Map<String, dynamic>) {
        final subjectList = decodedData['subjects'] as List;
        return subjectList
            .map((subjectData) => Subject.fromJson(subjectData))
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

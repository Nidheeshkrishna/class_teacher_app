import 'package:machine_test_hamon/features/student/data/models/Student_list_model.dart';

abstract class StudentRepository {
  Future<List<Student>> getStudents();
}

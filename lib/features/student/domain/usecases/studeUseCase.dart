import 'package:machine_test_hamon/features/student/data/models/Student_list_model.dart';
import 'package:machine_test_hamon/features/student/data/repositries/student_repositorty.dart';

class GetStudents {
  final StudentRepository repository;

  GetStudents(this.repository);

  Future<List<Student>> call() async {
    return await repository.getStudents();
  }
}

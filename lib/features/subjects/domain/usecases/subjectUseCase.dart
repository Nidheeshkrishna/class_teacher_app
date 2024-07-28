import 'package:machine_test_hamon/features/student/data/models/Student_list_model.dart';
import 'package:machine_test_hamon/features/student/data/repositries/student_repositorty.dart';
import 'package:machine_test_hamon/features/subjects/data/models/subject_list_model.dart';
import 'package:machine_test_hamon/features/subjects/domain/repositories/subjectRepository.dart';

class GetSubjects {
  final SubjectRepositoryImpl repository;

  GetSubjects(this.repository);

  Future<List<Subject>> call() async {
    return await repository.getSubjects();
  }
}

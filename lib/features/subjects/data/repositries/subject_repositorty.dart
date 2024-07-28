import 'package:machine_test_hamon/features/subjects/data/models/subject_list_model.dart';

abstract class SubjectRepository {
  Future<List<Subject>> getSubjects();
}

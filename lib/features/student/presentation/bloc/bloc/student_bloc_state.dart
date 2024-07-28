import 'package:machine_test_hamon/features/student/data/models/Student_list_model.dart';

class StudentError extends StudentState {
  final String message;

  StudentError(this.message);
}

class StudentLoading extends StudentState {}

class StudentsLoaded extends StudentState {
  final List<Student> students;

  StudentsLoaded(this.students);
}

abstract class StudentState {}

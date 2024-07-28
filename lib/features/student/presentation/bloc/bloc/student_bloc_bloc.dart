import 'package:bloc/bloc.dart';
import 'package:machine_test_hamon/features/student/data/repositries/student_repositorty.dart';
import 'package:machine_test_hamon/features/student/domain/usecases/studeUseCase.dart';
import 'package:machine_test_hamon/features/student/presentation/bloc/bloc/student_bloc_state.dart';
import 'package:meta/meta.dart';

part 'student_bloc_event.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final StudentRepository studentRepository;

  StudentBloc(this.studentRepository) : super(StudentLoading()) 
 {
    on<GetStudents>((event, emit) async {
      try {
        final students = await studentRepository.getStudents();
        emit(StudentsLoaded(students));
      } on Exception catch (e) {
        emit(StudentError(e.toString()));
      }
    });
  }
}

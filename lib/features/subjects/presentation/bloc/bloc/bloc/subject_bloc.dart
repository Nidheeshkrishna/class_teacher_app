import 'package:bloc/bloc.dart';
import 'package:machine_test_hamon/features/subjects/data/models/subject_list_model.dart';
import 'package:machine_test_hamon/features/subjects/data/repositries/subject_repositorty.dart';
import 'package:meta/meta.dart';

part 'subject_event.dart';
part 'subject_state.dart';

class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  final SubjectRepository subjectRepository;

  SubjectBloc(this.subjectRepository) : super(SubjectLoading()) {
    on<GetSubject>((event, emit) async {
      emit(SubjectLoading());
      try {
        final subjects = await subjectRepository.getSubjects();
        emit(SubjectsLoaded(subjects));
      } catch (e) {
        emit(SubjectError(e.toString()));
      }
    });
  }
}

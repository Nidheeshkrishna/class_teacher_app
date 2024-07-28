part of 'subject_bloc.dart';

@immutable
sealed class SubjectState {}

final class SubjectInitial extends SubjectState {}

class SubjectError extends SubjectState {
  final String message;

  SubjectError(this.message);
}

class SubjectLoading extends SubjectState {}

class SubjectsLoaded extends SubjectState {
  final List<Subject> subjects;

  SubjectsLoaded(this.subjects);
}

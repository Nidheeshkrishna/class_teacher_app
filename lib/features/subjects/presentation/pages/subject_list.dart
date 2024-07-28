import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test_hamon/features/subjectDetails/presentation/pages/subject_info.dart';
import 'package:machine_test_hamon/features/subjects/presentation/bloc/bloc/bloc/subject_bloc.dart';

class SubjectsPage extends StatelessWidget {
  const SubjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subjects'),
      ),
      body: BlocBuilder<SubjectBloc, SubjectState>(
        builder: (context, state) {
          if (state is SubjectLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SubjectsLoaded) {
            final subjects = state.subjects;
            return ListView.builder(
              itemCount: subjects.length,
              itemBuilder: (context, index) {
                final subject = subjects[index];
                return InkWell(
                  onTap: () {
                     Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SubjectDetailsScreen(
                              name: subject.name!,
                              age: subject.credits!,
                              email: subject.teacher!,
                              profileImageUrl:
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy1QKMwvvFRtE7kNDp0oyv8e5k39uBdPxbbg&s",
                            ),
                          ),
                        );
                  },
                  child: Card(
                    color: const Color.fromARGB(255, 206, 198, 198),
                    child: ListTile(
                      title: Text(subject.name!),
                      subtitle: Text(' ${subject.teacher}'),
                      trailing: Column(
                        children: [
                          Text("${subject.credits}"),
                          const Text("Credit")
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is SubjectError) {
            return Center(child: Text(state.message));
          } else {
            return Container(); // Handle unexpected state
          }
        },
      ),
    );
  }
}

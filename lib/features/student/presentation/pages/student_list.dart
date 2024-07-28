// lib/presentation/pages/students_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test_hamon/features/student/presentation/bloc/bloc/student_bloc_bloc.dart';
import 'package:machine_test_hamon/features/student/presentation/bloc/bloc/student_bloc_state.dart';
import 'package:machine_test_hamon/features/studentsDetails/presentation/pages/student_info.dart';

class StudentsPage extends StatelessWidget {
  const StudentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: BlocBuilder<StudentBloc, StudentState>(
        builder: (context, state) {
          if (state is StudentLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StudentsLoaded) {
            final students = state.students;
            return ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Card(
                    color: const Color.fromARGB(255, 206, 198, 198),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentDetailScreen(
                              name: student.name,
                              age: student.age,
                              email: student.email,
                              profileImageUrl:
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy1QKMwvvFRtE7kNDp0oyv8e5k39uBdPxbbg&s",
                            ),
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(student.name),
                        subtitle: Text(student.email),
                        trailing: Text("Age: ${student.age.toString()}"),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is StudentError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:machine_test_hamon/features/home/presentation/pages/home_page.dart';
import 'package:machine_test_hamon/features/student/domain/repositories/StudentRepository.dart';
import 'package:machine_test_hamon/features/student/presentation/bloc/bloc/student_bloc_bloc.dart';
import 'package:machine_test_hamon/features/subjects/domain/repositories/subjectRepository.dart';
import 'package:machine_test_hamon/features/subjects/presentation/bloc/bloc/bloc/subject_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                StudentBloc(StudentRepositoryImpl())..add(GetStudents())),
        BlocProvider(
            create: (context) =>
                SubjectBloc(SubjectRepositoryImpl())..add(GetSubject())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}

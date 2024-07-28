import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:machine_test_hamon/core/utils/colors.dart';
import 'package:machine_test_hamon/features/student/presentation/pages/student_list.dart';
import 'package:machine_test_hamon/features/subjects/presentation/pages/subject_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGridView = true;

  final List<Map<String, dynamic>> items = [
    {
      'id': 1,
      'icon': FontAwesomeIcons.graduationCap,
      'icon_color': AppColors.iconcolor1,
      'title': 'Students',
      'color': AppColors.menucolor1
    },
    {
      'id': 2,
      'icon': Icons.book,
      'icon_color': AppColors.iconcolor2,
      'title': 'Subjects',
      'color': AppColors.menucolor2
    },
    {
      'id': 3,
      'icon': Icons.class_,
      'icon_color': AppColors.iconcolor3,
      'title': 'Class Rooms',
      'color': AppColors.menucolor3
    },
    {
      'id': 4,
      'icon': Icons.edit,
      'icon_color': AppColors.iconcolor4,
      'title': 'Registration',
      'color': AppColors.menucolor4
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello,'),
            Text('Good Morning'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(isGridView ? Icons.list : Icons.grid_on),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
        ],
      ),
      body: isGridView
          ? Padding(
              padding:
                  EdgeInsets.only(top: size.height * .10, left: 10, right: 10),
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  final size = MediaQuery.of(context).size; // Get screen size

                  return InkWell(
                    onTap: () {
                      if (item['id'] == 1) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StudentsPage(),
                          ),
                        );
                      }

                      if (item['id'] == 2) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SubjectsPage(),
                          ),
                        );
                      }
                    },
                    child: Card(
                      color: item['color'],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: SizedBox(
                        width: size.width * .50,
                        //color: item['color'],
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                item['icon'],
                                size: 48,
                                color: item['icon_color'],
                              ),
                              Text(item['title']),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio:
                      2 / 2.5, // Adjust the aspect ratio as needed
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ), // Number of columns
              ),
            )
          : Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: size.height * .20, left: 10, right: 10),
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Adjust the radius as needed
                        ),
                        leading: Icon(item['icon'], color: item['icon_color']),
                        title: Text(item['title']),
                        tileColor: item['color'],
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}

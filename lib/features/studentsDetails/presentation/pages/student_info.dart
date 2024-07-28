import 'package:flutter/material.dart';

class StudentDetailScreen extends StatelessWidget {
  final String name;
  final int age;
  final String email;
  final String profileImageUrl; // Replace with your image URL

  const StudentDetailScreen({
    super.key,
    required this.name,
    required this.age,
    required this.email,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Detail'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profileImageUrl),
              // Replace with your image URL
            ),
            const SizedBox(height: 16),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Age: $age'),
            const SizedBox(height: 8),
            Text(email),
          ],
        ),
      ),
    );
  }
}

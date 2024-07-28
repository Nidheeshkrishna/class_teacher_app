class Student {
  final String name;
  final String email;
  final int age;

  Student({
    required this.name,
    required this.email,
    required this.age,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      name: json['name'],
      email: json['email'],
      age: json['age'],
    );
  }
}

// To parse this JSON data, do
//
//     final subjectListData = subjectListDataFromJson(jsonString);

import 'dart:convert';

SubjectListData subjectListDataFromJson(String str) => SubjectListData.fromJson(json.decode(str));

String subjectListDataToJson(SubjectListData data) => json.encode(data.toJson());

class SubjectListData {
    List<Subject>? subjects;

    SubjectListData({
        this.subjects,
    });

    factory SubjectListData.fromJson(Map<String, dynamic> json) => SubjectListData(
        subjects: json["subjects"] == null ? [] : List<Subject>.from(json["subjects"]!.map((x) => Subject.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x.toJson())),
    };
}

class Subject {
    int? credits;
    int? id;
    String? name;
    String? teacher;

    Subject({
        this.credits,
        this.id,
        this.name,
        this.teacher,
    });

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        credits: json["credits"],
        id: json["id"],
        name: json["name"],
        teacher: json["teacher"],
    );

    Map<String, dynamic> toJson() => {
        "credits": credits,
        "id": id,
        "name": name,
        "teacher": teacher,
    };
}

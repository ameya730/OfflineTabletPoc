// To parse this JSON data, do
//
//     final subjects = subjectsFromMap(jsonString);

import 'dart:convert';

List<Subjects> subjectsFromMap(String str) =>
    List<Subjects>.from(json.decode(str).map((x) => Subjects.fromMap(x)));

String subjectsToMap(List<Subjects> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Subjects {
  Subjects({
    this.subjectName,
    this.iconPath,
    this.chapters,
  });

  final String? subjectName;
  final String? iconPath;
  final List<Chapter>? chapters;

  factory Subjects.fromMap(Map<String, dynamic> json) => Subjects(
        subjectName: json["subjectName"],
        iconPath: json["iconPath"],
        chapters:
            List<Chapter>.from(json["chapters"].map((x) => Chapter.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "subjectName": subjectName,
        "iconPath": iconPath,
        "chapters": List<dynamic>.from(chapters!.map((x) => x.toMap())),
      };
}

class Chapter {
  Chapter({
    this.chapterName,
  });

  final String? chapterName;

  factory Chapter.fromMap(Map<String, dynamic> json) => Chapter(
        chapterName: json["chapterName"],
      );

  Map<String, dynamic> toMap() => {
        "chapterName": chapterName,
      };
}

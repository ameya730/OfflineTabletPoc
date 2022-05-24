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
    this.videos,
    this.pdfs,
  });

  final String? chapterName;
  final List<Video>? videos;
  final Pdfs? pdfs;

  factory Chapter.fromMap(Map<String, dynamic> json) => Chapter(
        chapterName: json["chapterName"],
        videos: json["videos"] == null
            ? null
            : List<Video>.from(json["videos"].map((x) => Video.fromMap(x))),
        pdfs: json["pdfs"] == null ? null : Pdfs.fromMap(json["pdfs"]),
      );

  Map<String, dynamic> toMap() => {
        "chapterName": chapterName,
        "videos": videos == null
            ? null
            : List<dynamic>.from(videos!.map((x) => x.toMap())),
        "pdfs": pdfs == null ? null : pdfs!.toMap(),
      };
}

class Pdfs {
  Pdfs({
    this.pdfName,
    this.pdfPath,
  });

  final String? pdfName;
  final String? pdfPath;

  factory Pdfs.fromMap(Map<String, dynamic> json) => Pdfs(
        pdfName: json["pdfName"],
        pdfPath: json["pdfPath"],
      );

  Map<String, dynamic> toMap() => {
        "pdfName": pdfName,
        "pdfPath": pdfPath,
      };
}

class Video {
  Video({
    this.videoName,
    this.videoPath,
    this.thumbNailPath,
  });

  final String? videoName;
  final String? videoPath;
  final String? thumbNailPath;

  factory Video.fromMap(Map<String, dynamic> json) => Video(
        videoName: json["videoName"],
        videoPath: json["videoPath"],
        thumbNailPath: json["thumbNailPath"],
      );

  Map<String, dynamic> toMap() => {
        "videoName": videoName,
        "videoPath": videoPath,
        "thumbNailPath": thumbNailPath,
      };
}

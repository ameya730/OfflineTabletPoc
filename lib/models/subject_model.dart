class Subjects {
  final String? subjects;
  final List<Chapters>? chapters;
  bool? isExpanded;
  Subjects({
    this.subjects,
    this.chapters,
    this.isExpanded,
  });
}

class Chapters {
  final String? chapterName;
  final String? videoName;
  final String? videoPath;
  final String? pdfName;
  final String? pdfPath;
  final bool? isExpanded;

  Chapters({
    this.chapterName,
    this.videoName,
    this.videoPath,
    this.pdfName,
    this.pdfPath,
    this.isExpanded,
  });
}

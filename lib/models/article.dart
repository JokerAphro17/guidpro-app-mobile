import 'dart:ffi';

class Advice {
  final String id;
  final int budget;
  final String description;
  final String title;
  final String coverUrl;
  final String createdAt;
  final String updatedAt;
  final String publishedAt;
  // tables of sections
  final List<Section> sections;

  Advice({
    required this.id,
    required this.budget,
    required this.description,
    required this.title,
    required this.coverUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.sections,
  });

  // obs

  factory Advice.fromJson(Map<String, dynamic> json) {
    return Advice(
      id: json['id'],
      budget: json['budget'],
      description: json['description'],
      title: json['title'],
      coverUrl: json['coverUrl'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      publishedAt: json['publishedAt'],
      sections: json['sections'].map<Section>((section) => Section.fromJson(section)).toList(),
    );
  }

}

class Section {
  final String id;
  final String title;
  final String description;
  final String createdAt;
  final String updatedAt;

  Section({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

}
class TitlesClass {
  String id;
  final String title;
  final String type;

  TitlesClass({
    this.id = "",
    required this.title,
    required this.type
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'type': type
  };

  static TitlesClass fromJson(Map<String, dynamic> json) => TitlesClass(
    id: json["id"],
    title: json["title"],
    type: json["type"],
  );
}
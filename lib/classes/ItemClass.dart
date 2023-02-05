class ItemClass {
  String id;
  final String title;
  final String type;
  // final String image

  ItemClass({
    this.id = "",
    required this.title,
    required this.type,
    // required this.image
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'type': type
  };

  static ItemClass fromJson(Map<String, dynamic> json) => ItemClass(
    id: json["id"],
    title: json["title"],
    type: json["type"],

  );
}
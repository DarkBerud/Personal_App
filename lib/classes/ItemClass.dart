class ItemClass {
  String id;
  final String name;
  final num cost;
  final String image;
  final num quantify;

  ItemClass({
    this.id = "",
    required this.name,
    required this.cost,
    required this.image,
    required this.quantify,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'cost': cost,
    'quantify': quantify,
    'image': image,
  };

  static ItemClass fromJson(Map<String, dynamic> json) => ItemClass(
    id: json["id"],
    name: json["name"],
    cost: json["cost"],
    image: json["image"],
    quantify: json["quantify"]

  );
}
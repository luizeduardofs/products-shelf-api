class ProductModel {
  final int id;
  final String name;
  final List<String> tags;

  ProductModel({required this.id, required this.name, required this.tags});

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      name: map['name'] as String,
      tags: List<String>.from(
        (map['tags'] as List<String>),
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'tags': tags,
    };
  }
}

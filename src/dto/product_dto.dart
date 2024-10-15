import 'dart:convert';

class ProductDto {
  final int? id;
  final String? name;
  final List<String>? tags;

  ProductDto({this.id, this.name, this.tags});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'tags': tags,
    };
  }

  factory ProductDto.fromMap(Map<String, dynamic> map) {
    return ProductDto(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      tags: map['tags'] != null ? List<String>.from(map['tags']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductDto.fromJson(String source) =>
      ProductDto.fromMap(json.decode(source) as Map<String, dynamic>);
}

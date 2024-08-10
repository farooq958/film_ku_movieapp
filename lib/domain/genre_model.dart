import 'dart:convert';

class GenreModel {
  final int? id;
  final String? name;

  GenreModel({
    this.id,
    this.name,
  });

  GenreModel copyWith({
    int? id,
    String? name,
  }) =>
      GenreModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory GenreModel.fromRawJson(String str) => GenreModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

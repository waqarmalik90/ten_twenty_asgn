class GenresResponse {
  List<Genres>? genres;

  GenresResponse({
    this.genres,
  });

  GenresResponse.fromJson(Map<String, dynamic> json) {
    genres = (json['genres'] as List?)?.map((dynamic e) => Genres.fromJson(e as Map<String,dynamic>)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['genres'] = genres?.map((e) => e.toJson()).toList();
    return json;
  }
}

class Genres {
  int? id;
  String? name;

  Genres({
    this.id,
    this.name,
  });

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int?;
    name = json['name'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    return json;
  }
}
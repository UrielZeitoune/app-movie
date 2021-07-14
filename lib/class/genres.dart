class Genres {
  Genres({
    this.id,
    this.name,
  });

  factory Genres.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];

    return Genres(
      id: id,
      name: name,
    );
  }

  final int? id;
  final String? name;
}

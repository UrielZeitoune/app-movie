class Movie {
  Movie({
    this.backdropPath = '',
    this.genreIds,
    this.id = 0,
    this.originalTitle = '',
    this.overview = '',
    this.posterPath = '',
    this.releaseDate,
    this.title = '',
    this.voteAverage = 0,
  });

  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  double? voteAverage;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json['release_date']),
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_title": originalTitle,
        "overview": overview,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
        "title": title,
        "vote_average": voteAverage,
      };
}

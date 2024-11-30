class MovieModel {
  final String? title;
  final String? year;
  final String? imdbId;
  final String? type;
  final String? poster;

  MovieModel({
    this.title,
    this.year,
    this.imdbId,
    this.type,
    this.poster,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        title: json["Title"] ?? "",
        year: json["Year"] ?? "",
        imdbId: json["imdbID"] ?? "",
        type: json["Type"] ?? "",
        poster: json["Poster"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "imdbID": imdbId,
        "Type": type,
        "Poster": poster,
      };
}

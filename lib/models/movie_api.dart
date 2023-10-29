part of "models.dart";

class MovieAPI {
  int page;
  String results;
  int totalPages;
  int totalResults;

  MovieAPI({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory MovieAPI.fromJson(Map<String, dynamic> json) {
    return MovieAPI(page: json["page"], results: json["results"], totalPages: json["total_pages"], totalResults: json["total_results"],);
  }
}

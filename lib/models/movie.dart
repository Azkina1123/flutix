part of "models.dart";

class Movie {
  final int id;
  final DateTime start;
  final DateTime finish;
  final String title;
  final String rating; // R19+ dkk
  final List<String> genres;
  final int duration;
  final String language;
  final String description;
  final List<String> casts;
  final String img;
  final double rate;

  Movie({
    required this.id,
    required this.start,
    required this.finish,
    required this.title,
    required this.rating,
    required this.genres,
    required this.duration,
    required this.language,
    required this.description,
    required this.casts,
    required this.img,
    this.rate = 0,
  });

}

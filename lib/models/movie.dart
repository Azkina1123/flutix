part of "models.dart";

class Movie {
  final int id;
  final DateTime? start;
  final DateTime? finish;
  final String title;
  final String rating; // R19+ dkk
  final List<dynamic>? genres;
  final int? duration;
  final String? language;
  final String? description;
  final List<Cast>? casts;
  final String img;
  final double rate;

  Movie({
    required this.id,
    this.start,
    this.finish,
    required this.title,
    required this.rating,
    this.genres,
    this.duration,
    this.language,
    this.description,
    this.casts,
    required this.img,
    this.rate = 0,
  });

  List<String> genreToList() {
    List<String> genreList = [];

    for (int i = 0; i < genres!.length; i++) {
      genreList.add(genres![i]["name"]);
    }
    return genreList;
  }

  String languageStr() {
    switch (language) {
      case 'ja':
        return "Japanese";
      case 'id':
        return "Indonesian";
      case 'ko':
        return "Korean";
      case 'en':
        return "English";
    }
    return "None";
  }
}

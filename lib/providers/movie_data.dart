part of "providers.dart";

class MovieData extends ChangeNotifier {
  final String _apiKey = "5269eac890bc54b1e79dd28305a70d6d";
  final String _imgDir = "https://image.tmdb.org/t/p/w500/";
  final List<Movie> _movies = [];

  String get imgDir {
    return _imgDir;
  }

  UnmodifiableListView get movies {
    return UnmodifiableListView(_movies);
  }



}

part of "providers.dart";

class MovieData extends ChangeNotifier {
  final String _apiKey = "5269eac890bc54b1e79dd28305a70d6d";
  final String _imgDir = "https://image.tmdb.org/t/p/w500/";


  String get imgDir {
    return _imgDir;
  }

  final Future<List<Movie>> _nowPlaying = ApiServices.getNowPlaying(8);
  
  Future<List<Movie>> get nowPlaying {
    return _nowPlaying;
  }
  
  final Future<List<Movie>> _comingSoon = ApiServices.getComingSoon(8);
  Future<List<Movie>> get comingSoon {
    return _comingSoon;
  }



}

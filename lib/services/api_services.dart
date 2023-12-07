part of "services.dart";

class ApiServices {
  static String apiKey = "5269eac890bc54b1e79dd28305a70d6d";

  static String imgDir = "https://image.tmdb.org/t/p/w500";

  static Future<List<Movie>> getNowPlaying(int count) async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/now_playing?page=3&api_key=$apiKey&adult=false"));

    List<Movie> movies = [];
    if (response.statusCode == 200) {
      var getMovies = json.decode(response.body) as Map<String, dynamic>;
      var results = getMovies["results"];
       String start = getMovies["dates"]["minimum"];
       String finish = getMovies["dates"]["maximum"];

      for (int i = 0; i < count; i++) {
        movies.add(
          Movie(
            id: results[i]["id"],
            start: DateTime.parse(start),
            finish: DateTime.parse(finish),
            title: results[i]["title"],
            rating: results[i]["adult"] ? "R19+" : "R14+",
            img: results[i]["poster_path"],
            rate: results[i]["vote_average"],
          ),
        );
      }
    }

    return movies;
  }

  static Future<List<Movie>> getComingSoon(int count) async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/upcoming?page=5&api_key=$apiKey"));

    List<Movie> movies = [];
    if (response.statusCode == 200) {
      var getMovies = json.decode(response.body) as Map<String, dynamic>;
      var results = getMovies["results"];
      String start = getMovies["dates"]["minimum"];
      String finish = getMovies["dates"]["maximum"];
      for (int i = 0; i < count; i++) {
        movies.add(
          Movie(
            id: results[i]["id"],
            start: DateTime.parse(start),
            finish: DateTime.parse(finish),
            title: results[i]["title"],
            rating: results[i]["adult"] ? "R19+" : "R14+",
            img: results[i]["poster_path"],
            rate: results[i]["vote_average"],
          ),
        );
      }
    }

    return movies;
  }

  static Future<Movie> getMovieDetails(int id) async {
    final response = await http.get(
        Uri.parse("https://api.themoviedb.org/3/movie/$id?api_key=$apiKey"));

    Movie? movie;
    if (response.statusCode == 200) {
      var getMovies = json.decode(response.body) as Map<String, dynamic>;
      // var result = getMovies["results"];

      movie = Movie(
        id: getMovies["id"],
        start: DateTime.parse(getMovies["release_date"]),
        title: getMovies["title"] ?? "",
        rating: getMovies["adult"] ? "R19+" : "R14+",
        genres: getMovies["genres"],
        duration: getMovies["runtime"],
        language: getMovies["original_language"] ?? "",
        description: getMovies["overview"] ?? "",
        casts: await getMovieCasts(id),
        img: getMovies["poster_path"] ?? "",
        rate: getMovies["vote_average"],
      );
    }

    return movie!;
  }

  static Future<List<Cast>> getMovieCasts(int id) async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/$id/credits?api_key=$apiKey"));

    List<Cast> casts = [];
    if (response.statusCode == 200) {
      var getCasts = json.decode(response.body) as Map<String, dynamic>;
      var results = getCasts["cast"];
      for (int i = 0; i < results.length; i++) {
        //         print("=!!!!!!= CAST =!!!!!=");
        // print("results");
        casts.add(
          Cast(
            id: results[i]["id"] ?? "",
            name: results[i]["name"] ?? "",
            img: results[i]["profile_path"] ?? "",
          ),
        );
      }
      // print(results);
      // var result = getMovies["results"];
    }

    return casts;
  }
}

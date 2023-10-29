part of "services.dart";

class ApiServices {
  static String apiKey = "5269eac890bc54b1e79dd28305a70d6d";

  static String imgDir = "https://image.tmdb.org/t/p/w500/";

  // static List<Movie> moviesCollection = [];

  static void getMoviesCollection() async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=5&api_key=5269eac890bc54b1e79dd28305a70d6d"));

    if (response.statusCode == 200) {
      var getMovies = json.decode(response.body) as Map<String, dynamic>;
      print(response.statusCode);
      print(getMovies);

      var results = getMovies["results"];

      for (int i = 0; i < results.length; i++) {
        // moviesCollection.add(
        movies.add(
            Movie(
          id: results[0]["id"],
          start: DateTime.utc(2023, 10, 29),
          finish: DateTime.utc(2023, 11, 05),
          title: results[0]["title"],
          rating: results[0]["adult"] ? "R19+" : "R14+",
          genres: ["BELOMM"],
          duration: 100,
          language: results[0]["original_language"],
          description: results[0]["overview"],
          casts: ["hm", "dan hm"],
          img: results[0]["poster_path"],
          rate: results[0]["vote_average"],
        )
        );
      }

    } else {
      throw Exception('Failed to load Posts');
    }
  }
}

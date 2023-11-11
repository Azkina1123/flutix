part of "pages.dart";

class MovieDetailPage extends StatefulWidget {
  int id;
  MovieDetailPage({super.key, required this.id});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    Future<Movie> movieFuture = ApiServices.getMovieDetails(widget.id);
    lightMode = true;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            size: 32,
          ),
          color: colors["soapstone"],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: movieFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  final movie = snapshot.data!;
                  List<String> genres = movie.genreToList();
                  return Column(
                    children: [
                      // poster film =============================================
                      Container(
                        width: width(context),
                        height: 280,
                        decoration: BoxDecoration(
                          color: lightMode
                              ? colors["cinder"]
                              : colors["soapstone"],
                          image: DecorationImage(
                            image: NetworkImage(ApiServices.imgDir + movie.img),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // rincian film =============================================
                      Container(
                        width: width(context),
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // header detail =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
                            Row(
                              children: [
                                SizedBox(
                                  width: 70 / 100 * width(context),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // judul & rating & duration ---------------------------------
                                      Row(
                                        // crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          // judul
                                          SizedBox(
                                            width: 43 / 100 * width(context),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                movie!.title,
                                                style: const TextStyle(
                                                    fontSize: 24),
                                                softWrap: false,
                                              ),
                                            ),
                                          ),

                                          // jarak antara judul dengan rating film
                                          SizedBox(
                                            width: 10,
                                          ),

                                          // rating & duration
                                          SizedBox(
                                            // width: 30 / 100 * width(context),
                                            child: Text(
                                              "${movie!.rating}  |  ${movie!.duration}min",
                                              // style: TextStyle(fontSize: 14),
                                              softWrap: true,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // genre & language --------------------------------------------------------
                                      Text(
                                          "${genres[0]}    ${genres.length >= 2 ? genres[1] + "    " : ""}${genres.length >= 3 ? genres[2] + "    " : ""}|    ${movie.languageStr()}"),
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: 20 / 100 * width(context),
                                  child: Container(
                                    width: 65,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: colors["light-grey"],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star_rounded,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          movie!.rate.toString(),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: colors["dove-grey"]!,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            // description --------------------------------------------
                            const Text(
                              "Description",
                              style: TextStyle(fontSize: 24),
                              // softWrap: false,
                            ),

                            const SizedBox(
                              height: 10,
                            ),

                            // description --------------------------------------------
                            Text(
                              movie.description!,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            Divider(
                              color: colors["light-grey"],
                            ),

                            const SizedBox(
                              height: 20,
                            ),

                            // cast ----------------------------------------------------
                            const Text(
                              "Cast",
                              style: TextStyle(fontSize: 24),
                              // softWrap: false,
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            // casts -----------------------------------------------------------
                            Container(
                              width: width(context),
                              height: 130,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (_, i) {
                                  return CastPhoto(cast: movie.casts![i]);
                                },
                                itemCount: movie.casts!.length,
                              ),
                            ),

                            SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }
                return Text("${snapshot.error}");
              },
            ),
          ],
        ),
      ),
      // get ticket ----------------------------------------------
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: width(context),
        margin: const EdgeInsets.only(bottom: 30),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SchedulePlacePage()));
          },
          child: const Text(
            "Get Ticket",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  // String _takeOfGenre(int n) {
  //   String genres = "";
  //   for (int i = 0; i < movie!.genres.length; i++) {
  //     genres +
  //   }
  // }
}

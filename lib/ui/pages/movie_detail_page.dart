part of "pages.dart";

class MovieDetailPage extends StatelessWidget {
  Movie movie;
  MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    lightMode = true;

    // jika tanggal rilis setelah hari
    bool isUpcoming = movie.start!.isAfter(DateTime.now());
    
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
            FutureBuilder<Movie>(
              future: ApiServices.getMovieDetails(movie.id),
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
                                            width: 40 / 100 * width(context),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Text(
                                                movie.title,
                                                style: const TextStyle(
                                                    fontSize: 24),
                                                softWrap: false,
                                              ),
                                            ),
                                          ),

                                          // jarak antara judul dengan rating film
                                          const SizedBox(
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
                                  // width: 20 / 100 * width(context),
                                  child: Container(
                                    width: 65,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: colors["light-grey"],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star_rounded,
                                          color: Colors.amber,
                                        ),
                                        Text(
                                          movie.rate.toString(),
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

                            const SizedBox(
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
      bottomSheet: !isUpcoming
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: width(context),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SchedulePlacePage()));
                },
                child: const Text(
                  "Get Ticket",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          : null,
    );
  }
}

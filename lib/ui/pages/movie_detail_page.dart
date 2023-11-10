part of "pages.dart";

class MovieDetailPage extends StatefulWidget {
  Movie movie;
  MovieDetailPage({super.key, required this.movie});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
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
            // poster film =============================================
            Container(
              width: width(context),
              height: 280,
              decoration: BoxDecoration(
                  color: lightMode ? colors["cinder"] : colors["soapstone"]),
            ),

            // rincian film =============================================
            Container(
              width: width(context),
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // header detail =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
                  Row(
                    children: [
                      SizedBox(
                        width: 70 / 100 * width(context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                      widget.movie.title,
                                      style: const TextStyle(fontSize: 24),
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
                                    "${widget.movie.rating}  |  ${widget.movie.duration}min",
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
                                "${widget.movie.genres[0]}    ${widget.movie.genres.length >= 2 ? widget.movie.genres[1] + "    " : ""}${widget.movie.genres.length >= 3 ? widget.movie.genres[2] + "    " : ""}|    ${widget.movie.language}"),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 20 / 100 * width(context),
                        child: Container(
                          width: 50,
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
                                widget.movie.rate.toString(),
                                style: TextStyle(
                                    fontSize: 14, color: colors["dove-grey"]!),
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
                    widget.movie.description,
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
                        return CastPhoto(name: widget.movie.casts[i]);
                      },
                      itemCount: widget.movie.casts.length,
                    ),
                  ),

                  // get ticket ----------------------------------------------
                  Container(
                    width: width(context),
                    margin: const EdgeInsets.only(bottom: 30),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        "Get Ticket",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // String _takeOfGenre(int n) {
  //   String genres = "";
  //   for (int i = 0; i < widget.movie.genres.length; i++) {
  //     genres +
  //   }
  // }
}

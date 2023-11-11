part of "pages.dart";

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Provider.of<TicketData>(context).add(
    //   Ticket(
    //     id: 1,
    //     createdDate: DateTime.now(),
    //     broadcastDate: DateTime.now(),
    //     cinema: "Ayam Geprek",
    //     studio: "Senyum Maniss",
    //     seats: ["B12", "B13"],
    //     used: true,
    //     movieId: 724846,
    //     userId: "1",
    //   ),
    // );
    Future<List<Movie>> nowPlaying = Provider.of<MovieData>(context).nowPlaying;
    Future<List<Movie>> comingSoon = Provider.of<MovieData>(context).comingSoon;
    lightMode = true;

    return Scaffold(
      appBar: AppBar(
        // hilangkan tombol back
        automaticallyImplyLeading: false,
        leading: null,

        toolbarHeight: 80, // tinggi appbar,

        // sesuaikan dengan light mode / dark mode
        backgroundColor: lightMode ? colors["soapstone"] : colors["cinder"],

        title: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(left: 10, right: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightMode ? colors["cinder"] : colors["soapstone"],
              ),
            ),
            Text(
              "Robert Pattinson",
              style: TextStyle(
                  fontSize: 18,
                  color: lightMode ? colors["cinder"] : colors["soapstone"]),
            ),
          ],
        ),
      ),

      // body ===================================================================================
      body: SingleChildScrollView(
        child: Container(
          color: lightMode ? colors["soapstone"] : colors["cinder"],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width(context),
                height: 230,
                decoration: BoxDecoration(
                  color: lightMode ? colors["cinder"] : colors["soapstone"],
                  image: const DecorationImage(
                    image: AssetImage("assets/movie-trailer.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // NOW PLAYING =====================================================
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Now Playing",
                  style: TextStyle(
                      fontSize: 20,
                      color:
                          lightMode ? colors["cinder"] : colors["soapstone"]),
                ),
              ),

              Container(
                height: 265,
                padding: const EdgeInsets.only(left: 20),
                child: FutureBuilder<List<Movie>>(
                  future: nowPlaying,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasData) {
                      final movies = snapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, i) {
                          return MoviePoster(
                            movie: movies[i],
                            width: 180,
                            height: 230,
                          );
                        },
                        itemCount: movies.length,
                      );
                    } else {
                      return const Text("There's no data.");
                    }
                  },
                ),
              ),

              // CATEGORY =====================================================
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Category",
                  style: TextStyle(
                      fontSize: 20,
                      color:
                          lightMode ? colors["cinder"] : colors["soapstone"]),
                ),
              ),

              Container(
                height: 105,
                padding: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) {
                    return GenreButton(genre: genres[i]);
                  },
                  itemCount: genres.length,
                ),
              ),

              // COMING SOON =====================================================
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Coming Soon",
                  style: TextStyle(
                      fontSize: 20,
                      color:
                          lightMode ? colors["cinder"] : colors["soapstone"]),
                ),
              ),

              FutureBuilder<List<Movie>>(
                future: comingSoon,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    final movies = snapshot.data!;
                    return Container(
                      height: 265,
                      padding: const EdgeInsets.only(left: 20),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, i) {
                          return MoviePoster(
                            movie: movies[i],
                            width: 180,
                            height: 230,
                          ).noRate();
                        },
                        itemCount: movies.length,
                      ),
                    );
                  } else {
                    return const Text("There's no data.");
                  }
                },
              ),

              // GET YOUR VOUCHER =====================================================
              Container(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Get your voucher here!",
                  style: TextStyle(
                      fontSize: 20,
                      color: lightMode ? colors["cinder"] : colors["soapstone"],
                      fontStyle: FontStyle.italic),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Container(
                  width: width(context),
                  height: 200,
                  decoration: BoxDecoration(
                    color: lightMode ? colors["cinder"] : colors["soapstone"],
                    image: const DecorationImage(
                      image: AssetImage("assets/promo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

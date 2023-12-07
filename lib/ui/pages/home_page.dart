part of "pages.dart";

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    User1? user;
    Future<List<Movie>> nowPlaying = Provider.of<MovieData>(context).nowPlaying;
    Future<List<Movie>> comingSoon = Provider.of<MovieData>(context).comingSoon;
    lightMode = true;

    return Scaffold(
      appBar: AppBar(
        // hilangkan tombol back
        automaticallyImplyLeading: false,
        leading: null,

        toolbarHeight: 80, // tinggi appbar,

        title: FutureBuilder<User1>(
            future: Provider.of<UserData>(context, listen: false)
                .getUser(FirebaseAuth.instance.currentUser!.email!),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                user = snapshot.data!;
              }
              return Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(left: 10, right: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.secondary,
                      image: DecorationImage(
                          image: NetworkImage(user?.profilePicture ?? "")),
                    ),
                  ),
                  Text(
                    user?.name ?? "",
                    style: TextStyle(
                      fontSize: 18,
                      // color: lightMode ? colors["cinder"] : colors["soapstone"],
                    ),
                  ),
                ],
              );

              return Text("Loading...");
            }),
      ),

      // body ===================================================================================
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width(context),
              height: 230,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
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
                ),
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
                ),
              ),
            ),

            Container(
              height: 105,
              padding: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, i) {
                  return GenreButton(genre: genres[i], pressed: false);
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
                ),
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
    );
  }
}

part of "widgets.dart";

class TicketTile extends StatelessWidget {
  Ticket ticket;
  TicketTile({super.key, required this.ticket});

  @override
  Widget build(BuildContext context) {
    Future<Movie> movieFuture = ApiServices.getMovieDetails(ticket.movieId);

    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: FutureBuilder<Movie>(
          future: movieFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              final movie = snapshot.data!;
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailTicket(
                        ticketId: ticket.id,
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    MoviePoster(
                      movie: movie,
                      width: 100,
                      height: 120,
                    ).noTitle().noRate(),
              
                    SizedBox(
                      height: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width(context)-100-80,
                            child: Text(
                              movie.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: colors["dove-grey"],
                                  fontFamily: "Raleway",
                              ),
                                  
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            DateFormat('EEE, dd MMMM yyyy').format(ticket.broadcastDate),
                            style:
                                TextStyle(fontSize: 18, color: colors["dove-grey"], fontFamily: "Oswald", fontWeight: FontWeight.w200
                            ),
                          ),
                          Text(
                            ticket.cinema,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 18,
                                color: colors["dove-grey"], fontFamily: "Raleway",
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }

            return const Text("There's no data.");
          }),
    );
  }
}

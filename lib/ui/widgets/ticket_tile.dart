part of "widgets.dart";

class TicketTile extends StatefulWidget {
  Ticket ticket;
  TicketTile({super.key, required this.ticket});

  @override
  State<TicketTile> createState() => _MovieTileState();
}

class _MovieTileState extends State<TicketTile> {
  @override
  Widget build(BuildContext context) {

    Movie movie = movies
              .where((movie) => movie.id == widget.ticket.movieId)
              .toList()[0];
              
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          MoviePoster(
            movie: movie,
            width: 100,
            height: 110,
          ).noTitle().noRate(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: colors["dove-grey"]
              ),),
              Text(
                widget.ticket.broadcastDate.day.toString() + " " +
                widget.ticket.broadcastDate.month.toString() + " " +
                widget.ticket.broadcastDate.year.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: colors["dove-grey"]
                ),
              ),
              Text(widget.ticket.cinema, style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 16,
                color: colors["dove-grey"]
              ),)
            ],
          )
        ],
      ),
    );
  }
}

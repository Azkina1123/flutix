// ignore_for_file: must_be_immutable

part of "pages.dart";

class DetailTicket extends StatelessWidget {
  int ticketId;
  DetailTicket({super.key, required this.ticketId});
  Movie? movie;

  @override
  Widget build(BuildContext context) {
    lightMode = true;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
          ),
        ),
        title: const Text(
          "Order Detail",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.normal),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: FutureBuilder<Ticket>(
                future: Provider.of<TicketData>(context, listen: false)
                    .getTicket(ticketId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    Ticket ticket = snapshot.data!;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FutureBuilder<Movie>(
                            future: ApiServices.getMovieDetails(ticket.movieId),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                movie = snapshot.data!;
                              }
                              return Text("gagal ambil data");
                            }),
                        Container(
                          width: 400,
                          height: 280,
                          margin: const EdgeInsets.only(
                              left: 40, right: 40, bottom: 0, top: 10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                Provider.of<MovieData>(context).imgDir +
                                    movie!.img,
                              ),
                            ),
                            color: Color.fromARGB(255, 242, 238, 238),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        Container(
                          width: 400,
                          height: 280,
                          margin: const EdgeInsets.only(
                              left: 40, right: 40, bottom: 0, top: 0),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 242, 238, 238),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  movie!.title,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Cinema",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    // SizedBox(width: 40),
                                    Text(
                                      ticket.cinema,
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Date & Time",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    // SizedBox(width: 16),
                                    Text(
                                      // "03 Sepetember 2023",
                                      DateFormat(' dd MMMM yyyy')
                                          .format(ticket.broadcastDate),
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      DateFormat('hh:mm')
                                          .format(ticket.broadcastDate),
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Seat",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    // SizedBox(width: 194),
                                    Text(
                                      ticket.seats.toString(),
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Studio",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    // SizedBox(width: 162),
                                    Text(
                                      ticket.studio.toString(),
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "ID Order",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    // SizedBox(width: 112),
                                    Text(
                                      ticket.id.toString(),
                                      textAlign: TextAlign.right,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                          thickness: 1,
                          indent: 48.0,
                          endIndent: 48.0,
                        ),
                        Container(
                          width: 400,
                          height: 70,
                          margin: const EdgeInsets.only(
                              left: 40, right: 40, bottom: 90, top: 0),
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage("assets/barcode.png"),
                              fit: BoxFit.fill,
                            ),
                            color: const Color.fromARGB(255, 242, 238, 238),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ],
                    );
                  }
                  return const CircularProgressIndicator();
                }),
          ),
        ],
      ),
    );
  }
}

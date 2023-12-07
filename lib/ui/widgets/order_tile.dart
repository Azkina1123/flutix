part of "widgets.dart";

class OrderTile extends StatelessWidget {
  final OrderData order;
  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        Provider.of<ThemeModeData>(context, listen: false).lightMode;
    String color = lightMode ? "black" : "white";
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: (!order.isTicket)
            ? const Text("")
            : FutureBuilder(
                future: Provider.of<TicketData>(context, listen: false)
                    .tickets
                    .doc(order.ticketId.toString())
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return FutureBuilder<Movie>(
                        future: ApiServices.getMovieDetails(
                            snapshot.data!.get("movieId")),
                        builder: (context, snapshot2) {
                          if (snapshot2.hasData) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/film-strip-$color.png"))),
                                  ),
                                  SizedBox(
                                    height: 80,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot2.data!.title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: colors["dove-grey"]),
                                        ),
                                        Text(
                                          DateFormat('EEE, dd MMMM yyyy')
                                              .format(order.createdDate),
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: colors["dove-grey"]),
                                        ),
                                        Text(
                                          snapshot.data!.get("cinema"),
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontSize: 16,
                                              color: colors["dove-grey"]),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          } else {
                            return Container();
                          }
                          ;
                        });
                  } else {
                    return Container();
                  }
                }));
  }
}

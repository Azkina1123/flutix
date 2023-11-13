part of "pages.dart";

class MyTicketPage extends StatefulWidget {
  const MyTicketPage({super.key});

  @override
  State<MyTicketPage> createState() => _MyTicketPageState();
}

class _MyTicketPageState extends State<MyTicketPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    lightMode = true;

    // List<Ticket> showedTickets = _index == 0
    //     ? tickets
    //         .where((ticket) => ticket.userId == login.id && !ticket.used)
    //         .toList()
    //     : tickets
    //         .where((ticket) => ticket.userId == login.id && ticket.used)
    //         .toList();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        surfaceTintColor: lightMode ? colors["soapstone"] : colors["cinder"],

        toolbarHeight: 100, //

        backgroundColor: lightMode ? colors["soapstone"] : colors["cinder"],
        title: Text(
          "My Ticket",
          style: TextStyle(
              fontSize: 24,
              color: lightMode ? colors["cinder"] : colors["soapstone"]),
        ),
      ),
      body: Consumer<TicketData>(builder: (context, ticketData, child) {
        return ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 130,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _switchSubMenu();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _index == 0
                            ? colors["cerulean-blue"]
                            : Theme.of(context).colorScheme.secondary,
                        foregroundColor: _index == 0
                            ? Colors.white
                            : Theme.of(context).colorScheme.onSecondary,
                      ),
                      child: const Text(
                        "New",
                        style: TextStyle(fontSize: 16),
                      ),
                    )),
                SizedBox(
                  width: 130,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _switchSubMenu();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _index == 1
                          ? colors["cerulean-blue"]
                          : Theme.of(context).colorScheme.secondary,
                      foregroundColor: _index == 1
                          ? Colors.white
                          : Theme.of(context).colorScheme.onSecondary,
                    ),
                    child: const Text("Used"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: ticketData.tickets
                    .where("used", isEqualTo: _index == 0 ? false : true)
                    .snapshots(),
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasData) {
                    return Column(
                      children: snapshot.data!.docs
                          .map(
                            (ticket) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailTicket(),
                                  ),
                                );
                              },
                              child: TicketTile(
                                ticket: Ticket(
                                  id: ticket.get("id"),
                                  createdDate:
                                      ticket.get("createdDate").toDate(),
                                  broadcastDate:
                                      ticket.get("broadcastDate").toDate(),
                                  cinema: ticket.get("cinema"),
                                  movieId: ticket.get("movieId"),
                                  used: ticket.get("used"),
                                  userId: ticket.get("userId"),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  }

                  return const Text("There's no data.");
                })
          ],
        );
      }),
    );
  }

  void _switchSubMenu() {
    _index = _index == 0 ? 1 : 0;
  }
}

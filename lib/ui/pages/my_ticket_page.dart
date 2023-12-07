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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        title: Text(
          "My Ticket",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: ListView(
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
          
          FutureBuilder<User1>(
              future: Provider.of<UserData>(context, listen: false)
                  .getUser(FirebaseAuth.instance.currentUser!.email!),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  User1 user = snapshot.data!;

                  return StreamBuilder<QuerySnapshot>(
                      stream: Provider.of<TicketData>(context, listen: false)
                          .tickets
                          .where("used", isEqualTo: _index == 0 ? false : true)
                          .where("userId", isEqualTo: user.id)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasData) {
                          return Column(
                            children: snapshot.data!.docs
                                .map(
                                  (ticket) => TicketTile(
                                    ticket: Ticket(
                                      id: ticket.get("id"),
                                      createdDate:
                                          ticket.get("createdDate").toDate(),
                                      broadcastDate: ticket
                                          .get("broadcastDate")
                                          .toDate(),
                                      cinema: ticket.get("cinema"),
                                      movieId: ticket.get("movieId"),
                                      used: ticket.get("used"),
                                      userId: ticket.get("userId"),
                                    ),
                                  ),
                                )
                                .toList(),
                          );
                        }

                        return const Text("There's no data.");
                      });
                }
                return Text("Gagal mengambil data dari database.", textAlign: TextAlign.center,);
              }),
        ],
      ),
    );
  }

  void _switchSubMenu() {
    _index = _index == 0 ? 1 : 0;
  }
}

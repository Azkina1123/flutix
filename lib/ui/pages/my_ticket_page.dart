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
          StreamBuilder<QuerySnapshot>(
              stream: Provider.of<TicketData>(context, listen: false)
                  .tickets
                  // .where("used", isEqualTo: _index == 0 ? false : true)
                  .where("userId",
                      isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary,);
                } else if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data!.docs.map(
                      (ticketDoc) {
                        Ticket ticket = Ticket(
                          id: ticketDoc.get("id"),
                          createdDate: ticketDoc.get("createdDate").toDate(),
                          broadcastDate:
                              ticketDoc.get("broadcastDate").toDate(),
                          cinema: ticketDoc.get("cinema"),
                          movieId: ticketDoc.get("movieId"),
                          used: ticketDoc.get("used"),
                          userId: ticketDoc.get("userId"),
                        );

                        bool used =
                            ticket.broadcastDate.isAfter(DateTime.now());

                        if (used && _index == 1) {
                          return TicketTile(ticket: ticket);
                        } 
                        return TicketTile(ticket: ticket);
                        
                      },
                    ).toList(),
                  );
                }

                return const Text("There's no data.");
              }),
        ],
      ),
    );
  }

  void _switchSubMenu() {
    _index = _index == 0 ? 1 : 0;
  }
}

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
            fontFamily: "Raleway",
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
                      style: TextStyle(fontSize: 18,
                        fontFamily: "Raleway",
                      ),
                      
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
                  child: const Text("Used", style: TextStyle(
                    fontSize: 18,
                      fontFamily: "Raleway",
                    ),),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          FutureBuilder<QuerySnapshot>(
              future: _index == 0
                  ? Provider.of<TicketData>(context, listen: false)
                      .tickets
                      .where("broadcastDate", isGreaterThan: DateTime.now())
                      .where("userId",
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .orderBy("broadcastDate", descending: true)
                      .get()
                  : Provider.of<TicketData>(context, listen: false)
                      .tickets
                      .where("broadcastDate",
                          isLessThanOrEqualTo: DateTime.now())
                      .where("userId",
                          isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .orderBy("broadcastDate", descending: true)
                      .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      color: colors["cerulean-blue"],
                    ),
                  );
                } else if (snapshot.hasData) {
                  final ticketDocs = snapshot.data!.docs;

                  return ticketDocs.isEmpty
                      ? Container(
                          width: width(context),
                          height: 200,
                          alignment: Alignment.center,
                          child: Text("There's no ticket added yet."),
                        )
                      : Column(
                          children: ticketDocs
                              .map(
                                (ticketDoc) => TicketTile(
                                  ticket: Ticket.fromJson(
                                      ticketDoc.data() as Map<String, dynamic>),
                                ),
                              )
                              .toList(),
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

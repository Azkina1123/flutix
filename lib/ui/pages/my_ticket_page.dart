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

    List<Ticket> showedTickets = _index == 0
        ? tickets
            .where((ticket) => ticket.userId == login.id && !ticket.used)
            .toList()
        : tickets
            .where((ticket) => ticket.userId == login.id && ticket.used)
            .toList();

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Text(
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
                  child: const Text("Used"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, i) {
                return TicketTile(ticket: showedTickets[i]);
              },
              itemCount: showedTickets.length,
            ),
          )
        ],
      ),
    );
  }

  void _switchSubMenu() {
    _index = _index == 0 ? 1 : 0;
  }
}

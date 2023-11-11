part of "pages.dart";

class MyWalletPage extends StatefulWidget {
  const MyWalletPage({super.key});

  @override
  State<MyWalletPage> createState() => _MyWalletPageState();
}

class _MyWalletPageState extends State<MyWalletPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        surfaceTintColor: lightMode ? colors["soapstone"] : colors["cinder"],

        toolbarHeight: 100, //

        backgroundColor: lightMode ? colors["soapstone"] : colors["cinder"],
        title: Text(
          "My Wallet",
          style: TextStyle(
              fontSize: 24,
              color: lightMode ? colors["cinder"] : colors["soapstone"],
              fontFamily: 'Raleway'),
        ),
      ),
      body: Consumer<TicketData>(builder: (context, ticketData, child) {
        return ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: 250,
                    margin: EdgeInsets.only(left: 50, right: 50),
                    alignment: Alignment.bottomLeft,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/my-wallet-bg.png"),
                            fit: BoxFit.fill))),
                Container(
                  alignment: Alignment.bottomLeft,
                  height: 250,
                  margin: const EdgeInsets.only(left: 50, right: 50),
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "RP 0,00",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w200),
                      ),
                      Text(
                        "Available Balance",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Oswald',
                            fontWeight: FontWeight.w100),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Padding(
                padding: EdgeInsets.only(left: 50),
                child: Text(
                  "Recent Transcation",
                  style: TextStyle(fontSize: 25, fontFamily: 'Raleway'),
                )),
                /*
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
                            (ticket) => TicketTile(
                              ticket: Ticket(
                                id: ticket.get("id"),
                                createdDate: ticket.get("createdDate").toDate(),
                                broadcastDate:
                                    ticket.get("broadcastDate").toDate(),
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
                })*/
          ],
        );
      }),
    );
  }
}

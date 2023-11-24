part of "pages.dart";

class MyWalletPage extends StatelessWidget {
  const MyWalletPage({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          "My Wallet",
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Raleway',
          ),
        ),
      ),
      body: Consumer<TicketData>(builder: (context, ticketData, child) {
        return ListView(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: 200,
                    margin: const EdgeInsets.only(left: 30, right: 30, top: 20),
                    alignment: Alignment.bottomLeft,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/my-wallet-bg.png"),
                            fit: BoxFit.fill))),
                Container(
                  alignment: Alignment.bottomLeft,
                  height: 220,
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FutureBuilder<User1>(
                          future: Provider.of<UserData>(context, listen: false)
                              .getUser(
                                  FirebaseAuth.instance.currentUser!.email!),
                          builder: (context, snapshot) {
                            return Text(
                              "RP.  ${(snapshot.hasData) ? snapshot.data!.balance.toString() : "0"}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontFamily: 'Oswald',
                                  fontWeight: FontWeight.w200),
                            );
                          }),
                      const Text(
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
                padding: EdgeInsets.only(left: 50, bottom: 20),
                child: Text(
                  "Recent Transcation",
                  style: TextStyle(fontSize: 25, fontFamily: 'Raleway'),
                )),
            const OrderTile(),
            const SizedBox(height: 80)
          ],
        );
      }),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: width(context),
        margin: const EdgeInsets.only(bottom: 30),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const TopUpPage()));
          },
          child: const Text(
            "Top Up",
            style: TextStyle(fontSize: 16, fontFamily: "Raleway"),
          ),
        ),
      ),
    );
  }
}

part of "pages.dart";

class SuccessCheckoutPage extends StatefulWidget {
  const SuccessCheckoutPage({super.key});

  @override
  State<SuccessCheckoutPage> createState() => _SuccessCheckoutPageState();
}

class _SuccessCheckoutPageState extends State<SuccessCheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 156, right: 156, top: 250, bottom: 0),
              child: Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Confetti.png"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Column(
              children: [
                const Padding(
                  padding:
                      EdgeInsets.only(left: 85, right: 85, top: 25, bottom: 0),
                  child: Text(
                    "Happy Watching!",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "You have successfully bought the ticket",
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colors["cerulean-blue"]!),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/ticket-white.png'),
                      const SizedBox(width: 20),
                      Text(
                        'My Ticket',
                        style: TextStyle(color: colors['soapstone']!),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  child: const Text("Back to Home",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Raleway')),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

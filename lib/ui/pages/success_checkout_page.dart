part of "pages.dart";

class Success_Checkout_Page extends StatefulWidget {
  const Success_Checkout_Page({super.key});

  @override
  State<Success_Checkout_Page> createState() => _Success_Checkout_PageState();
}

class _Success_Checkout_PageState extends State<Success_Checkout_Page> {
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
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/Confetti.png"),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 85, right: 85, top: 25, bottom: 0),
                  child: Text(
                    "Happy Watching!",
                    style: TextStyle(fontSize: 28),
                  ),
                ),
                SizedBox(height: 25),
                Text(
                  "You have successfully bought the ticket",
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colors["cerulean-blue"]!),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/ticket.png'),
                      Text('My Ticket'),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Back to Home",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

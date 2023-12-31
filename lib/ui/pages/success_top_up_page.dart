part of "pages.dart";

class SuccessTopUpPage extends StatelessWidget {
  const SuccessTopUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/confetti.png"),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 60),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 70),
                  child: Text(
                    "Wallet is Ready!",
                    style: TextStyle(fontSize: 28),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 90),
                  child: Text(
                    "You have successfully feed your wallet!",
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 25),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.popUntil(context,
                        ModalRoute.withName(Navigator.defaultRouteName));
                        
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyWalletPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colors["cerulean-blue"]!),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/my-wallet-white.png'),
                      const SizedBox(width: 20),
                      Text(
                        'My Wallet',
                        style: TextStyle(color: colors['soapstone']!),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  child: Text("Back to Home",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
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

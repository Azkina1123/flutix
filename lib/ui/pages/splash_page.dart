part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width(context),
        padding: const EdgeInsets.only(top: 120, bottom: 120),
        child: Column(
          children: [
            Container(
              width: 150,
              height: 200,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/flutix-logo.png"),
                      fit: BoxFit.cover),
                      ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 100, right: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("New Experience",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25, fontFamily: 'Raleway')),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Watch a new movie much easier than any before",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontFamily: 'Raleway')),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 400,
                    height: 45,
                    child: ElevatedButton(
                      child: const Text(
                        "Get Started",
                        style: TextStyle(fontSize: 25, fontFamily: 'Raleway'),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpPage()));
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 400,
                    child: TextButton(
                      child: const Text("Sign In to My Account",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Raleway')),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInPage()));
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

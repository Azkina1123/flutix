part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Theme
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Positioned(
                top: 30,
                right: 0,
                child: InkWell(
                  onTap: () {
                    final themeModeData = Provider.of<ThemeModeData>(context,
                          listen: false);
                        
                    themeModeData.changeTheme();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Icon(
                        Provider.of<ThemeModeData>(context, listen: false).lightMode ? Icons.dark_mode : Icons.light_mode),
                  ),
                ),
              ),
              Container(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("New Experience",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 25, fontFamily: 'Raleway')),
                        const SizedBox(
                          height: 20,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                              "Watch a new movie much easier than any before",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20, fontFamily: 'Raleway')),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          child: const Text(
                            "Get Started",
                            style:
                                TextStyle(fontSize: 18, fontFamily: 'Raleway'),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()));
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          // width: 400,
                          child: TextButton(
                            child: Text("Sign In to My Account",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    fontSize: 18,
                                    fontFamily: 'Raleway')),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInPage()));
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

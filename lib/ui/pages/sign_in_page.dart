part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool loading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 35, top: 35),
            child: Text(
              "Welcome Back,\nExplorer!",
              style: TextStyle(fontSize: 40, fontFamily: 'Raleway'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 90),
            child: TextBox(title: "Email Address", type: 1, controller: _emailController, readOnly: true, hintText: "Type Here"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: TextBox(title: "Password", type: 2, controller: _passwordController, readOnly: false),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 75, right: 35),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Continue to Sign In",
                    style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
                  ),
                  TextButton(
                      onPressed: () {
                        AutServices.signIn(
                                Provider.of<UserData>(context, listen: false)
                                    .email,
                                Provider.of<UserData>(context, listen: false)
                                    .password)
                            .then((User1? user1) async {
                          if (user1 == null) {
                            return;
                          }
                          print(Provider.of<UserData>(context, listen: false)
                              .email + "<<< EMAILLLL");

                          Provider.of<PageData>(context, listen: false)
                              .changeMenu(0);
                          await Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage()));
                        }).catchError((e) => print(e));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFFD9D9D9), shape: BoxShape.circle),
                        child: const Icon(Icons.keyboard_arrow_right_outlined,
                            size: 50),
                      ))
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 95),
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                },
                child: const Text(
                  "Create New Account",
                  style: TextStyle(
                      color: Colors.black, fontSize: 20, fontFamily: 'Raleway'),
                )),
          ),
        ],
      ),
    );
  }
}

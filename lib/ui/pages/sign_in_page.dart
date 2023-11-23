part of 'pages.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
          const Padding(
            padding: EdgeInsets.only(top: 90),
            child: TextBox(title: "Email Address", type: 1),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 35),
            child: TextBox(title: "Password", type: 2),
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
                        // UBAH EMAIL PASSWORD PAS UDH LOGIN UDAH JADI
                        AutServices.signIn("123@gmail.com", "123123");
                        // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
                        setState(() {
                          
                        });
                        Provider.of<PageData>(context, listen: false)
                            .changeMenu(0);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPage()));
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

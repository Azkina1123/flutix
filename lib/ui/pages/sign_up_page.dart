part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 51, bottom: 20, left: 37, right: 37),
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: lightMode ? colors['light-grey'] : colors['dove-grey'],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextBox(title: "Full Name", type: 3),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: TextBox(title: "Email Address", type: 1),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: TextBox(title: "Password", type: 2),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: TextBox(title: "Confirm Password", type: 2),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: CheckboxListTile(
              title: Text("I Agree to Privacy Police"),
              value: checkedValue,
              onChanged: (value) {
                setState(() {
                  checkedValue = value!;
                });
              },
              controlAffinity:
                  ListTileControlAffinity.leading, //  <-- leading Checkbox
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
            child: Container(
              width: width(context),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        // return loginPage();
                        return HomePage();
                      },
                    ));
                  });
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
                ),
              ),

              // ),
            ),
          )
        ],
      ),
    );
  }
}

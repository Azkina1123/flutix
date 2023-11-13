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
      appBar: AppBar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20, left: 37, right: 37),
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: lightMode ? colors['light-grey'] : colors['dove-grey'],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child: TextBox(title: "Full Name", type: 3),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 35),
            child: TextBox(title: "Email Address", type: 1),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 35),
            child: TextBox(title: "Password", type: 2),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 35),
            child: TextBox(title: "Confirm Password", type: 2),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: CheckboxListTile(
              title: const Text("I Agree to Privacy Police"),
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
          
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: width(context),
        margin: const EdgeInsets.only(bottom: 30),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SuccessAccountPage()));
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 16, fontFamily: "Raleway"),
          ),
        ),
      ),
      
    );
    
  }
}

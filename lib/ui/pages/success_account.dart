part of "pages.dart";

class SuccessAccountPage extends StatefulWidget {
  const SuccessAccountPage({super.key});

  @override
  State<SuccessAccountPage> createState() => _SuccessAccountPageState();
}

class _SuccessAccountPageState extends State<SuccessAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: width(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 50, bottom: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Your account is\nsuccessfully setted up!",
                  style: TextStyle(fontSize: 30, fontFamily: 'Raleway')),
              ),
            ),
            Column(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      color:
                          lightMode ? colors["cinder"]! : colors["soapstone"]!,
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                          image: AssetImage("assets/img/"))),
                ),
                const SizedBox(height: 20,),
                const Text("Nama_Orang_Signup",
                style: TextStyle(fontSize: 25, fontFamily: 'Raleway')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Continue to Sign In",
                      style: TextStyle(fontSize: 20, fontFamily: 'Raleway'),
                    ),
                    TextButton(
                        onPressed: () {
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
                              size: 40),
                        ))
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

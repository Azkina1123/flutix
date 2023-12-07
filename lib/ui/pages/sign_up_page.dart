part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool checkedValue = false;
  bool validatePass = false;
  bool loading = false;

  String fullName = "";
  String email = "";
  String password = "";
  String confPassword = "";
  String profilePicture = "";
  String imageUrl = '';

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _fullNameController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _confPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final snackBarPass = SnackBar(
      content: const Text("Confirm Password Must Be Same"),
      duration: const Duration(seconds: 3),
      padding: const EdgeInsets.all(10),
      backgroundColor: Theme.of(context).colorScheme.error,
    );

    final snackBarPrivacyPolice = SnackBar(
      content: const Text("Please Agree Privacy Policy"),
      duration: const Duration(seconds: 3),
      padding: const EdgeInsets.all(10),
      backgroundColor: Colors.amber.shade300,
    );

    final snackBarPassAndPP = SnackBar(
      content: const Text(
          "Confirm Password Must Be Same & Please Agree Privacy Policy"),
      duration: const Duration(seconds: 3),
      padding: const EdgeInsets.all(10),
      backgroundColor: Theme.of(context).colorScheme.error,
    );

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Center(
            child: InkWell(
              onTap: () async {
                // Membuat  dan menambahkan package image_picker
                final imgPicker =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

                if (imgPicker == null) return;

                String fileName =
                    DateTime.now().microsecondsSinceEpoch.toString();

                // Membua reference untuk menggambil folder root pada firebase storage
                Reference referenceRoot = FirebaseStorage.instance.ref();
                Reference referenceImages =
                    referenceRoot.child("user_profile_pic");

                // Membuat reference untuk mengupload gambar
                Reference referenceImageToUpload =
                    referenceImages.child(fileName);

                // Error handling
                try {
                  await referenceImageToUpload.putFile(File(imgPicker.path));
                  setState(() async {
                    imageUrl = await referenceImageToUpload.getDownloadURL();
                  });
                } catch (e) {}
              },
              child: imageUrl != ""
                  ? Container(
                      margin: const EdgeInsets.only(
                          bottom: 10, left: 37, right: 37),
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: lightMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.onSecondary,
                        image: DecorationImage(
                          image: NetworkImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(
                          bottom: 10, left: 37, right: 37),
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: lightMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.onSecondary,
                        image: const DecorationImage(
                          image: AssetImage("assets/profile-grey.png"),
                        ),
                      ),
                    ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: TextBox(title: "Full Name", type: 4, controller: _emailController, readOnly: false),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: TextBox(title: "Email Address", type: 1, controller: _fullNameController, readOnly: false, hintText: "Type Here"),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: TextBox(title: "Password", type: 2, controller: _passwordController, readOnly: false),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: TextBox(title: "Confirm Password", type: 3, controller: _confPasswordController, readOnly: false),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: CheckboxListTile(
              title: const Text(
                "I Agree to Privacy Police",
                style: TextStyle(
                    fontFamily: 'Raleway', fontWeight: FontWeight.w500),
              ),
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
            setState(() {
              email = Provider.of<UserData>(context, listen: false).email;
              fullName = Provider.of<UserData>(context, listen: false).fullName;
              profilePicture = imageUrl;
              confPassword =
                  Provider.of<UserData>(context, listen: false).confPassword;
              confPassword ==
                          Provider.of<UserData>(context, listen: false)
                              .password &&
                      confPassword != "" &&
                      Provider.of<UserData>(context, listen: false).password !=
                          ""
                  ? validatePass = !validatePass
                  : validatePass == true
                      ? password =
                          Provider.of<UserData>(context, listen: false).password
                      : password = "";
              validatePass == true && checkedValue == true
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserProfilePage(
                                email: email,
                                name: fullName,
                                password: password,
                                profilePath: imageUrl,
                              )))
                  : validatePass == true && checkedValue == false
                      ? ScaffoldMessenger.of(context)
                          .showSnackBar(snackBarPrivacyPolice)
                      : validatePass == false && checkedValue == true
                          ? ScaffoldMessenger.of(context)
                              .showSnackBar(snackBarPass)
                          : validatePass == false && checkedValue == false
                              ? ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBarPassAndPP)
                              : null;
            });
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

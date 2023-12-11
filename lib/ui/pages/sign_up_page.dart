part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool checkedValue = false;
  bool emptyValue = false;
  bool validatePass = false;
  bool loading = false;

  bool emailVal = false;
  bool fullNameVal = false;
  bool passwordVal = false;
  bool confPasswordVal = false;

  String fullName = "";
  String email = "";
  String password = "";
  String confPassword = "";
  String profilePicture = "";
  String imageUrl = '';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        Provider.of<UserData>(context, listen: false).email =
            _emailController.value.text;
        emailVal = _emailController.value.text.isNotEmpty;
      });
    });
    _fullNameController.addListener(() {
      setState(() {
        Provider.of<UserData>(context, listen: false).email =
            _fullNameController.value.text;
        fullNameVal = _fullNameController.value.text.isNotEmpty;
      });
    });
    _passwordController.addListener(() {
      setState(() {
        Provider.of<UserData>(context, listen: false).email =
            _passwordController.value.text;
        passwordVal = _passwordController.value.text.isNotEmpty;
      });
    });
    _confPasswordController.addListener(() {
      setState(() {
        Provider.of<UserData>(context, listen: false).email =
            _confPasswordController.value.text;
        confPasswordVal = _confPasswordController.value.text.isNotEmpty;
      });
    });
  }

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
      backgroundColor: Theme.of(context).colorScheme.error,
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
                } catch (e) {
                  print(e);
                }
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
            padding: const EdgeInsets.only(top: 20),
            child: TextBox(
                title: "Full Name",
                type: 5,
                controller: _fullNameController,
                readOnly: false),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: TextBox(
                title: "Email Address",
                type: 1,
                controller: _emailController,
                readOnly: false,
                hintText: "Type Here"),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: TextBox(
                title: "Password",
                type: 2,
                controller: _passwordController,
                readOnly: false),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: TextBox(
                title: "Confirm Password",
                type: 3,
                controller: _confPasswordController,
                readOnly: false),
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
          const Padding(padding: EdgeInsets.only(top: 65))
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: width(context),
        margin: const EdgeInsets.only(bottom: 30),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: emptyValue == false &&
                    validatePass == false &&
                    checkedValue == false
                ? MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary)
                : MaterialStateProperty.all(colors["cerulean-blue"]),
          ),
          onPressed: () {
            setState(() {
              setState(() => loading = true);
              Provider.of<UserData>(context, listen: false).email = _emailController.value.text;
              Provider.of<UserData>(context, listen: false).fullName = _fullNameController.value.text;
              Provider.of<UserData>(context, listen: false).password = _passwordController.value.text;
              Provider.of<UserData>(context, listen: false).confPassword = _confPasswordController.value.text;
              Provider.of<UserData>(context, listen: false).profilePicture = imageUrl;

              email = Provider.of<UserData>(context, listen: false).email;
              fullName = Provider.of<UserData>(context, listen: false).fullName;
              password = Provider.of<UserData>(context, listen: false).password;
              confPassword = Provider.of<UserData>(context, listen: false).confPassword;
              profilePicture = Provider.of<UserData>(context, listen: false).profilePicture;

              confPassword == password && confPassword != "" && password != ""
                  ? validatePass = !validatePass
                  : validatePass = false;

              !emailVal && !fullNameVal && !passwordVal && !confPasswordVal
                  ? emptyValue = !emptyValue
                  : emptyValue = false;

              if (emptyValue = true && validatePass == true && checkedValue == true) {
                setState(() => loading = false);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfilePage(
                      email: email,
                      name: fullName,
                      password: password,
                      profilePath: profilePicture,
                    ),
                  ),
                );
              }

              if (validatePass == true && checkedValue == false) {
                ScaffoldMessenger.of(context).showSnackBar(snackBarPrivacyPolice);

              } else if (validatePass == false && checkedValue == true) {
                ScaffoldMessenger.of(context).showSnackBar(snackBarPass);

              } else if (validatePass == false && checkedValue == false) {
                ScaffoldMessenger.of(context).showSnackBar(snackBarPass);
                ScaffoldMessenger.of(context).showSnackBar(snackBarPrivacyPolice);
              }
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

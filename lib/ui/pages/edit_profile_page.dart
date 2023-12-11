part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  final String id;
  final String email;
  final String name;
  final int balance;
  final String profilePicture;
  final List<String> genre;
  final String language;

  const EditProfilePage({
    super.key,
    required this.id,
    required this.email,
    required this.name,
    required this.balance,
    required this.profilePicture,
    required this.genre,
    required this.language,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool validatePass = false;
  bool emptyValue = false;
  bool loading = false;

  bool fullNameVal = false;
  bool passwordVal = false;
  bool confPasswordVal = false;

  String newFullName = "";
  String email = "";
  String password = "";
  String confPassword = "";
  String newProfilePicture = "";
  String imageUrl = "";

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
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

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 5, left: 5),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 24),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text("Edit Profile"),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const SizedBox(height: 30,),
          InkWell(
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
                        bottom: 10, left: 150, right: 150),
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
                        bottom: 10, left: 150, right: 150),
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: lightMode
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context).colorScheme.onSecondary,
                      image: DecorationImage(
                        image: NetworkImage(widget.profilePicture.toString()),
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: TextBox(
                title: "Full Name",
                type: 5,
                controller: _fullNameController,
                readOnly: true),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: TextBox(
                title: "Email Address",
                type: 1,
                controller: _emailController,
                readOnly: false,
                hintText: widget.email),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 55, left: 35),
            child: Text("Please input your password to confirm",
              style: TextStyle(
                fontFamily: 'Raleway',
                color: colors["cerulean-blue"],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: TextBox(
                title: "Password",
                type: 2,
                controller: _passwordController,
                readOnly: false),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: width(context),
        margin: const EdgeInsets.only(bottom: 30),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: !passwordVal
                ? MaterialStateProperty.all(
                    Theme.of(context).colorScheme.secondary)
                : MaterialStateProperty.all(colors["cerulean-blue"]),
          ),
          onPressed: () {
            setState(() async {
              try {
                Provider.of<UserData>(context, listen: false).fullName = _fullNameController.value.text;
                Provider.of<UserData>(context, listen: false).profilePicture = imageUrl != "" ? imageUrl : widget.profilePicture;
                Provider.of<UserData>(context, listen: false).password = _passwordController.value.text;

                newFullName = Provider.of<UserData>(context, listen: false).fullName;
                newProfilePicture = Provider.of<UserData>(context, listen: false) .profilePicture;
                password = _passwordController.value.text;

                !passwordVal ? emptyValue = !emptyValue
                    : emptyValue = false;
                    
                if (emptyValue == false) {
                  setState(() => loading = true);

                  User? result = FirebaseAuth.instance.currentUser;

                  final credential = EmailAuthProvider.credential(
                      email: widget.email,
                      password: password);

                  try {
                    await result!.reauthenticateWithCredential(credential).then((value) {
                    });
                    newFullName == "" ? newFullName = widget.name : null;
                    
                    User1 user = result.convertToUser(
                        docId: widget.id,
                        email: widget.email,
                        name: newFullName,
                        balance: widget.balance,
                        selectedGenres: widget.genre,
                        selectedLanguage: widget.language,
                        profilePicture: newProfilePicture);

                    UserService.updateUser(user);
                    
                    setState(() => loading = false);
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainPage(),
                      ),
                    );

                  } catch (e) {
                    print(e);
                  }

                } else {
                  ScaffoldMessenger.of(context).showSnackBar(snackBarPass);
                }
              } catch (e) {
                print(e);
              }
            });
          },
          child: const Text(
            "Change Profile",
            style: TextStyle(fontSize: 16, fontFamily: "Raleway"),
          ),
        ),
      ),
    );
  }
}

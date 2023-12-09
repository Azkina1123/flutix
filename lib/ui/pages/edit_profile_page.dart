part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  final String name;
  final String email;
  // final String password;
  final String profilePicture;
  final List<String> genre;
  final String language;

  const EditProfilePage({super.key, required this.name, required this.email, required this.profilePicture, required this.genre, required this.language,
  // required this.password
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool validatePass = false;
  bool loading = false;

  String newFullName = "";
  String email = "";
  String password = "";
  String confPassword = "";
  String imageUrl = "";

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confPasswordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _fullNameController.dispose();
    _passwordController.dispose();
    _confPasswordController.dispose();
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
            padding: const EdgeInsets.only(top: 10),
            child: TextBox(title: "Full Name", type: 5, controller: _fullNameController, readOnly: true),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: TextBox(title: "Email Address", type: 1, controller: _emailController , readOnly: false, hintText: widget.email),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: TextBox(title: "Password", type: 2, controller: _passwordController, readOnly: false),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: TextBox(title: "Confirm Password", type: 3, controller: _confPasswordController, readOnly: false),
          ),
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: width(context),
        margin: const EdgeInsets.only(bottom: 30),
        child: ElevatedButton(
          onPressed: () {
            setState(() async {
              try {
                //masih dalam tahap perbaikan...

                Provider.of<UserData>(context, listen: false).fullName = _fullNameController.value.text;
                Provider.of<UserData>(context, listen: false).password;
                
                // newFullName =
                // confPassword =
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
                // Provider.of<UserData>(context, listen: false).getUser(email);

              if (validatePass == true){
                UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: widget.email, password: password);

                User1 user = result.user!.convertToUser(
                    email: widget.email,
                    name: newFullName,
                    // password: password,
                    selectedGenres: widget.genre,
                    selectedLanguage: widget.language, profilePicture: widget.profilePicture);
                  
                  setState(() => loading = true);

                  UserService.updateUser(user);
                  
                  setState(() => loading = false);
                  // ignore: use_build_context_synchronously
                  
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
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

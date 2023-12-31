part of "pages.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User1? _user;
  @override
  Widget build(BuildContext context) {
    bool lightMode =
        Provider.of<ThemeModeData>(context, listen: false).lightMode;
    String color = lightMode ? "black" : "white";
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              FutureBuilder<User1>(
                  future: Provider.of<UserData>(context, listen: false)
                      .getUser(FirebaseAuth.instance.currentUser!.email!),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      _user = snapshot.data!;
                    }
                    return Container(
                      width: width(context),
                      padding: const EdgeInsets.only(top: 50, bottom: 30),
                      child: Column(
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image:
                                    NetworkImage(_user?.profilePicture ?? ""),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            _user?.name ?? "",
                            style: const TextStyle(fontSize: 18, fontFamily: "Raleway",
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            _user?.email ?? "",
                            style: const TextStyle(fontSize: 18, fontFamily: "Raleway",
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ListTile(
                                  leading: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage(
                                          "assets/edit-profile-$color.png"),
                                    )),
                                  ),
                                  title: const Text(
                                    "Edit Profile",
                                    style: TextStyle(fontSize: 18, fontFamily: "Raleway",
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              EditProfilePage(
                                                id: _user!.docId,
                                                email: _user!.email,
                                                name: _user!.name,
                                                balance: _user!.balance,
                                                genre: _user!.selectedGenres,
                                                language: _user!.selectedLanguage,
                                                profilePicture: _user!.profilePicture
                                                ),
                                        ));
                                  },
                                ),
                                ListTile(
                                  leading: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage(
                                          "assets/my-wallet-$color.png"),
                                    )),
                                  ),
                                  title: const Text(
                                    "My Wallet",
                                    style: TextStyle(fontSize: 18, fontFamily: "Raleway",
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MyWalletPage()));
                                  },
                                ),
                                ListTile(
                                  leading: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image:
                                          AssetImage("assets/help-$color.png"),
                                    )),
                                  ),
                                  title: const Text(
                                    "Help",
                                    style: TextStyle(fontSize: 18, fontFamily: "Raleway",
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage(
                                          "assets/language-$color.png"),
                                    )),
                                  ),
                                  title: const Text(
                                    "Change Language",
                                    style: TextStyle(fontSize: 18, fontFamily: "Raleway",
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image:
                                          AssetImage("assets/rate-$color.png"),
                                    )),
                                  ),
                                  title: const Text(
                                    "Rate Flutix",
                                    style: TextStyle(fontSize: 18, fontFamily: "Raleway",
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                                ListTile(
                                  leading: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage(
                                          "assets/logout-$color.png"),
                                    )),
                                  ),
                                  title: const Text(
                                    "Log Out",
                                    style: TextStyle(fontSize: 18, fontFamily: "Raleway",
                                    ),
                                  ),
                                  onTap: () {
                                    FirebaseAuth.instance.signOut();
                                    Provider.of<UserData>(context,
                                            listen: false)
                                        .email = "";
                                    Provider.of<UserData>(context,
                                            listen: false)
                                        .password = "";
                                    Navigator.popUntil(
                                        context,
                                        ModalRoute.withName(
                                            Navigator.defaultRouteName));
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SignInPage(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }),
              Positioned(
                top: 30,
                right: 0,
                child: InkWell(
                  onTap: () {
                    Provider.of<ThemeModeData>(context, listen: false)
                        .changeTheme();
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
                        Provider.of<ThemeModeData>(context, listen: false)
                                .lightMode
                            ? Icons.dark_mode
                            : Icons.light_mode),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

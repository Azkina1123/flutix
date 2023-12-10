part of 'pages.dart';

class UserProfilePage extends StatefulWidget {
  String email;
  String name;
  String password;
  String profilePath;

  UserProfilePage(
      {super.key,
      required this.email,
      required this.name,
      required this.password,
      required this.profilePath});
  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String selectLanguage = "";
  bool press = false;
  bool selectedBtn = true;
  bool btnSkip = false;
  bool loading = false;
  String genres = "";

  List<String> genreName = [
    "musical", "horror", "romance", "thriller", "action", "drama"
  ];

  List<String> selectGenres = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 25, left: 25),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 24),
                onPressed: () {
                  setState(() {
                    selectedBtn = false;
                    Provider.of<UserData>(context, listen: false).genres.clear();
                  });
                  Navigator.pop(context);
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25, bottom: 30, left: 55),
              child: Row(
                children: [
                  Text(
                    "Select Genre",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Raleway',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 110,
              width: width(context) - 30,
              padding: const EdgeInsets.only(left: 30),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, i) {
                  return GenreButton(genre: genreName[i], pressed: true);
                },
                itemCount: genreName.length,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 55, bottom: 5, left: 55),
              child: Text(
                "Select Language",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Raleway',
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              height: 240,
              width: width(context),
              padding: const EdgeInsets.only(left: 25),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: RadioListTile(
                            title: Text(
                              "English",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onBackground,
                                fontSize: 15,
                              ),
                            ),
                            value: "English",
                            groupValue: selectLanguage,
                            activeColor: colors["cerulean-blue"],
                            onChanged: (value) {
                              setState(() {
                                selectLanguage = value.toString();
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: RadioListTile(
                            title: Text(
                              "Indonesia",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onBackground,
                                fontSize: 15,
                              ),
                            ),
                            value: "Indonesia",
                            groupValue: selectLanguage,
                            activeColor: colors["cerulean-blue"],
                            onChanged: (value) {
                              setState(() {
                                selectLanguage = value.toString();
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: RadioListTile(
                            title: Text(
                              "Spanyol",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onBackground,
                                fontSize: 15,
                              ),
                            ),
                            value: "Spanyol",
                            groupValue: selectLanguage,
                            activeColor: colors["cerulean-blue"],
                            onChanged: (value) {
                              setState(() {
                                selectLanguage = value.toString();
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: RadioListTile(
                            title: Text(
                              "Turkey",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onBackground,
                                fontSize: 15,
                              ),
                            ),
                            value: "Turkey",
                            groupValue: selectLanguage,
                            activeColor: colors["cerulean-blue"],
                            onChanged: (value) {
                              setState(() {
                                selectLanguage = value.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: RadioListTile(
                            title: Text(
                              "한글",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onBackground,
                                fontSize: 15,
                              ),
                            ),
                            value: "Korean",
                            groupValue: selectLanguage,
                            activeColor: colors["cerulean-blue"],
                            onChanged: (value) {
                              setState(() {
                                selectLanguage = value.toString();
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: RadioListTile(
                            title: Text(
                              "France",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onBackground,
                                fontSize: 15,
                              ),
                            ),
                            value: "France",
                            groupValue: selectLanguage,
                            activeColor: colors["cerulean-blue"],
                            onChanged: (value) {
                              setState(() {
                                selectLanguage = value.toString();
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: RadioListTile(
                            title: Text(
                              "日本語",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onBackground,
                                fontSize: 15,
                              ),
                            ),
                            value: "Japanese",
                            groupValue: selectLanguage,
                            activeColor: colors["cerulean-blue"],
                            onChanged: (value) {
                              setState(() {
                                selectLanguage = value.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 25, right: 10),
                  child: SizedBox(
                    width: 80,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          btnSkip = !btnSkip;
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const SuccessAccountPage();
                            },
                          ));
                        });
                      },
                      child: const Text(
                        "Skip",
                        style: TextStyle(fontSize: 14, fontFamily: 'Raleway'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 25),
                  child: SizedBox(
                    width: 80,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          Provider.of<UserData>(context, listen: false).language = selectLanguage;

                          btnSkip == true
                              ? selectLanguage = "English"
                              : selectLanguage = selectLanguage;

                          setState(() => loading = true);

                          await AutServices.signUp(widget.email, widget.password, widget.name,
                              Provider.of<UserData>(context, listen: false).genres,
                              Provider.of<UserData>(context, listen: false).language, widget.profilePath);

                          setState(() => loading = false);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SuccessAccountPage(),
                            ),
                          );

                          Provider.of<UserData>(context, listen: false).genres.clear();

                          // newUser
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: loading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              "Next",
                              style: TextStyle(
                                  fontSize: 14, fontFamily: 'Raleway'),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

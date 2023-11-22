part of 'pages.dart';

class UserProfilePage extends StatefulWidget {
  String username;
  String name;
  String password;

  UserProfilePage({super.key, required this.username, required this.name, required this.password});
  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String? selectLanguage;
  String? selectGenre;
  bool press = false;
  bool btnSkip = false;
  bool loading = false;
  String genres = "";

  final _formKey = GlobalKey<FormState>();

    final List<String> selectGenres = [];

  handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    final email = Provider.of<UserData>(context, listen: false).email;
    final password = Provider.of<UserData>(context, listen: false).password;
    final fullName = Provider.of<UserData>(context, listen: false).fullName;
    final List<String> selectedGenres = selectGenres;
    String language = selectLanguage!;
    btnSkip == true ?
    language = selectLanguage!
    : language = "English";

    
    setState(() => loading = true);
    await AutServices.signUp(email, password, fullName, selectedGenres, language!);
    setState(() => loading = false);
  }

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
              padding: EdgeInsets.only(top: 25, bottom: 25, left: 25),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded, size: 24),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
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
              height: 140,
              width: width(context) - 30,
              padding: const EdgeInsets.only(left: 30),
              child:
              GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  GestureDetector(
                    child: GenreButton(genre: "musical", pressed: true),
                    onTap: () {
                      setState(() {
                        String genres = "musical";
                        selectGenres.add(genres);
                      });
                    },
                    ),
                  GestureDetector(
                    child: GenreButton(genre: "horror", pressed: true),
                    onTap: () {
                      setState(() {
                        String genres = "horror";
                        selectGenres.add(genres);
                      });
                    },
                    ),
                  GenreButton(genre: "romance", pressed: true),
                  GenreButton(genre: "thriller", pressed: true),
                  GenreButton(genre: "action", pressed: true),
                  GenreButton(genre: "drama", pressed: true),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 55, bottom: 25, left: 55),
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
              height: 230,
              width: width(context) - 30,
              padding: const EdgeInsets.only(left: 30),
              child: GridView(
                gridDelegate:
                    // SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 4),
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    child: Column(
                      children: [
                        RadioListTile(
                          title: Text(
                            "English",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
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
                        RadioListTile(
                          title: Text(
                            "Indonesia",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
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
                        RadioListTile(
                          title: Text(
                            "Spanyol",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
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
                        RadioListTile(
                          title: Text(
                            "Turkey",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
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
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        RadioListTile(
                          title: Text(
                            "한글",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                          value: "한글",
                          groupValue: selectLanguage,
                          activeColor: colors["cerulean-blue"],
                          onChanged: (value) {
                            setState(() {
                              selectLanguage = value.toString();
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text(
                            "France",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
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
                        RadioListTile(
                          title: Text(
                            "日本語",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                          value: "日本語",
                          groupValue: selectLanguage,
                          activeColor: colors["cerulean-blue"],
                          onChanged: (value) {
                            setState(() {
                              selectLanguage = value.toString();
                            });
                          },
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
                      style: ButtonStyle(
                        
                      ),
                      onPressed: () => handleSubmit(),
                      // onPressed: () {
                      //   setState(() {
                      //     Navigator.push(context, MaterialPageRoute(
                      //       builder: (context) {
                      //         return const SuccessAccountPage();
                      //       },
                      //     ));
                      //   });
                      // },
                      child: const Text(
                        "Next",
                        style: TextStyle(fontSize: 14, fontFamily: 'Raleway'),
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
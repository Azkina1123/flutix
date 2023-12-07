part of "providers.dart";

class UserData extends ChangeNotifier {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection("users");

  CollectionReference get users {
    return _users;
  }

  String email = "";
  String fullName = "";
  String password = "";
  String confPassword = "";
  String profilePicture = "";
  bool validatePass = false;
  List<String> genres = [];

  void userData(
      String emailVal,
      String fullNameVal,
      String passwordVal,
      String confPasswordVal,
      bool validatePassVal,
      List<String> selectedGenres,
      String profilePictureVal) {
    email = emailVal;
    fullName = fullNameVal;
    password = passwordVal;
    confPassword = confPasswordVal;
    validatePass = validatePassVal;
    genres = selectedGenres;
    profilePicture = profilePictureVal;
    notifyListeners();
  }

  // void add(User1 user) {
  //   int max = 99999999;
  //   int min = 10000000;
  //   int randomNumber = Random().nextInt(max - min + 1) + min;

  // _users.add({
  //   "id" : randomNumber,
  //   "email" : user.email,
  //   "name" : user.name,
  //   "password" : user.password,
  //   "selectedGenres" : user.selectedGenres,
  //   "selectedlanguage" : user.selectedLanguage,
  //   "profilePicture" : user.profilePicture,
  //   "balance" : user.balance,
  // });
  // }

  void update(User1 user) {
    _users.doc(user.docId).update({
      "email": user.email,
      "name": user.name,
      // "password": user.password,
      "profilePicture": user.profilePicture,
    });
  }

  Future<User1> getUser(String email) async {
    QuerySnapshot snapshot =
        await _users.where("email", isEqualTo: email).get();
    final userList = snapshot.docs;

    // if (userList[0].get("selectedGenres").)
    List<String> genres = List<String>.from(userList[0].get("selectedGenres"));

    User1 newUser = User1(
      userList[0].id,
      userList[0].get("id"),
      userList[0].get("email"),
      userList[0].get("name"),
      genres,
      userList[0].get("selectedLanguage"),
      userList[0].get("balance"),
      userList[0].get("profilePicture"),
    );

    // print(genres.toString() + "<<<<<");
    return newUser;
  }

  void calcBalance(String email, int calcValue) async {
    QuerySnapshot snapshot =
        await _users.where("email", isEqualTo: email).get();
    final userList = snapshot.docs;

    users
        .doc(userList[0].id)
        .update({'balance': calcValue + userList[0].get('balance')});

    notifyListeners();
  }
}

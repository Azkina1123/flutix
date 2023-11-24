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
  bool validatePass = false;

  void userData(String emailVal, String fullNameVal, String passwordVal,
      String confPasswordVal, bool validatePassVal) {
    email = emailVal;
    fullName = fullNameVal;
    password = passwordVal;
    confPassword = confPasswordVal;
    validatePass = validatePassVal;
    notifyListeners();
  }

  Future<User1> getUser(String email) async {
    QuerySnapshot snapshot =
        await _users.where("email", isEqualTo: email).get();
    final userList = snapshot.docs;

    List<String> genres = [];
    userList[0].get("selectedGenres").forEach((genre) {
      genres.add(genre as String);
    });

    User1 newUser = User1(
      userList[0].id,
      userList[0].get("id"),
      userList[0].get("email"),
      userList[0].get("name"),
      genres,
      userList[0].get("selectedLanguage"),
      userList[0].get("balance"),
      userList[0].get("password"),
      userList[0].get("profilePicture"),
    );

    return newUser;
  }

  void topupBalance(String email, int topUpValue) async {
    QuerySnapshot snapshot =
        await _users.where("email", isEqualTo: email).get();
    final userList = snapshot.docs;

    users
        .doc(userList[0].id)
        .update({'balance': topUpValue + userList[0].get('balance')});

    notifyListeners();
  }
}

part of "providers.dart";

class UserData extends ChangeNotifier {
  String email = "";
  String fullName = "";
  String password = "";
  String confPassword = "";
  bool validatePass = false;

  void userData(String emailVal, String fullNameVal, String passwordVal, String confPasswordVal, bool validatePassVal) {
    email = emailVal;
    fullName = fullNameVal;
    password = passwordVal;
    confPassword = confPasswordVal;
    validatePass = validatePassVal;
    notifyListeners();
  }
}
part of "providers.dart";

class ErrorText extends ChangeNotifier {
  String errorText= "";

  void errorChange(String text) {
    errorText = text;
    notifyListeners();
  }
}

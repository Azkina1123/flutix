part of "widgets.dart";

void showSnack(BuildContext context, String text, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(text),
    duration: const Duration(seconds: 3),
    padding: const EdgeInsets.all(10),
    backgroundColor: color,
  ));
}

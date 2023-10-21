part of "widgets.dart";

class Button extends StatefulWidget {
  void Function()? onPressed;
  Color backgroundColor;
  Color foregroundColor;
  Widget child;

  Button({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.child,
  });

  @override
  State<Button> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(widget.backgroundColor),
          foregroundColor: MaterialStateProperty.all(widget.foregroundColor),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          // padding:
          //     MaterialStateProperty.all(EdgeInsets.only(left: 20, right: 20)),
      ),
      child: widget.child,
      
    );
  }
}

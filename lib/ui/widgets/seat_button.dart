part of 'widgets.dart';

class seatButton extends StatefulWidget {
  String seat;
  bool selected;

  seatButton(
      {super.key,
      required this.seat,
      required this.selected});

  @override
  State<seatButton> createState() => _seatButtonState();
}

class _seatButtonState extends State<seatButton> {
  bool press = false;
  bool available = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          press = !press;
        },
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: widget.selected == true
                    ? colors['cerulean-blue']
                    : lightMode
                        ? colors['light-grey']
                        : colors['dark-jungle-green']),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                widget.seat,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Oswald',
                  fontWeight: FontWeight.w300,
                    color: widget.selected == true
                        ? colors['soapstone']
                        : available == true
                            ? colors['cinder']
                            : lightMode
                                ? colors['dove-grey']
                                : colors['dove-grey']),
              ),
            ),
          ),
        ),
      );
  }
}

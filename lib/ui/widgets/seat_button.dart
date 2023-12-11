part of 'widgets.dart';

class SeatButton extends StatefulWidget {
  String seat;
  bool avail;

  SeatButton(
      {super.key,
      required this.seat,
      required this.avail,
      });

  @override
  State<SeatButton> createState() => _SeatButtonState();
}

class _SeatButtonState extends State<SeatButton> {
  bool press = false;

  @override
  Widget build(BuildContext context) {
    return
    InkWell(
      onTap: () {
        setState(() {
          press = !press;

          press == true ?
            widget.avail == true ?
              Provider.of<TicketData>(context, listen: false).seats.add(widget.seat)
              : null
            : Provider.of<TicketData>(context, listen: false).seats.removeWhere((element) => element == widget.seat);
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: press == true
                  ? colors['cerulean-blue']
                  : Theme.of(context).colorScheme.secondary),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              widget.seat,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Oswald',
                fontWeight: FontWeight.w300,
                  color: press == true
                      ? Theme.of(context).colorScheme.primary
                      : widget.avail == true
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSecondary),
              ),
            ),
          ),
        ),
      );
  }
}
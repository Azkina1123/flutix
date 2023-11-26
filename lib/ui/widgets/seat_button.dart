part of 'widgets.dart';

class SeatButton extends StatefulWidget {
  String seat;
  // bool selected;

  SeatButton(
      {super.key,
      required this.seat,
      // required this.selected
      });

  @override
  State<SeatButton> createState() => _SeatButtonState();
}

class _SeatButtonState extends State<SeatButton> {
  bool press = false;
  bool available = true;
  // int seatCount = 0;

  List<String> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    return
    InkWell(
      onTap: () {
        setState(() {
          press = !press;

          press == true ?
          selectedSeats.add(widget.seat)
          : selectedSeats.removeWhere((element) => element == widget.seat);
          // Provider.of<TicketData>(context, listen: false).seats?.add(widget.seat)
          // : Provider.of<TicketData>(context, listen: false).seats?.removeWhere((element) => element == widget.seat);
          
          Provider.of<TicketData>(context, listen: false).seats = selectedSeats;
          // seatCount = Provider.of<TicketData>(context, listen: false).seats!.length;
          print(Provider.of<TicketData>(context, listen: false).seats);
        }

        // setState(() {
        //   press = !press;
        //   selectedSeats.add(widget.seat);
        //   Provider.of<TicketData>(context, listen: false).seats = selectedSeats;
        //   print(Provider.of<TicketData>(context, listen: false).seats);
        // }
        );
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
                      : available == true
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).colorScheme.onSecondary),
              ),
            ),
          ),
        ),
      );
  }
}

// part of 'widgets.dart';

// class SeatButton extends StatefulWidget {
//   String seat;
//   bool pressed;

//   SeatButton(
//       {super.key,
//       required this.seat,
//       required this.pressed,
//       });

//   @override
//   State<SeatButton> createState() => _SeatButtonState();
// }

// class _SeatButtonState extends State<SeatButton> {
//   bool available = false;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.all(5),
//         child: Container(
//           width: 40,
//           height: 40,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: widget.pressed == true
//                   ? colors['cerulean-blue']
//                   : lightMode
//                       ? colors['light-grey']
//                       : colors['dark-jungle-green']),
//           child: Align(
//             alignment: Alignment.center,
//             child: Text(
//               widget.seat,
//               style: TextStyle(
//                 fontSize: 20,
//                 fontFamily: 'Oswald',
//                 fontWeight: FontWeight.w300,
//                   color: widget.pressed == true
//                       ? colors['soapstone']
//                       : available == true
//                           ? colors['cinder']
//                           : lightMode
//                               ? colors['dove-grey']
//                               : colors['dove-grey']),
//               ),
//             ),
//           ),
//       );
//   }
// }

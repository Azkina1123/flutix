part of "providers.dart";

class TicketData extends ChangeNotifier {
  final CollectionReference _tickets =
      FirebaseFirestore.instance.collection("tickets");

  CollectionReference get tickets {
    return _tickets;
  }

  DateTime? createdDate;
  DateTime? broadcastDate;
  String? cinema;
  String? studio;
  List<String> seats = [];
  bool? used;
  int? movieId;

  void add(Ticket ticket) {
    int max = 99999999;
    int min = 10000000;
    int randomNumber = Random().nextInt(max - min + 1) + min;

    _tickets.add({
      "id": randomNumber,
      "createdDate": ticket.createdDate,
      "broadcastDate": ticket.broadcastDate,
      "cinema": ticket.cinema,
      "studio": ticket.studio,
      "seats": ticket.seats,
      "used": ticket.used,
      "movieId": ticket.movieId,
      "userId": ticket.userId,
    });
  }

  Future<Ticket> getTicket(int id) async {
    QuerySnapshot snapshot = await _tickets.where("id", isEqualTo: id).get();
    final ticketList = snapshot.docs;

    Ticket newTicket =
        Ticket.fromJson(ticketList[0].data() as Map<String, dynamic>);
    print(newTicket.id.toString() + "<<<<<<");
    return newTicket;
  }

  Future<List> getSeats() async {
    List seats = [];
    QuerySnapshot snapshot = await _tickets
    // .doc()
    // .orderBy('seats')
    .get();
    
    final seatList = snapshot.docs;

    // Ticket seats =
    //     Ticket.fromJson(seatList[0].data() as Map<String, dynamic>);

  // for (final i in seatList){
  //   seats
  //   // .add(
  //   //   seatList[i]
  //   //   )
  //   = seatList[i.get('seats')] as List
  //   ;
  // }
  //   print(seats.toString() + "<<<<<<");

    return seatList;
  }
}

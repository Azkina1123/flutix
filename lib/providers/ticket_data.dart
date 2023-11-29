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

    List<String> seats = [];
    ticketList[0].get("seats").forEach((seat) {
      seats.add(seat as String);
    });

    Ticket? newTicket = Ticket(
      id: ticketList[0].get("id"),
      movieId: ticketList[0].get("movieId"),
      broadcastDate: ticketList[0].get("broadcastDate").toDate(),
      cinema: ticketList[0].get("cinema"),
      createdDate: ticketList[0].get("createdDate").toDate(),
      userId: ticketList[0].get("userId"),
      seats: ticketList[0].get("seats"),
      used: ticketList[0].get("used"),
      studio: ticketList[0].get("studio"),
    );

    return newTicket;
  }
}

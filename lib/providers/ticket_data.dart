part of "providers.dart";

class TicketData extends ChangeNotifier {
  final CollectionReference _tickets =
      FirebaseFirestore.instance.collection("tickets");

  CollectionReference get tickets {
    return _tickets;
  }

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
      "userId": ticket.userId
    });
  }
}

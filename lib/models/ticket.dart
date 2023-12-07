part of "models.dart";

class Ticket {
  int id;
  DateTime createdDate;
  DateTime broadcastDate;
  String cinema;
  String studio;
  List<String> seats;
  bool used;
  int movieId;
  String userId;

  Ticket(
      {
      required this.id,
      required this.createdDate,
      required this.broadcastDate,
      required this.cinema,
      required this.studio,
      required this.seats,
      required this.used,
      required this.movieId,
      required this.userId,
      });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    Ticket ticket = Ticket(
      id: json["id"],
      createdDate: json["createdDate"].toDate(),
      broadcastDate: json["broadcastDate"].toDate(),
      cinema: json["cinema"],
      studio: json["studio"],
      seats: [],
      movieId: json["movieId"],
      used: json["used"],
      userId: json["userId"],
    );

    ticket.seats = List<String>.from(json["seats"]);

    return ticket;
  }
}

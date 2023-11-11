part of "models.dart";

class Ticket {
  int id;
  DateTime createdDate;
  DateTime broadcastDate;
  String cinema;
  String? studio;
  List<String>? seats;
  bool used;
  int movieId;
  String userId;

  Ticket({
    required this.id,
    required this.createdDate,
    required this.broadcastDate,
    required this.cinema,
    this.studio,
    this.seats,
    required this.used,
    required this.movieId,
    required this.userId
  });
}

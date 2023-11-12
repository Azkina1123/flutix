part of 'models.dart';

class Order {
  int id;
  String idUser;
  DateTime createdDate;
  bool isTicket;
  int totalPembayaran;
  int? ticketId;

  Order({
    required this.id,
    required this.idUser,
    required this.createdDate,
    required this.isTicket,
    required this.totalPembayaran,
    this.ticketId,
  });
}
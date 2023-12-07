part of 'models.dart';

class OrderData {
  int id;
  String idUser;
  DateTime createdDate;
  bool isTicket;
  int totalPembayaran;
  int? ticketId;

  OrderData({
    required this.id,
    required this.idUser,
    required this.createdDate,
    required this.isTicket,
    required this.totalPembayaran,
    this.ticketId,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    OrderData order = OrderData(
      id: json["id"],
      idUser: json["idUser"],
      createdDate: json["createdDate"].toDate(),
      isTicket: json["isTicket"],
      totalPembayaran: json["totalPembayaran"],
      ticketId: json["ticketId"],
    );

    return order;
  }
}
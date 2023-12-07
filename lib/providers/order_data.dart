part of "providers.dart";

class OrderDataProvider extends ChangeNotifier {
  final CollectionReference _orderProv =
      FirebaseFirestore.instance.collection("order");

  CollectionReference get orderProv {
    return _orderProv;
  }

  void add(int randomNumber, OrderData orders) {
    _orderProv.doc(randomNumber.toString()).set({
      "id": randomNumber,
      "idUser": orders.idUser,
      "createdDate": orders.createdDate,
      "isTicket" : orders.isTicket,
      "totalPembayaran" : orders.totalPembayaran,
      "ticketId" : orders.ticketId
    });
  }
}

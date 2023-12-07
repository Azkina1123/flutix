// ignore_for_file: prefer_interpolation_to_compose_strings

part of "pages.dart";

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    double diskon = 0.1;
    double totaldiskon =
        Provider.of<TicketData>(context, listen: false).seats.length *
            35000 *
            diskon;
    double totalbayar =
        Provider.of<TicketData>(context, listen: false).seats.length * 35000 -
            totaldiskon;
    bool topUp = false;
    int balance = 0;
    int randomNum = Random().nextInt(9000) + 1000;

    DateTime brodcastDate =
        Provider.of<TicketData>(context, listen: false).broadcastDate!;
    print(Provider.of<TicketData>(context, listen: false).movieId);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
          ),
        ),
        title: const Text(
          "Order Detail",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
        ),
      ),
      body: ListView(
        children: [
          FutureBuilder<Movie>(
              future: ApiServices.getMovieDetails(
                  Provider.of<TicketData>(context, listen: false).movieId!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  final movie = snapshot.data!;
                  return Column(children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, bottom: 10.0),
                      child: Text(
                        movie.title,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Cinema",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            Provider.of<TicketData>(context, listen: false)
                                    .cinema! +
                                ", " +
                                Provider.of<TicketData>(context, listen: false)
                                    .studio!,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Date & Time",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            DateFormat('EEEE, dd MMMM yyyy, hh:mm')
                                .format(brodcastDate),
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Seat",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            Provider.of<TicketData>(context, listen: false)
                                .seats
                                .toString(),
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Ticket",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              // SizedBox(width: 190),
                              Text(
                                "Price",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 3),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                Provider.of<TicketData>(context, listen: false)
                                        .seats
                                        .length
                                        .toString() +
                                    " tickets",
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              // SizedBox(width: 175),
                              const Text(
                                "IDR 35.000",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Divider(
                      thickness: 2,
                      indent: 20.0,
                      endIndent: 20.0,
                    ),
                    const SizedBox(height: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Voucher Added",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            // SizedBox(width: 120),
                            Padding(
                              padding: EdgeInsets.only(right: 20),
                              child: Text(
                                "-10%",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                "Total",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            // SizedBox(width: 200),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                "IDR " + totalbayar.toString(),
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 140),
                        Container(
                            width: 500,
                            height: 100,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 230, 229, 229),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      const Text(
                                        "Your Balance",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      FutureBuilder<User1>(
                                          future: Provider.of<UserData>(context,
                                                  listen: false)
                                              .getUser(FirebaseAuth.instance
                                                  .currentUser!.email!),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              balance = snapshot.data!.balance;
                                            }
                                            return Text(
                                              "RP.  ${(snapshot.hasData) ? snapshot.data!.balance.toString() : "0"}",
                                              style: TextStyle(
                                                  color: topUp
                                                      ? Colors.red
                                                      : Colors.black,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            );
                                          }),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 90),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (balance < totalbayar) {
                                        setState(() {
                                          topUp = true;
                                        });
                                      }
                                      if (topUp) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return const TopUpPage();
                                            },
                                          ),
                                        );
                                      } else {
                                        CollectionReference CheckoutCollection =
                                            FirebaseFirestore.instance
                                                .collection('tickets');
                                        Map<String, dynamic> checkoutData = {
                                          "id": randomNum,
                                          "createdDate":
                                              Provider.of<TicketData>(context,
                                                      listen: false)
                                                  .createdDate,
                                          "broadcastDate":
                                              Provider.of<TicketData>(context,
                                                      listen: false)
                                                  .broadcastDate,
                                          "cinema": Provider.of<TicketData>(
                                                  context,
                                                  listen: false)
                                              .cinema!,
                                          "studio": Provider.of<TicketData>(
                                                  context,
                                                  listen: false)
                                              .studio!,
                                          "seats": Provider.of<TicketData>(
                                                  context,
                                                  listen: false)
                                              .seats,
                                          "used": false,
                                          "movieId": movie.id,
                                          "userId": FirebaseAuth
                                              .instance.currentUser?.uid,
                                        };
                                        CheckoutCollection.doc(
                                                randomNum.toString())
                                            .set(checkoutData);

                                        CollectionReference orderCollection =
                                            FirebaseFirestore.instance
                                                .collection('order');
                                        Map<String, dynamic> checkoutOrder = {
                                          "id": randomNum,
                                          "idUser": FirebaseAuth
                                              .instance.currentUser?.uid,
                                          "createdDate":
                                              Provider.of<TicketData>(context,
                                                      listen: false)
                                                  .createdDate,
                                          "isTicket": true,
                                          "totalPembayaran": totalbayar,
                                          "ticketId": '$randomNum',
                                        };
                                        orderCollection
                                            .doc(randomNum.toString())
                                            .set(checkoutOrder);
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return const SuccessCheckoutPage();
                                            },
                                          ),
                                        );
                                      }
                                    },
                                    child: topUp
                                        ? const Text("Top Up Now")
                                        : const Text("Play Now >"),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    )
                  ]);
                }
                return const Text("gagal ambil data");
              }),
        ],
      ),
    );
  }
}

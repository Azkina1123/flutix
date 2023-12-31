part of 'pages.dart';

class PilihBangkuPage extends StatefulWidget {
  const PilihBangkuPage({super.key});

  @override
  State<PilihBangkuPage> createState() => _PilihBangkuPageState();
}

class _PilihBangkuPageState extends State<PilihBangkuPage> {
  List<String> seatNumber = [
    "A1", "A2", "A3", "A4", "A5", "A6",
    "B1", "B2", "B3", "B4", "B5", "B6",
    "C1", "C2", "C3", "C4", "C5", "C6",
    "D1", "D2", "D3", "D4", "D5", "D6",
    "E1", "E2", "E3", "E4", "E5", "E6",
    "F1", "F2", "F3", "F4", "F5", "F6",
    "G1", "G2", "G3", "G4", "G5", "G6",
    "H1", "H2", "H3", "H4", "H5", "H6"
  ];

  bool press = false;
  List<dynamic> selectedSeats = [];
  List<String> seats = [];

  void getSeats() async {
    await FirebaseFirestore.instance.collection('tickets').where('cinema', isEqualTo: 'Samarinda Square XXI')
    .get().then((value) {
      for (var i in value.docs){
        selectedSeats.add(i.data());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSeats();
    seats = Provider.of<TicketData>(context, listen:false).seats;
  }

  @override
  Widget build(BuildContext context) {
    int seatCount = seats.length;

    // final studio1 = selectedSeats
    // .where((element) {
    //   final getStudio = element['studio'].toString();
    //   final studio = getStudio.contains('Studio 3');
    //   return studio;
    // });

    // Iterable<dynamic> XXI = studio1;
    // var seatsData;
    // // if (XXI.isNotEmpty){
    // //   for (var i in XXI){
    //     seatsData = XXI.elementAt(0)['seats'];
    //   // }

    // print(XXI);
    // print(seatsData);

    // ambil data field seats aja dri semua document terus
    // masukkin semua seatsnya ke dalam list,
    // terus yg seat numbernya sama availnya jdi false

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('tickets').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');

        } else if (!snapshot.hasData) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(30),
              child: CircularProgressIndicator(),
            ),
          );

        } else if (snapshot.hasData) {
          // List<QueryDocumentSnapshot<Map<String, dynamic>>>
          // Map<String, dynamic>
          // data =
          // snapshot.data;
          // .data() as Map<String, dynamic>
          // ;
          // String seat = '${data['seats']}';

          // final seat = snapshot.hasData.toString().contains('seats') == true ?

          
          // Object? seat = snapshot.hasData.toString().contains('seats') == true
          // ? snapshot.data!.get('seats')
          // : '...';

          // final seat = snapshot.data!.docs.toString().contains('seats') == true
          // ? snapshot.data!.docs.map((doc) => doc['seats'])
          // : '...';
          
          // for (final i in snapshot.data!){
          //   List selectedSeats = snapshot.data!.[i];
          //   // .add(
          //   //   seatList[i]
          //   //   )
          //   // = seatList[i.get('seats')] as List
          //   ;
          // }

          // print(seat);
          
          return Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 5, top: 5, right: 20),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    setState(() {
                      Provider.of<TicketData>(context, listen: false).seats.clear();
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
              title: const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  "Select Seat",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            body: Column(
              children: [
                const SizedBox(height: 15),
                Stack(
                  children: [
                    Container(
                      width: width(context),
                      height: 485,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 100),
                        width: width(context),
                        height: 380,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(350),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: const [0.05, 0.13, 1],
                            colors: [
                              colors['cerulean-blue']!,
                              const Color.fromARGB(0, 189, 196, 239),
                              const Color.fromARGB(0, 79, 92, 175)
                            ],
                          ),
                          // color: Colors.transparent
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            color: Theme.of(context).colorScheme.background,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0, 0.12, 1],
                                colors: [
                                  Color.fromARGB(162, 81, 100, 224),
                                  Color.fromARGB(0, 79, 92, 175),
                                  Color.fromARGB(0, 79, 92, 175)
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                "Screen",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w500,
                                  color: colors['cerulean-blue'],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      right: 20,
                      child: Container(
                        margin: const EdgeInsets.only(top: 65, left: 20, right: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.center,
                                child: GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 6),
                                  shrinkWrap: true,
                                  itemBuilder: (_, i) {
                                    return SeatButton(seat: seatNumber[i], avail: true);
                                  },
                                  itemCount: seatNumber.length,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).colorScheme.secondary),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "A1",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w300,
                                color: lightMode
                                    ? Theme.of(context).colorScheme.onPrimary
                                    : Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Available"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: colors['cerulean-blue']),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "A1",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w300,
                                color: colors["soapstone"],
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Selected"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).colorScheme.secondary),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "A1",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context).colorScheme.onSecondary,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("Booked"),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            bottomSheet: Container(
              height: 120,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20.0))),
              child: Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(Provider.of<TicketData>(context, listen: false)
                                      .seats.isEmpty
                                      ? "Selected Seat -"
                                      : "Selected Seat ${seats.join('[]')}"),
                          Text(Provider.of<TicketData>(context, listen: false)
                                      .seats.isEmpty
                                      ? "0 Ticket"
                                      : "$seatCount Ticket"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: width(context) - 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CheckoutPage(),
                            ),
                          );
                        },
                        child: const Text("Pickup Seat",
                        style: TextStyle(
                          fontFamily: 'Raleway')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );

        }
        return const Center(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: CircularProgressIndicator(),
          ),
        );
      },
    );

  }
}

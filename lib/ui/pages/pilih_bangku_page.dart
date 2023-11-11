part of 'pages.dart';

class PilihBangku extends StatefulWidget {
  const PilihBangku({super.key});

  @override
  State<PilihBangku> createState() => _PilihBangkuState();
}

class _PilihBangkuState extends State<PilihBangku> {
  List<String> seatNumber = [
    "A1",
    "A2",
    "A3",
    "A4",
    "A5",
    "A6",
    "B1",
    "B2",
    "B3",
    "B4",
    "B5",
    "B6",
    "C1",
    "C2",
    "C3",
    "C4",
    "C5",
    "C6",
    "D1",
    "D2",
    "D3",
    "D4",
    "D5",
    "D6",
    "E1",
    "E2",
    "E3",
    "E4",
    "E5",
    "E6",
    "F1",
    "F2",
    "F3",
    "F4",
    "F5",
    "F6",
    "G1",
    "G2",
    "G3",
    "G4",
    "G5",
    "G6",
    "H1",
    "H2",
    "H3",
    "H4",
    "H5",
    "H6"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
              const Text(
                "Select Seat",
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
            ],
          ),
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
                      color: Colors.white,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(200),
                        // color: Colors.black45,
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
                            color: lightMode
                                ? colors['cerulean-blue']
                                : colors['cerulean-blue'],
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
                              return SeatButton(
                                  seat: seatNumber[i], selected: false);
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
          const SizedBox(height: 30),
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
                        color: lightMode
                            ? colors['light-grey']
                            : colors['dark-jungle-green']),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "A1",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w300,
                          color:
                              lightMode ? colors['cinder'] : colors['cinder'],
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
                        color: lightMode
                            ? colors['cerulean-blue']
                            : colors['cerulean-blue']),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "A1",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w300,
                          color: lightMode
                              ? colors['soapstone']
                              : colors['soapstone'],
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
                        color: lightMode
                            ? colors['light-grey']
                            : colors['dark-jungle-green']),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "A1",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Oswald',
                          fontWeight: FontWeight.w300,
                          color: lightMode
                              ? colors['dove-grey']
                              : colors['dove-grey'],
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
          const SizedBox(height: 45),
          Container(
            height: 120,
            width: double.maxFinite,
            decoration: BoxDecoration(
                color: lightMode
                    ? colors['light-grey']
                    : colors['dark-jungle-green'],
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20.0))),
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Selected Seat " + "-"),
                        Text(
                          //tampilkan jumlah tiket sesuai jumlah bangku yang dipilih
                          //tiket 0
                          "0"+" Ticket"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  SizedBox(
                    width: width(context) - 50,
                    child: ElevatedButton(
                      onPressed: () {
                      
                    }, child: const Text("Pickup Seat"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

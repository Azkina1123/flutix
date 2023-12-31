// ignore_for_file: deprecated_member_use, sort_child_properties_last, non_constant_identifier_names, avoid_unnecessary_containers, sized_box_for_whitespace

part of "pages.dart";

class SchedulePlacePage extends StatefulWidget {
  const SchedulePlacePage({super.key});

  @override
  State<SchedulePlacePage> createState() => _SchedulePlacePageState();
}

class _SchedulePlacePageState extends State<SchedulePlacePage> {
  String? selectedBioskop;
  List<String> bioskopList = [
    'Plaza Mulia CGV',
    'Samarinda Square XXI',
    'Big Mall XXI'
  ];
  List<String> StudioList = [
    'Studio 1',
    'Studio 2',
    'Studio 3',
    'Studio 4',
  ];
  String selectedTempat = 'Big Mall XXI';
  List<String> waktuTayang = ['12:00', '13:00', '16:00', '17:00', '19:00'];
  String selectedWaktu = " ";
  int selectedHari = 0;
  String selected = " ";

  @override
  Widget build(BuildContext context) {
    lightMode = true;
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
          "Schedule & Cinema",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                "Cinema",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
              indent: 20.0,
              endIndent: 20.0,
            ),
            const SizedBox(height: 10.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Selected Cinema:',
                  style: TextStyle(fontSize: 20),
                ),
                DropdownButton<String>(
                  value: selectedTempat,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTempat = newValue!;
                    });
                  },
                  items: bioskopList.map((String bioskop) {
                    return DropdownMenuItem<String>(
                      value: bioskop,
                      child: Text(bioskop),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Schedule",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
              ),
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
              indent: 20.0,
              endIndent: 20.0,
            ),
            SizedBox(
              height: 900,
              child: ListView.builder(
                // physics: ScrollPhysics(),
                shrinkWrap: true,
                itemCount: 7,
                itemBuilder: (context, index) {
                  String namaHari = DateFormat('EEE').format(DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day + index));
                  return Container(
                    height: 150,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                DateFormat('EEEE').format(DateTime(
                                    DateTime.now().year,
                                    DateTime.now().month,
                                    DateTime.now().day + index)),
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            // SizedBox(width: 180),
                            const Padding(
                              padding: EdgeInsets.only(right: 30),
                              child: Text(
                                "IDR 35.000",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 27, right: 27),
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                // crossAxisSpacing: 8.0,
                                // mainAxisSpacing: 8.0,
                                mainAxisSpacing: height(context) / 70,
                                crossAxisSpacing: 10,
                                mainAxisExtent: 40,
                              ),
                              itemCount: waktuTayang.length,
                              itemBuilder: (context, index2) {
                                return ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedWaktu = waktuTayang[index2];
                                      selectedHari = DateTime.now().day + index;
                                      selected = waktuTayang[index2] + namaHari;
                                    });
                                  },
                                  child: Text(waktuTayang[index2]),
                                  style: ElevatedButton.styleFrom(
                                    primary: selected ==
                                            waktuTayang[index2] + namaHari
                                        ? colors["cerulean-blue"]
                                        : Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 1000),
          ],
        ),
      ),
      bottomSheet: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: width(context),
          margin: const EdgeInsets.only(bottom: 30),
          child: ElevatedButton(
            onPressed: () {
              Provider.of<TicketData>(context, listen: false).createdDate =
                  DateTime.now();
              Provider.of<TicketData>(context, listen: false).broadcastDate =
                  DateTime.utc(DateTime.now().year, DateTime.now().month,
                      selectedHari, int.parse(selectedWaktu.substring(0, 2)));
              Provider.of<TicketData>(context, listen: false).cinema =
                  selectedTempat;
              Random random = Random();
              int index = random.nextInt(StudioList.length);
              Provider.of<TicketData>(context, listen: false).studio =
                  StudioList[index];
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PilihBangkuPage()));
            },
            child: const Text(
              "Get Seat",
              style: TextStyle(fontSize: 16, fontFamily: "Raleway"),
            ),
          )),
    );
  }
}

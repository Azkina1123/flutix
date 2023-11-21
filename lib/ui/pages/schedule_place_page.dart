// ignore_for_file: deprecated_member_use, sort_child_properties_last

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
  String selectedTempat = 'Big Mall XXI';
  List<String> waktuTayang = ['12:00', '13:00', '16:00', '17:00', '19:00'];
  int selectedIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              CupertinoIcons.back,
              color: Colors.black,
            ),
          ),
        ),
        title: const Text(
          "Schedule & Cinema",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.normal),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text(
              "Cinema",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.normal),
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
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.normal),
            ),
          ),
          const Divider(
            color: Colors.black,
            thickness: 1,
            indent: 20.0,
            endIndent: 20.0,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Sunday",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              // SizedBox(width: 180),
              Text(
                "IDR 45.000",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                // crossAxisSpacing: 8.0,
                // mainAxisSpacing: 8.0,
                mainAxisSpacing: height(context) / 70,
                crossAxisSpacing: 10,
                mainAxisExtent: 40,
              ),
              itemCount: waktuTayang.length,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedIdx = index;
                    });
                  },
                  child: Text(waktuTayang[index]),
                  style: ElevatedButton.styleFrom(
                    primary: selectedIdx == index ? Colors.blue : null,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Monday",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              // SizedBox(width: 175),
              Text(
                "IDR 35.000",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                // crossAxisSpacing: 8.0,
                // mainAxisSpacing: 8.0,
                mainAxisSpacing: height(context) / 70,
                crossAxisSpacing: 10,
                mainAxisExtent: 40,
              ),
              itemCount: waktuTayang.length,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedIdx = index + 5;
                    });
                  },
                  child: Text(waktuTayang[index]),
                  style: ElevatedButton.styleFrom(
                    primary: selectedIdx == index + 5 ? Colors.blue : null,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tuesday",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              // SizedBox(width: 170),
              Text(
                "IDR 35.000",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                // crossAxisSpacing: 8.0,
                // mainAxisSpacing: 8.0,
                mainAxisSpacing: height(context) / 70,
                crossAxisSpacing: 10,
                mainAxisExtent: 40,
              ),
              itemCount: waktuTayang.length,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedIdx = index + 10;
                    });
                  },
                  child: Text(waktuTayang[index]),
                  style: ElevatedButton.styleFrom(
                    primary: selectedIdx == index + 10 ? Colors.blue : null,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const PilihBangku();
                  },
                ),
              );
            },
            child: const Text("Get Seat"),
          )
        ],
      ),
    );
  }
}

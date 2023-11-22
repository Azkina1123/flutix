part of "pages.dart";

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  int _index = -1;
  final List<String> recom = [
    "IDR 35.000",
    "IDR 50.000",
    "IDR 100.000",
    "IDR 150.000",
    "IDR 200.000",
    "IDR 350.000",
    "IDR 500.000",
    "IDR 750.000"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: lightMode ? colors["soapstone"] : colors["cinder"],
        toolbarHeight: 80,
        backgroundColor: lightMode ? colors["soapstone"] : colors["cinder"],
        title: Text(
          "Top Up",
          style: TextStyle(
              fontSize: 24,
              color: lightMode ? colors["cinder"] : colors["soapstone"],
              fontFamily: 'Raleway'),
        ),
      ),
      body: ListView(
        children: [
          const TextBox(title: "Amount", type: 0, hint: "IDR"),
          const Padding(
            padding: EdgeInsets.all(35),
            child: Text(
              "Choose by Template",
              style: TextStyle(fontSize: 25, fontFamily: 'Raleway'),
            ),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
              height: 400,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: height(context) / 20,
                      crossAxisSpacing: 50,
                      mainAxisExtent: 50),
                  itemCount: recom.length,
                  itemBuilder: (BuildContext context, idx) {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _index = idx;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _index == idx
                            ? colors["cerulean-blue"]
                            : Theme.of(context).colorScheme.secondary,
                        foregroundColor: _index == idx
                            ? Colors.white
                            : Theme.of(context).colorScheme.onSecondary,
                      ),
                      child: Text(
                        recom[idx],
                        style: const TextStyle(fontFamily: 'Oswald'),
                      ),
                    );
                  }))
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: width(context),
        margin: const EdgeInsets.only(bottom: 30),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const SuccessTopUpPage()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _index != -1
                ? colors["cerulean-blue"]
                : Theme.of(context).colorScheme.secondary,
            foregroundColor: _index != -1
                ? Colors.white
                : Theme.of(context).colorScheme.onSecondary,
          ),
          child: const Text(
            "Top Up Now",
            style: TextStyle(fontSize: 16, fontFamily: "Raleway"),
          ),
        ),
      ),
    );
  }
}

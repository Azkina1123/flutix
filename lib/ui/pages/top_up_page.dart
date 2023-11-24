part of "pages.dart";

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  final List<String> recom = [
    "35000",
    "50000",
    "100000",
    "150000",
    "200000",
    "350000",
    "500000",
    "750000"
  ];

  final TextEditingController _topUpAmount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text(
          "Top Up",
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Raleway',
          ),
        ),
      ),
      body: ListView(
        children: [
          TextBox(title: "Amount", type: 4, controller: _topUpAmount),
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
                          Provider.of<TopUpSelectionData>(context,
                                  listen: false)
                              .changeSelection(idx);
                          _topUpAmount.text = "";
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Provider.of<TopUpSelectionData>(
                                        context,
                                        listen: false)
                                    .templateSelected ==
                                idx
                            ? colors["cerulean-blue"]
                            : Theme.of(context).colorScheme.secondary,
                        foregroundColor: Provider.of<TopUpSelectionData>(
                                        context,
                                        listen: false)
                                    .templateSelected ==
                                idx
                            ? Colors.white
                            : Theme.of(context).colorScheme.onSecondary,
                      ),
                      child: Text(
                        "IDR ${recom[idx]}",
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
          onPressed: () async {
            if (_topUpAmount.text == "" &&
                Provider.of<TopUpSelectionData>(context, listen: false)
                        .templateSelected ==
                    -1) {
              return;
            }

            Provider.of<UserData>(context, listen: false).topupBalance(
                FirebaseAuth.instance.currentUser!.email!,
                int.parse(_topUpAmount.text != ""
                    ? _topUpAmount.text
                    : recom[
                        Provider.of<TopUpSelectionData>(context, listen: false)
                            .templateSelected]));

            Provider.of<TopUpSelectionData>(context, listen: false)
                .changeSelection(-1);

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const SuccessTopUpPage()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: _topUpAmount.text != "" ||
                    Provider.of<TopUpSelectionData>(context, listen: false)
                            .templateSelected !=
                        -1
                ? colors["cerulean-blue"]
                : Theme.of(context).colorScheme.secondary,
            foregroundColor: _topUpAmount.text != "" ||
                    Provider.of<TopUpSelectionData>(context, listen: false)
                            .templateSelected !=
                        -1
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

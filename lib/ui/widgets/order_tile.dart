part of "widgets.dart";

class OrderTile extends StatelessWidget {
  const OrderTile({super.key});

  @override
  Widget build(BuildContext context) {
        bool lightMode =
        Provider.of<ThemeModeData>(context, listen: false).lightMode;
    String color = lightMode ? "black" : "white";
    return Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            for (int i = 0; i < orders.length; i++)
              if (!orders[i].isTicket)
                const Text("")
              else if (orders[i].isTicket)
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("film-strip-$color.png"))),
                      ),
                      SizedBox(
                        height: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Harusnya judul film",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: colors["dove-grey"]),
                            ),
                            Text(
                              DateFormat('EEE, dd MMMM yyyy').format(orders[i].createdDate),
                              style:
                                  TextStyle(fontSize: 16, color: colors["dove-grey"]),
                            ),
                            Text(
                              "Harusnya Cinema",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 16,
                                  color: colors["dove-grey"]),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
          ],
        )
        // child: ListView.builder(
        //     itemCount: orders.length,
        //     // belum userSpecific
        //     itemBuilder: (context, i) {

        //     }),
        );
  }
}

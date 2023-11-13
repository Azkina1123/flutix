part of "pages.dart";

class DetailTicket extends StatefulWidget {
  const DetailTicket({super.key});

  @override
  State<DetailTicket> createState() => _DetailTicketState();
}

class _DetailTicketState extends State<DetailTicket> {
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
          "Order Detail",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.normal),
        ),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 400,
                  height: 230,
                  margin: EdgeInsets.only(left: 40, right: 40, bottom: 0, top: 10),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/midnight_runners.jpeg"),
                      fit: BoxFit.fill,
                    ),
                    color: Color.fromARGB(255, 242, 238, 238),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
                Container(
                  width: 400,
                  height: 280,
                  margin: EdgeInsets.only(left: 40, right: 40, bottom: 0, top: 0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 242, 238, 238),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Midnight Runners',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                          children: [
                            Text(
                              "Cinema",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            // SizedBox(width: 40),
                            Text(
                              "Samarinda Square XXI",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Date & Time",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            // SizedBox(width: 16),
                            Text(
                              "03 Sepetember 2023",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                  
                          children: [
                            Text(
                              "15:30",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                          children: [
                            Text(
                              "Seat",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            // SizedBox(width: 194),
                            Text(
                              "D4, D5",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                          children: [
                            Text(
                              "Studio",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            // SizedBox(width: 162),
                            Text(
                              "Studio 2",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                          children: [
                            Text(
                              "ID Order",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // SizedBox(width: 112),
                            Text(
                              "1826158272",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 1,
                  indent: 48.0,
                  endIndent: 48.0,
                  
                ),
                Container(
                  width: 400,
                  height: 70,
                  margin: EdgeInsets.only(left: 40, right: 40, bottom: 90, top: 0),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/barcode.png"),
                      fit: BoxFit.fill,
                    ),
                    color: Color.fromARGB(255, 242, 238, 238),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

part of "pages.dart";

class MovieDetailPage extends StatefulWidget {
  Movie movie;
  MovieDetailPage({super.key, required this.movie});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: width(context),
                  height: 280,
                  decoration: BoxDecoration(
                      color: lightMode ? colors["cinder"] : colors["soapstone"]),
                ),

                Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Expanded(
                    child: Row(
                      children: [
                        Text(
                          // widget.movie.title, 
                          "Midnight Runners Midnight Runners",
                          style: TextStyle(fontSize: 26),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                                  
                        // SizedBox(width: 20,),
                        // Text(widget.movie.rating + " | " + widget.movie.duration.toString() + "min")
                      ],
                    ),
                  ),
                )
              ],
            ),
      
            // TOMBOL BACK ============================================
            Container(
              // width: width(context),
              height: 100,
              padding: EdgeInsets.only(left: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 32,
                ),
                color: colors["soapstone"],
              ),
            )
          ],
        ),
      ),
    );
  }
}

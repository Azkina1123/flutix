part of "widgets.dart";

class MoviePoster extends StatefulWidget {
  Movie movie;
  double width;
  double height;

  bool isTitle = true;
  bool isRate = true;

  MoviePoster(
      {super.key,
      required this.movie,
      required this.width,
      required this.height});

  @override
  State<MoviePoster> createState() => _MoviePosterState();

  MoviePoster noTitle() {
    isTitle = false;
    return this;
  }

  MoviePoster noRate() {
    isRate = false;
    return this;
  }
}

class _MoviePosterState extends State<MoviePoster> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: widget.width,
            height: widget.height,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                color: lightMode ? Colors.black : Colors.white,
                image: DecorationImage(image: AssetImage(widget.movie.img)),
                borderRadius: BorderRadius.circular(10)),
          ),
          Container(
            width: widget.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.isTitle
                    ? Text(
                        widget.movie.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16,
                            color: lightMode ? Colors.black : Colors.white),
                      )
                    : SizedBox(),
                widget.isRate
                    ? Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.green,
                          ),
                          Text(
                            widget.movie.rate.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: lightMode ? Colors.black : Colors.white),
                          ),
                        ],
                      )
                    : SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }
}

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
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MovieDetailPage(movie: widget.movie);
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            Container(
              width: widget.width,
              height: widget.height,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  image: DecorationImage(
                    image: NetworkImage(
                      Provider.of<MovieData>(context).imgDir + widget.movie.img,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10)),
            ),
            Container(
              width: widget.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.isTitle
                      ? Container(
                          width: widget.isRate ? 100 : 170,
                          child: Text(
                            widget.movie.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: "Raleway",
                            ),
                          ),
                        )
                      : const SizedBox(),
                  widget.isRate
                      ? Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text(
                              widget.movie.rate.toString(),
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )
                      : const SizedBox()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

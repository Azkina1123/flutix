part of "widgets.dart";

class GenreButton extends StatefulWidget {
  String genre;
  bool pressed;
  GenreButton({super.key, required this.genre, required this.pressed});

  @override
  State<GenreButton> createState() => _GenreButtonState();
}

class _GenreButtonState extends State<GenreButton> {
  String img = "";
  bool press = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          setState(() {
            press = !press;

            press == true
                ? Provider.of<UserData>(context, listen: false)
                    .genres
                    .add(widget.genre)
                : Provider.of<UserData>(context, listen: false)
                    .genres
                    .remove(widget.genre);
          });
        },
        child: Container(
          margin: const EdgeInsets.only(right: 20),
          child: Column(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.pressed == true
                        ? press == true
                            ? colors["cerulean-blue"]
                            : Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.secondary,
                    boxShadow: [
                      BoxShadow(
                          color: widget.pressed == true
                              ? press == true
                                  ? colors["cerulean-blue"]!
                                  : Colors.transparent
                              : Colors.transparent,
                          blurRadius: 6),
                    ],
                    image: DecorationImage(
                        image: AssetImage(press == true
                            ? "assets/${widget.genre.toLowerCase()}-white.png"
                            : "assets/${widget.genre.toLowerCase()}.png"))),
              ),
              Text(
                widget.genre.toTitleCase(),
                style: TextStyle(
                    fontSize: 16,
                    color: widget.pressed == true
                        ? press == true
                            ? colors["cerulean-blue"]
                            : lightMode
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).colorScheme.onSecondary
                        : lightMode
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSecondary),
              )
            ],
          ),
        ),
      ),
    );
  }
}

part of "widgets.dart";

class GenreButton extends StatefulWidget {
  String genre;
  GenreButton({super.key, required this.genre});

  @override
  State<GenreButton> createState() => _GenreButtonState();
}

class _GenreButtonState extends State<GenreButton> {
  String img = "";

  @override
  Widget build(BuildContext context) {
    switch (widget.genre.toLowerCase()) {
      case "musical":
        img = "";

      case "horror":
        img = "";

      case "romance":
        img = "";

      case "thriller":
        img = "";

      case "action":
        img = "";

      case "drama":
        img = "";
    }
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightMode
                    ? colors["light-grey"]
                    : colors["dark-jungle-green"],
                image: DecorationImage(
                  image: AssetImage("assets/logo/$img")
                )
            ),
          ),
          Text(
            widget.genre.toTitleCase(), 
            style: TextStyle(
              fontSize: 16,
              color: lightMode ? Colors.black : colors["dove-grey"]
            ),
          )
        ],
      ),
    );
  }
}
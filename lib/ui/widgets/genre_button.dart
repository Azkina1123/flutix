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
    
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary,
                image: DecorationImage(
                  image: AssetImage("assets/${widget.genre.toLowerCase()}.png")
                )
            ),
          ),
          Text(
            widget.genre.toTitleCase(), 
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onSecondary
            ),
          )
        ],
      ),
    );
  }
}

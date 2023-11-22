part of "widgets.dart";

class CastPhoto extends StatelessWidget {
  Cast cast;
  CastPhoto({super.key, required this.cast});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: lightMode ? Colors.black : Colors.white,
              image: DecorationImage(
                image: NetworkImage(ApiServices.imgDir + cast.img),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                cast.name,
                softWrap: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

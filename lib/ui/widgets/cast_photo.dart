part of "widgets.dart";

class CastPhoto extends StatelessWidget {
  String name;
  CastPhoto({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
                color: lightMode ? Colors.black : Colors.white,
                image: DecorationImage(image: AssetImage("assets/img/"))),
          ),
          Text(
            name,
          )
        ],
      ),
    );
  }
}
